library(GeneFox)
folder <- tempfile("genefox-runtime-"); dir.create(folder)
tryCatch({
    dir.create(file.path(folder, "Resources"))
    writeBin(charToRaw("native fixture"), file.path(folder, "native"))
    writeBin(charToRaw("cli fixture"), file.path(folder, "genefox"))
    writeBin(charToRaw("science fixture"), file.path(folder, "Resources", "fixture"))
    inventory <- setNames(lapply(c("native", "genefox", "Resources/fixture"), function(name) digest::digest(file = file.path(folder, name), algo = "sha256", serialize = FALSE)), c("native", "genefox", "Resources/fixture"))
    arch <- tolower(Sys.info()[["machine"]])
    if (arch %in% c("amd64", "x64", "x86-64")) arch <- "x86_64"
    if (arch == "aarch64") arch <- "arm64"
    manifest <- list(schema_version = 1, abi = 1, sdk_contract = 1,
        platform = switch(Sys.info()[["sysname"]], Darwin = "macos", Linux = "linux", Windows = "windows"), architecture = arch,
        library = "native", binary = "genefox", resources = "Resources", files = inventory)
    save_manifest <- function() writeLines(jsonlite::toJSON(manifest, auto_unbox = TRUE), file.path(folder, "runtime.json"), useBytes = TRUE)
    refuses <- function(f) { failed <- tryCatch({ f(); FALSE }, error = function(e) TRUE); stopifnot(failed) }
    save_manifest()
    selected <- gf_runtime(folder)
    stopifnot(file.exists(selected$library), dir.exists(selected$resources))
    refuses(function() gf_session(runtime = folder, resources = folder, output = folder))
    manifest$abi <- 99; save_manifest(); refuses(function() gf_runtime(folder))
    manifest$abi <- 1; manifest$platform <- "wrong"; save_manifest(); refuses(function() gf_runtime(folder))
    manifest$platform <- selected$manifest$platform
    # Exercise host labels without loading a foreign binary or changing the package namespace.
    original_runtime <- get("gf_runtime", asNamespace("GeneFox"))
    original_environment <- environment(original_runtime)
    runtime_for_host <- function(system, machine) {
        check <- original_runtime
        environment(check) <- list2env(list(Sys.info = function() c(sysname = system, machine = machine)),
            parent = original_environment)
        check
    }
    refuses_compatibility <- function(f) {
        failure <- tryCatch({ f(); NULL }, error = identity)
        stopifnot(inherits(failure, "genefox_error"), identical(failure$code, "invalid_runtime"))
    }
    saved_manifest <- manifest
    hosts <- list(c("Darwin", "macos"), c("Linux", "linux"), c("Windows", "windows"))
    machines <- list(c("x86_64", "x86_64"), c("AMD64", "x86_64"), c("x64", "x86_64"),
        c("aarch64", "arm64"), c("arm64", "arm64"))
    for (host in hosts) for (machine in machines) {
        check <- runtime_for_host(host[[1L]], machine[[1L]])
        manifest$platform <- host[[2L]]
        manifest$architecture <- machine[[2L]]; save_manifest()
        stopifnot(identical(check(folder)$manifest$architecture, machine[[2L]]))
        manifest$architecture <- "universal2"; save_manifest()
        if (host[[2L]] == "macos") stopifnot(identical(check(folder)$manifest$architecture, "universal2"))
        else refuses_compatibility(function() check(folder))
        manifest$architecture <- if (machine[[2L]] == "x86_64") "arm64" else "x86_64"
        save_manifest(); refuses_compatibility(function() check(folder))
        for (invalid in list("", NA_character_, character(), list(machine[[2L]]),
            list(cpu = machine[[2L]]), TRUE, 1L)) {
            manifest$architecture <- invalid; save_manifest()
            refuses_compatibility(function() check(folder))
        }
    }
    for (system in c("SunOS", "FreeBSD", "other")) {
        check <- runtime_for_host(system, "x86_64")
        manifest$platform <- "unsupported"; manifest$architecture <- "x86_64"; save_manifest()
        refuses_compatibility(function() check(folder))
    }
    stopifnot(identical(environment(get("gf_runtime", asNamespace("GeneFox"))), original_environment))
    manifest <- saved_manifest; save_manifest()
    for (name in c("../escape", "/absolute", "C:/escape", "Resources/../native", "Resources\\native")) {
        manifest$library <- name; save_manifest(); refuses(function() gf_runtime(folder))
    }
    manifest$library <- "native"; save_manifest()
    writeBin(charToRaw("extra"), file.path(folder, "extra")); refuses(function() gf_runtime(folder)); unlink(file.path(folder, "extra"))
    writeBin(charToRaw("corrupt"), file.path(folder, "Resources", "fixture")); refuses(function() gf_runtime(folder))
}, finally = unlink(folder, recursive = TRUE))
runtime <- Sys.getenv("GENEFOX_SDK_TEST_RUNTIME")
if (nzchar(runtime)) {
    outputs <- list()
    for (backend in c("native", "cli")) {
        output <- tempfile("genefox-runtime-output-")
        s <- gf_session(runtime = runtime, output = output, backend = backend)
        outputs[[backend]] <- gf_list_operations(s)$payload
        gf_close(s); unlink(output, recursive = TRUE)
    }
    stopifnot(identical(outputs$native, outputs$cli))
}
