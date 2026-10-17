library(GeneFox)
# Ordinary R matrices need neither Bioconductor nor an installed external framework.
dense <- matrix(c(1.25, 3.5, 2.5, 4.5), 2L, dimnames = list(c("B", "A"), c("S2", "S1")))
samples <- data.frame(group = c("control", "treated"), row.names = c("S1", "S2"))
empty_result <- list(payload = list(display = list(table = list(headers = list(), rows = list(list(), list(), list())))), provenance = list(source = "empty-column fixture"))
empty <- gf_table(empty_result)
stopifnot(identical(dim(empty), c(3L, 0L)))
if (requireNamespace("tibble", quietly = TRUE)) stopifnot(identical(dim(gf_to_tibble(empty)), c(3L, 0L)))
if (requireNamespace("data.table", quietly = TRUE)) stopifnot(inherits(try(gf_to_data_table(empty), silent = TRUE), "try-error"))
plain <- gf_experiment(list(expression = dense), units = list(expression = "TPM"), sample_metadata = samples)
stopifnot(identical(plain$sample_ids, c("S2", "S1")), identical(plain$sample_metadata$group, c("treated", "control")))
stopifnot(inherits(try(gf_experiment(list(expression = dense), units = list(expression = "TPM"), sample_ids = c("S1", "S2")), silent = TRUE), "try-error"))
complex_assay <- matrix(as.complex(dense), nrow(dense), dimnames = dimnames(dense))
stopifnot(inherits(try(gf_experiment(list(expression = complex_assay), units = list(expression = "TPM")), silent = TRUE), "try-error"))
plain_folder <- tempfile("genefox-plain-input-")
tryCatch({
    plain_path <- gf_write_import(plain, plain_folder, assay = "expression", scale = "linear")
    plain_manifest <- jsonlite::fromJSON(plain_path, simplifyVector = FALSE)
    stopifnot(identical(plain_manifest$sample_metadata$values, list(list("treated"), list("control"))))
}, finally = unlink(plain_folder, recursive = TRUE))
if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
    matrix <- matrix(c(1.25, -0.0, NA_real_, 4.5), 2L, dimnames = list(c("B", "A"), c("S2", "S1")))
    metadata <- S4Vectors::DataFrame(group = factor(c("treated", "control"), levels = c("control", "treated", "unused"), ordered = TRUE), row.names = c("S2", "S1"))
    se <- SummarizedExperiment::SummarizedExperiment(assays = list(logcounts = matrix, counts = matrix * 2), colData = metadata, metadata = list(source = "local fixture"))
    experiment <- gf_from_se(se, units = list(logcounts = "log2_cpm", counts = "counts"))
    relabelled <- experiment; relabelled$feature_ids <- rev(relabelled$feature_ids)
    stopifnot(inherits(try(gf_to_se(relabelled), silent = TRUE), "try-error"))
    folder <- tempfile("genefox-input-")
    tryCatch({
        path <- gf_write_import(experiment, folder, assay = "logcounts", scale = "log2")
        manifest <- jsonlite::fromJSON(path, simplifyVector = FALSE)
        stopifnot(identical(manifest$assay$name, "logcounts"), identical(manifest$assay$units, "log2_cpm"), identical(manifest$unselected_assays, list("counts")),
            identical(manifest$sample_metadata$ids, list("S2", "S1")), identical(manifest$sample_metadata$values, list(list("treated"), list("control"))),
            identical(manifest$sample_metadata$column_metadata$group$categories, list("control", "treated", "unused")), isTRUE(manifest$sample_metadata$column_metadata$group$ordered),
            identical(manifest$provenance$source, "local fixture"))
        values <- as.matrix(utils::read.delim(file.path(folder, "matrix.tsv"), row.names = 1L, check.names = FALSE))
        stopifnot(isTRUE(all.equal(values, matrix)))
        stopifnot(inherits(try(gf_write_import(experiment, folder, assay = "logcounts", scale = "log2"), silent = TRUE), "try-error"))
        stopifnot(inherits(try(gf_write_import(experiment, paste0(folder, "-invalid"), assay = "logcounts", scale = "auto"), silent = TRUE), "try-error"), !dir.exists(paste0(folder, "-invalid")))
    }, finally = unlink(folder, recursive = TRUE))
}

