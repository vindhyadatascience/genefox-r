# Explicit local configuration; never downloads or installs executable code.
gf_runtime <- function(directory) {
    root <- normalizePath(directory, winslash = "/", mustWork = TRUE)
    refuse <- function(message) .gf_abort(list(code = "invalid_runtime", message = message))
    member <- function(name) {
        if (!is.character(name) || length(name) != 1L || is.na(name) || !nzchar(name) ||
            grepl("[\\\\:]", name) || startsWith(name, "/") ||
            any(strsplit(name, "/", fixed = TRUE)[[1L]] %in% c("", ".", ".."))) refuse("Runtime paths must be relative portable paths.")
        candidate <- paste0(root, "/", name)
        parts <- strsplit(name, "/", fixed = TRUE)[[1L]]
        current <- root
        for (part in parts) {
            current <- paste0(current, "/", part)
            if (nzchar(Sys.readlink(current))) refuse("Runtime members cannot be symbolic links.")
        }
        actual <- normalizePath(candidate, winslash = "/", mustWork = TRUE)
        if (!startsWith(actual, paste0(root, "/"))) refuse("Runtime path escapes the selected bundle.")
        actual
    }
    manifest <- .gf_decode(paste(readLines(member("runtime.json"), encoding = "UTF-8", warn = FALSE), collapse = "\n"))
    if (!all(vapply(c("schema_version", "abi", "sdk_contract"), function(key) is.numeric(manifest[[key]]) && length(manifest[[key]]) == 1L && !is.na(manifest[[key]]) && manifest[[key]] == 1, FALSE))) refuse("Unsupported runtime manifest, ABI or SDK contract.")
    host <- switch(Sys.info()[["sysname"]], Darwin = "macos", Linux = "linux", Windows = "windows", "unsupported")
    if (host == "unsupported") refuse("GeneFox runtime bundles do not support this operating system.")
    architecture <- manifest$architecture
    if (!is.character(architecture) || length(architecture) != 1L || is.na(architecture) || !nzchar(architecture)) refuse("Runtime architecture must be one non-empty string.")
    arch <- tolower(Sys.info()[["machine"]])
    if (arch %in% c("amd64", "x64", "x86-64")) arch <- "x86_64"
    if (arch == "aarch64") arch <- "arm64"
    if (!identical(manifest$platform, host) || !architecture %in% c(arch, if (host == "macos") "universal2")) refuse("This runtime does not match the current operating system and architecture.")
    inventory <- manifest$files
    if (!is.list(inventory) || !length(inventory) || is.null(names(inventory))) refuse("The runtime has no file integrity inventory.")
    for (name in names(inventory)) {
        path <- member(name)
        if (!file_test("-f", path) || !identical(digest::digest(file = path, algo = "sha256", serialize = FALSE), inventory[[name]])) refuse(paste0("Runtime file digest mismatch: ", name))
    }
    library <- member(manifest$library); binary <- member(manifest$binary); resources <- member(manifest$resources)
    if (!all(c(manifest$library, manifest$binary) %in% names(inventory)) || !dir.exists(resources)) refuse("The runtime's library, binary or resources are not inventoried.")
    actual <- list.files(root, recursive = TRUE, all.files = TRUE, no.. = TRUE, include.dirs = TRUE)
    for (name in actual) if (nzchar(Sys.readlink(paste0(root, "/", name)))) refuse("Runtime members cannot be symbolic links.")
    actual <- actual[!dir.exists(file.path(root, actual)) & actual != "runtime.json"]
    if (!setequal(actual, names(inventory))) refuse("The runtime inventory does not match the bundle's files.")
    structure(list(library = library, binary = binary, resources = resources, manifest = manifest), class = "gf_runtime")
}
