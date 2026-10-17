# A reference has no statistical or drawing implementation; every workflow calls
# the same generated tool function on either transport.
gf_import_experiment <- function(session, experiment, assay, scale, display_name = NULL) {
    if (!"imported_data_import" %in% names(gf_tools(session))) {
        .gf_abort(list(code = "unknown_tool", message = "This runtime does not offer imported_data_import; Analyze Your Own Data access is required."))
    }
    directory <- tempfile(".genefox-input-", tmpdir = session$output)
    on.exit(unlink(directory, recursive = TRUE), add = TRUE)
    manifest <- gf_write_import(experiment, directory, assay = assay, scale = scale)
    result <- gf_imported_data_import(session, manifest_path = manifest, display_name = display_name)
    structure(list(session = session, dataset_id = result$payload$data$dataset_id,
        manifest_json = result$payload$data$manifest_json), class = "gf_imported_experiment")
}

gf_analyze_imported <- function(experiment, workflow = c("plot", "heatmap", "signature", "differential"), ...) {
    if (!inherits(experiment, "gf_imported_experiment")) stop("Supply a GeneFox imported experiment reference.")
    workflow <- match.arg(workflow)
    fun <- get(paste0("gf_imported_expression_", workflow), envir = asNamespace("GeneFox"))
    fun(experiment$session, dataset_id = experiment$dataset_id, ...)
}
