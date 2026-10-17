library(GeneFox)
# Capture the real generated binding's wire arguments without needing a network dataset.
namespace <- asNamespace("GeneFox")
original <- get("gf_call", envir = namespace)
replace_call <- function(value) {
    unlockBinding("gf_call", namespace)
    assign("gf_call", value, envir = namespace)
    lockBinding("gf_call", namespace)
}
tryCatch({
    replace_call(function(session, tool, arguments, ...) getFromNamespace(".gf_json", "GeneFox")(arguments))
    single <- jsonlite::fromJSON(gf_tcga_heatmap(NULL, project = "TCGA-BRCA", genes = "TP53"), simplifyVector = FALSE)
    stopifnot(is.list(single$genes), identical(single$genes, list("TP53")))
    empty <- jsonlite::fromJSON(gf_tcga_heatmap(NULL, project = "TCGA-BRCA", genes = character()), simplifyVector = FALSE)
    stopifnot(is.list(empty$genes), length(empty$genes) == 0L)
}, finally = replace_call(original))
