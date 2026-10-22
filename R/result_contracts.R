# Versioned result contracts are package data; inspecting them never starts a runtime.
gf_result_schemas <- function() {
    directory <- system.file("contracts", package = "genefox", mustWork = TRUE)
    paths <- sort(list.files(directory, pattern = "\\.schema\\.json$", full.names = TRUE))
    if (!length(paths)) stop("Result contracts are unavailable in this package installation.")
    setNames(lapply(paths, function(path) jsonlite::fromJSON(path, simplifyVector = FALSE)), basename(paths))
}
