# Both backends carry the same JSON-RPC requests, replies and progress notifications.
.gf_json <- function(x) jsonlite::toJSON(x, auto_unbox = TRUE, null = "null", na = "null", digits = NA)
.gf_decode <- function(x) jsonlite::fromJSON(x, simplifyVector = FALSE)
.gf_abort <- function(failure) {
    stop(structure(list(message = failure$message, call = NULL, code = failure$code,
        retryable = isTRUE(failure$retryable), details = failure), class = c("genefox_error", "error", "condition")))
}
.gf_path <- function(x) normalizePath(x, winslash = "/", mustWork = FALSE)

gf_session <- function(resources = NULL, output, library = Sys.getenv("GENEFOX_NATIVE_LIBRARY"),
                       backend = c("native", "cli"), binary = "genefox", cache = NULL, timeout = 900, runtime = NULL, imported_store = NULL, allow_roots = character()) {
    if (!is.null(runtime)) {
        if (!missing(resources) || !missing(library) || !missing(binary)) stop("Supply runtime= alone; explicit library/binary/resources would break the matched bundle.")
        selected <- gf_runtime(runtime)
        resources <- selected$resources; library <- selected$library; binary <- selected$binary
    }
    if (is.null(resources)) stop("Supply resources= or runtime=.")
    backend <- match.arg(backend)
    stopifnot(length(timeout) == 1L, is.finite(timeout), timeout > 0)
    s <- new.env(parent = emptyenv())
    s$backend <- backend; s$busy <- FALSE; s$id <- 0; s$timeout <- timeout; s$closed <- FALSE
    s$output <- .gf_path(output); s$queue <- list(); s$stderr <- character(); s$output_buffer <- raw()
    config <- list(resources = .gf_path(resources), output = s$output)
    if (!is.null(cache)) config$cache <- .gf_path(cache)
    if (!is.null(imported_store)) config$imported_store <- .gf_path(imported_store)
    if (!is.character(allow_roots) || anyNA(allow_roots) || length(allow_roots) > 64L) stop("Supply at most 64 explicit read roots.")
    if (length(allow_roots)) config$allow_roots <- unname(as.list(vapply(allow_roots, .gf_path, "")))
    if (backend == "native") {
        if (!nzchar(library)) stop("Provide library= or GENEFOX_NATIVE_LIBRARY.")
        s$native <- .Call("gf_open", normalizePath(library, mustWork = TRUE), .gf_json(config), PACKAGE = "genefox")
    } else {
        if (!requireNamespace("processx", quietly = TRUE)) stop("CLI transport requires processx.")
        args <- c("mcp", "--no-model-tools", "--resources", config$resources, "--output-dir", config$output)
        if (!is.null(cache)) args <- c(args, "--cache-dir", config$cache)
        if (!is.null(imported_store)) args <- c(args, "--imported-store", config$imported_store)
        for (path in config$allow_roots) args <- c(args, "--allow-root", path)
        s$process <- processx::process$new(binary, args, stdin = "|", stdout = "|", stderr = "|", cleanup_tree = TRUE, encoding = "UTF-8")
    }
    class(s) <- "gf_session"
    reg.finalizer(s, function(x) try(gf_close(x), silent = TRUE), onexit = TRUE)
    tryCatch({
        init <- .gf_request(s, "initialize", list(protocolVersion = "2024-11-05", capabilities = structure(list(), names = character()),
            clientInfo = list(name = "genefox-r", version = as.character(utils::packageVersion("genefox")))))
        if (!identical(init$protocolVersion, "2024-11-05")) stop("Unsupported GeneFox protocol contract.")
        s$runtime <- init$serverInfo
        .gf_send(s, list(jsonrpc = "2.0", method = "notifications/initialized"))
        tools <- .gf_request(s, "tools/list")$tools
        tools <- Filter(function(tool) !isTRUE(tool$`_meta`$genefox_requires_main_actor), tools)
        s$tools <- setNames(tools, vapply(tools, `[[`, "", "name"))
        s
    }, error = function(e) { gf_close(s); stop(e) })
}
.gf_send <- function(s, message) {
    if (s$closed) .gf_abort(list(code = "closed", message = "GeneFox session is closed."))
    encoded <- .gf_json(message)
    if (s$backend == "native") {
        if (.Call("gf_submit_native", s$native, encoded, PACKAGE = "genefox") != 0L) stop("Native request was not admitted.")
    } else s$process$write_input(paste0(encoded, "\n"))
}
# Drain partial output before requiring a newline: a large JSON line must not
# fill a Windows pipe buffer while the writer waits for the reader to make room.
.gf_queue_cli_output <- function(s, chunk) {
    bytes <- if (is.raw(chunk)) chunk else if (length(chunk)) charToRaw(chunk) else raw()
    if (length(s$output_buffer) + length(bytes) > 64 * 1024 * 1024) .gf_abort(list(code = "protocol_error", message = "GeneFox JSON-RPC output exceeds the 64 MiB limit."))
    s$output_buffer <- c(s$output_buffer, bytes)
    breaks <- which(s$output_buffer == as.raw(10L))
    if (!length(breaks)) return(invisible(NULL))
    start <- 1L
    events <- lapply(breaks, function(end) {
        if (end == start) .gf_abort(list(code = "protocol_error", message = "GeneFox returned an empty JSON-RPC line."))
        line <- rawToChar(s$output_buffer[start:(end - 1L)]); Encoding(line) <- "UTF-8"
        start <<- end + 1L
        .gf_decode(line)
    })
    s$queue <- c(s$queue, events)
    s$output_buffer <- if (start <= length(s$output_buffer)) s$output_buffer[start:length(s$output_buffer)] else raw()
    invisible(NULL)
}
.gf_receive <- function(s, timeout) {
    deadline <- proc.time()[["elapsed"]] + timeout
    repeat {
        if (s$backend == "native") {
            value <- .Call("gf_event_native", s$native, PACKAGE = "genefox")
            if (!is.null(value)) return(.gf_decode(value))
        } else {
            s$process$poll_io(0L)
            errors <- s$process$read_error()
            if (nzchar(errors)) s$stderr <- tail(c(s$stderr, errors), 100L)
            .gf_queue_cli_output(s, s$process$read_output())
            if (length(s$queue)) { result <- s$queue[[1L]]; s$queue <- s$queue[-1L]; return(result) }
            if (!s$process$is_alive()) stop("GeneFox process ended: ", paste(s$stderr, collapse = "\n"))
        }
        remaining <- deadline - proc.time()[["elapsed"]]
        if (remaining <= 0) return(NULL)
        Sys.sleep(min(0.02, remaining))
    }
}
.gf_request <- function(s, method, params = NULL, progress = NULL) {
    if (isTRUE(s$busy)) .gf_abort(list(code = "client_busy", message = "A progress callback cannot reenter this session."))
    s$busy <- TRUE
    on.exit(s$busy <- FALSE, add = TRUE)
    s$id <- s$id + 1; id <- s$id
    request <- list(jsonrpc = "2.0", id = id, method = method)
    if (!is.null(params)) request$params <- params
    if (!is.null(progress)) request$params$`_meta` <- list(progressToken = id)
    .gf_send(s, request)
    done <- FALSE
    on.exit(if (!done) try(.gf_send(s, list(jsonrpc = "2.0", method = "notifications/cancelled", params = list(requestId = id))), silent = TRUE), add = TRUE)
    deadline <- proc.time()[["elapsed"]] + s$timeout
    repeat {
        remaining <- deadline - proc.time()[["elapsed"]]
        if (remaining <= 0) stop("GeneFox ", s$backend, " request timed out during ", method, ".")
        event <- .gf_receive(s, min(remaining, 0.2))
        if (is.null(event)) next
        if (identical(event$method, "notifications/progress")) {
            if (!is.null(progress) && identical(as.numeric(event$params$progressToken), as.numeric(id))) progress(event$params)
            next
        }
        if (is.null(event$id) && !is.null(event$error)) stop(event$error$message)
        if (!identical(as.numeric(event$id), as.numeric(id))) next
        done <- TRUE
        if (!is.null(event$error)) .gf_abort(list(code = "rpc_error", message = event$error$message, details = event$error))
        return(event$result)
    }
}
gf_tools <- function(session) session$tools
gf_call <- function(session, tool, arguments = list(), progress = NULL) {
    if (!tool %in% names(session$tools)) .gf_abort(list(code = "unknown_tool", message = paste0("This runtime does not offer ", tool, ".")))
    envelope <- .gf_request(session, "tools/call", list(name = tool, arguments = if (length(arguments)) arguments else structure(list(), names = character())), progress)
    if (!length(envelope$content) || !identical(envelope$content[[1L]]$type, "text")) stop("Invalid GeneFox result.")
    payload <- .gf_decode(envelope$content[[1L]]$text)
    if (isTRUE(envelope$isError) || !is.null(payload$error)) .gf_abort(payload$error)
    figures <- list()
    visit <- function(value) {
        if (!is.list(value)) return(invisible(NULL))
        path <- if (!is.null(value$path)) value$path else value$untrusted_path
        if (!is.null(path) && !is.null(value$format) && value$format %in% c("png", "svg", "tiff")) {
            bytes <- .gf_artifact(session, path)
            if (!is.null(value$sha256) && !identical(digest::digest(bytes, algo = "sha256", serialize = FALSE), value$sha256)) stop("Figure digest mismatch.")
            figures[[length(figures) + 1L]] <<- structure(list(bytes = bytes, format = value$format, metadata = value), class = "gf_figure")
        } else for (child in value) visit(child)
    }
    visit(payload$figure); visit(payload$figures)
    structure(list(payload = payload, provenance = payload$provenance, caveats = payload$caveats, figures = figures), class = "gf_result")
}
.gf_artifact <- function(s, path) {
    if (s$backend == "native") return(.Call("gf_artifact_native", s$native, path, PACKAGE = "genefox"))
    actual <- normalizePath(path, winslash = "/", mustWork = TRUE)
    root <- normalizePath(s$output, winslash = "/", mustWork = TRUE)
    if (!startsWith(actual, paste0(root, "/")) || nzchar(Sys.readlink(path))) stop("Artifact path refused.")
    if (!file_test("-f", actual)) stop("Artifact must be a regular file.")
    size <- file.info(actual)$size
    if (is.na(size) || size > 64 * 1024 * 1024) stop("Artifact exceeds the read limit.")
    readBin(actual, "raw", n = size)
}
gf_close <- function(session) {
    if (session$closed) return(invisible(NULL))
    session$closed <- TRUE
    if (session$backend == "native") .Call("gf_close_native", session$native, PACKAGE = "genefox")
    else { try(session$process$close_input(), silent = TRUE); session$process$wait(1000L); if (session$process$is_alive()) session$process$kill_tree() }
    invisible(NULL)
}
print.gf_result <- function(x, ...) {
    cat("GeneFox result:", x$payload$tool, "\n")
    if (!is.null(x$payload$display$summary)) cat(x$payload$display$summary, "\n")
    invisible(x)
}
