library(genefox)
# Capture the real generated binding's wire arguments without needing a network dataset.
namespace <- asNamespace("genefox")
original <- get("gf_call", envir = namespace)
replace_call <- function(value) {
    unlockBinding("gf_call", namespace)
    assign("gf_call", value, envir = namespace)
    lockBinding("gf_call", namespace)
}
tryCatch({
    replace_call(function(session, tool, arguments, ...) getFromNamespace(".gf_json", "genefox")(arguments))
    single <- jsonlite::fromJSON(gf_tcga_heatmap(NULL, project = "TCGA-BRCA", genes = "TP53"), simplifyVector = FALSE)
    stopifnot(is.list(single$genes), identical(single$genes, list("TP53")))
    empty <- jsonlite::fromJSON(gf_tcga_heatmap(NULL, project = "TCGA-BRCA", genes = character()), simplifyVector = FALSE)
    stopifnot(is.list(empty$genes), length(empty$genes) == 0L)
    # An object with scalar fields must retain its field names and scalar values.
    destination <- list(kind = "tcga.survival", projectId = "TCGA-KIRC", gene = "CD276")
    opened <- jsonlite::fromJSON(gf_open_destination(NULL, destination = destination), simplifyVector = FALSE)
    stopifnot(identical(opened$destination, destination))
}, finally = replace_call(original))