# The convenience hook owns only its temporary interchange input; the configured
# runtime store owns persistence. Check success, refusal and cleanup without a grant.
namespace <- asNamespace("GeneFox")
originals <- lapply(c("gf_tools", "gf_imported_data_import"), get, envir = namespace)
names(originals) <- c("gf_tools", "gf_imported_data_import")
replace_binding <- function(name, value) {
    unlockBinding(name, namespace)
    assign(name, value, envir = namespace)
    lockBinding(name, namespace)
}
output <- tempfile("genefox-import-hook-")
dir.create(output)
session <- list(output = output)
tryCatch({
    replace_binding("gf_tools", function(session) list(imported_data_import = list()))
    replace_binding("gf_imported_data_import", function(session, manifest_path, display_name) {
        stopifnot(file.exists(manifest_path), identical(normalizePath(dirname(dirname(manifest_path)), winslash = "/"), normalizePath(output, winslash = "/")))
        text <- paste(readLines(manifest_path, warn = FALSE), collapse = "\n")
        list(payload = list(data = list(dataset_id = "owned-store-reference", manifest_json = text)))
    })
    imported <- gf_import_experiment(session, plain, assay = "expression", scale = "linear")
    stopifnot(inherits(imported, "gf_imported_experiment"), identical(imported$dataset_id, "owned-store-reference"),
        identical(jsonlite::fromJSON(imported$manifest_json)$assay$name, "expression"), length(list.files(output, all.files = TRUE, no.. = TRUE)) == 0L)
    replace_binding("gf_imported_data_import", function(...) stop("shared importer refused"))
    stopifnot(inherits(try(gf_import_experiment(session, plain, assay = "expression", scale = "linear"), silent = TRUE), "try-error"),
        length(list.files(output, all.files = TRUE, no.. = TRUE)) == 0L)
    replace_binding("gf_tools", function(session) list())
    stopifnot(inherits(try(gf_import_experiment(session, plain, assay = "expression", scale = "linear"), silent = TRUE), "try-error"),
        length(list.files(output, all.files = TRUE, no.. = TRUE)) == 0L)
}, finally = {
    for (name in names(originals)) replace_binding(name, originals[[name]])
    unlink(output, recursive = TRUE)
})

if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
    constructor <- getExportedValue(methods::getClassDef("Seqinfo")@package, "Seqinfo")
    sequences <- constructor(seqnames = c("chr2", "chrM", "chrUnused"),
        seqlengths = c(242193529L, 16569L, NA_integer_), isCircular = c(FALSE, TRUE, NA),
        genome = c("GRCh38", "GRCh38", NA_character_))
    ranges <- GenomicRanges::GRanges(seqnames = c("chrM", "chr2"),
        ranges = IRanges::IRanges(start = c(1L, 10L), width = 3L), strand = c("+", "-"), seqinfo = sequences)
    names(ranges) <- c("B", "A")
    S4Vectors::metadata(ranges) <- list(annotation_release = "Ensembl110")
    ranged <- SummarizedExperiment::SummarizedExperiment(assays = list(expression = dense), rowRanges = ranges)
    experiment <- gf_from_se(ranged, units = list(expression = "TPM"))
    restored <- gf_to_se(experiment)
    stopifnot(identical(GenomicRanges::seqinfo(SummarizedExperiment::rowRanges(restored)), sequences))
    directory <- tempfile("genefox-ranged-input-")
    tryCatch({
        path <- gf_write_import(experiment, directory, assay = "expression", scale = "linear")
        manifest <- jsonlite::fromJSON(path, simplifyVector = FALSE)
        info <- manifest$genomic_ranges$seqinfo
        stopifnot(identical(info$ids, list("chr2", "chrM", "chrUnused")),
            identical(info$columns, list("seqlengths", "isCircular", "genome")),
            identical(info$values, list(list(242193529L, FALSE, "GRCh38"), list(16569L, TRUE, "GRCh38"), list(NULL, NULL, NULL))),
            identical(manifest$genomic_ranges$ids, list("B", "A")),
            identical(manifest$genomic_ranges$metadata$annotation_release, "Ensembl110"))
    }, finally = unlink(directory, recursive = TRUE))
}

if (requireNamespace("SummarizedExperiment", quietly = TRUE)) {
    groups <- GenomicRanges::GRangesList(B = ranges[1L], A = ranges)
    grouped <- SummarizedExperiment::SummarizedExperiment(assays = list(expression = dense), rowRanges = groups)
    experiment <- gf_from_se(grouped, units = list(expression = "TPM"))
    directory <- tempfile("genefox-grouped-ranges-")
    tryCatch({
        refused <- try(gf_write_import(experiment, directory, assay = "expression", scale = "linear"), silent = TRUE)
        stopifnot(inherits(refused, "try-error"), !file.exists(directory))
    }, finally = unlink(directory, recursive = TRUE))
}
