library(GeneFox)
root <- Sys.getenv("GENEFOX_SDK_TEST_ROOT")
runtime <- Sys.getenv("GENEFOX_SDK_TEST_RUNTIME")
if (nzchar(root) || nzchar(runtime)) {
    lib <- Sys.getenv("GENEFOX_SDK_TEST_LIBRARY", file.path(root, ".build/sdk-projection/.build/debug/libFoxCoreFFI.dylib"))
    cli <- Sys.getenv("GENEFOX_SDK_TEST_BIN", file.path(root, ".build/sdk-projection/.build/debug/genefox"))
    values <- list()
    for (backend in c("native", "cli")) {
        message("GeneFox R conformance backend: ", backend)
        s <- if (nzchar(runtime)) {
            gf_session(runtime = runtime, output = tempfile("gf-conformance-"), backend = backend, timeout = 30)
        } else {
            gf_session(file.path(root, "Sources/Locus/Resources"), tempfile("gf-conformance-"), library = lib, binary = cli, backend = backend, timeout = 30)
        }
        error <- tryCatch(gf_call(s, "not_a_genefox_tool"), genefox_error = identity)
        stopifnot(inherits(error, "genefox_error"), identical(error$code, "unknown_tool"))
        stopifnot("gene_info" %in% names(gf_tools(s)))
        nonhuman <- tryCatch(gf_gene_info(s, gene = "7157", organism = "mouse"), genefox_error = identity)
        stopifnot(inherits(nonhuman, "genefox_error"), identical(nonhuman$code, "invalid_argument"), grepl("human", conditionMessage(nonhuman), fixed = TRUE))
        s$busy <- TRUE
        busy <- tryCatch(gf_call(s, "list_operations"), genefox_error = identity)
        s$busy <- FALSE
        stopifnot(inherits(busy, "genefox_error"), identical(busy$code, "client_busy"))
        stopifnot(all(vapply(names(gf_tools(s)), function(name) exists(paste0("gf_", name), envir = asNamespace("GeneFox"), inherits = FALSE), FALSE)))
        operations <- gf_list_operations(s)
        stopifnot(length(operations$payload) == 5L, identical(dim(gf_table(operations)), c(5L, 4L)), grepl("\u2014", operations$payload[[5L]]$summary, fixed = TRUE))
        table <- paste(c("gene\tlog2FoldChange\tpValue", "TP53\t1\t0.01", "MDM2\t-1\t0.01", "ESR1\t0\t0.01", paste0("G", 3:499, "\t0\t1")), collapse = "\n")
        local <- gf_imported_de_enrichment(s, table = table, source = "SDK \u03B2 fixture", comparison = "\u0394 A versus B", complete_universe = TRUE, foreground_size = 1L, pdf = FALSE, html = FALSE, csv = FALSE)
        stopifnot(local$payload$data$background_genes == 500, identical(local$payload$provenance$untrusted_source, "SDK \u03B2 fixture"), identical(local$payload$provenance$untrusted_comparison, "\u0394 A versus B"))
        frame <- gf_table(local, "data")
        stopifnot(is.data.frame(frame), ncol(frame) == length(local$payload$data$headers))
        if (requireNamespace("tibble", quietly = TRUE)) stopifnot(inherits(gf_to_tibble(frame), "tbl_df"))
        if (requireNamespace("data.table", quietly = TRUE)) stopifnot(inherits(gf_to_data_table(frame), "data.table"))
        local$payload$provenance$fetched_at <- NULL; local$payload$provenance$genefox_cli <- NULL; local$payload$provenance$transport <- NULL
        values[[backend]] <- list(tools = sort(names(gf_tools(s))), operations = operations$payload, local = local$payload)
        gf_close(s); gf_close(s)
    }
    if (!identical(values$native, values$cli)) {
        print(all.equal(values$native, values$cli, tolerance = 0))
        remaining <- 12L
        differences <- function(left, right, path = "result") {
            if (identical(left, right) || remaining <= 0L) return(invisible(NULL))
            if (is.list(left) && is.list(right) && identical(names(left), names(right)) && length(left) == length(right)) {
                for (i in seq_along(left)) differences(left[[i]], right[[i]], paste0(path, "/", if (is.null(names(left))) i else names(left)[[i]]))
            } else {
                remaining <<- remaining - 1L
                cat(path, "native:", paste(capture.output(dput(left)), collapse = " "), "cli:", paste(capture.output(dput(right)), collapse = " "), "\n")
            }
        }
        differences(values$native, values$cli)
    }
    stopifnot(identical(values$native, values$cli))
}
records <- structure(list(payload = list(data = list(list(id = "001", value = 0), list(id = "002", value = NULL))), provenance = list(units = "TPM")), class = "gf_result")
frame <- gf_table(records, "data")
stopifnot(identical(frame$id, c("001", "002")), frame$value[[1L]] == 0, is.na(frame$value[[2L]]))
if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
    matrix <- matrix(c(1, 0, NA_real_, 4), 2, dimnames = list(c("B", "A"), c("S2", "S1")))
    metadata <- S4Vectors::DataFrame(group = factor(c("control", "treated"), levels = c("treated", "control")), row.names = c("S2", "S1"))
    se <- SummarizedExperiment::SummarizedExperiment(assays = list(log2_tpm = matrix), colData = metadata)
    experiment <- gf_from_se(se, list(log2_tpm = "log2_tpm"))
    refused <- tryCatch(gf_from_se(se, list(log2_tpm = "")), error = identity)
    stopifnot(inherits(refused, "error"))
    restored <- gf_to_se(experiment)
    stopifnot(identical(SummarizedExperiment::assay(restored), matrix), identical(levels(restored$group), c("treated", "control")))
    experiment$sample_metadata <- experiment$sample_metadata[c(2, 1), , drop = FALSE]
    # Export must explicitly realign sample metadata to the assay identifiers.
    reordered <- gf_to_se(experiment)
    stopifnot(identical(as.character(reordered$group), c("control", "treated")))
}
cat("GeneFox R conformance passed\n")
