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
