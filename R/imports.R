# Serialization only: all normalization, analysis and figure generation stay shared.
gf_write_import <- function(x, directory, assay, scale) {
    if (!inherits(x, "gf_experiment")) stop("Convert with gf_from_se() before exporting an experiment.")
    x <- gf_experiment(x$assays, x$units, x$feature_ids, x$sample_ids,
        x$feature_metadata, x$sample_metadata, x$metadata, x$row_ranges)
    if (!is.character(scale) || length(scale) != 1L || is.na(scale) || !scale %in% c("linear", "log2", "unknown")) stop("Declare scale as linear, log2 or unknown.")
    if (!is.character(assay) || length(assay) != 1L || is.na(assay) || !assay %in% names(x$assays)) stop("Select one existing named assay explicitly.")
    if (!length(x$feature_ids) || !length(x$sample_ids)) stop("An imported assay must contain features and samples.")
    text <- function(value) {
        if (is.null(value)) return("")
        if (is.logical(value)) return(if (value) "true" else "false")
        result <- if (is.double(value)) format(value, digits = 17, scientific = TRUE, trim = TRUE, decimal.mark = ".") else as.character(value)
        if (any(grepl('[\t\r\n"]', result))) stop("TSV identifiers and metadata cannot contain tabs, line breaks or quotes; convert explicitly.")
        result
    }
    for (identifier in c(x$feature_ids, x$sample_ids)) {
        text(identifier)
        if (trimws(identifier) != identifier || startsWith(identifier, "#") || identifier == "__genefox_id__") stop("Identifiers cannot be whitespace-padded, comment-like or reserved.")
    }
    matrix <- x$assays[[assay]]
    if (any(is.infinite(matrix))) stop("Infinite expression values require explicit handling; NA remains missing.")
    plain <- function(value) {
        if (is.null(value)) return(NULL)
        if (is.object(value)) stop("Convert unsupported metadata/provenance objects explicitly before export.")
        if (is.list(value)) return(lapply(value, plain))
        if (!is.atomic(value) || !is.null(dim(value))) stop("Convert unsupported metadata/provenance objects explicitly before export.")
        if (length(value) != 1L) return(lapply(value, plain))
        if (is.na(value)) return(NULL)
        if (is.numeric(value) && !is.finite(value)) stop("Metadata/provenance cannot contain infinite values.")
        unname(value)
    }
    metadata <- function(frame, ids) {
        columns <- names(frame)
        if (anyNA(columns) || any(!nzchar(columns)) || anyDuplicated(columns) || "__genefox_id__" %in% columns) stop("Metadata columns must have unique nonempty names and cannot use __genefox_id__.")
        descriptions <- setNames(lapply(frame, function(column) {
            if (is.factor(column)) return(list(dtype = "category", categories = unname(as.list(levels(column))), ordered = is.ordered(column)))
            if (is.object(column) || !is.atomic(column) || !is.null(dim(column))) stop("Convert unsupported metadata columns explicitly before export.")
            dtype <- switch(typeof(column), integer = "Int32", double = "float64", logical = "boolean", character = "string", stop("Unsupported metadata column type."))
            list(dtype = dtype)
        }), columns)
        values <- lapply(seq_len(nrow(frame)), function(i) unname(lapply(frame, function(column) {
            cell <- if (is.factor(column)) as.character(column[i]) else column[i]
            value <- plain(cell); text(value); value
        })))
        for (column in columns) text(column)
        list(ids = unname(as.list(ids)), columns = unname(as.list(columns)), values = values, column_metadata = descriptions)
    }
    # Preserve genomic context as well as coordinates; never flatten exon groups.
    ranges <- NULL
    if (!is.null(x$row_ranges)) {
        if (!methods::is(x$row_ranges, "GRanges")) stop("Genomic interchange currently requires one GRanges row per feature; grouped ranges must be converted explicitly before export.")
        ranges <- metadata(as.data.frame(x$row_ranges)[, c("seqnames", "start", "end", "width", "strand"), drop = FALSE], x$feature_ids)
        info <- as.data.frame(GenomicRanges::seqinfo(x$row_ranges))
        ranges$seqinfo <- metadata(info, rownames(info))
        ranges$metadata <- plain(S4Vectors::metadata(x$row_ranges))
    }
    provenance <- x$metadata
    provenance$genefox_assay_units <- NULL # Already carried explicitly per assay.
    manifest <- list(schema_version = 1, matrix = "matrix.tsv", sample_metadata_file = "samples.tsv",
        assay = list(name = assay, units = x$units[[assay]], scale = scale, orientation = "features_by_samples"),
        unselected_assays = unname(as.list(setdiff(names(x$assays), assay))),
        feature_metadata = metadata(x$feature_metadata, x$feature_ids), sample_metadata = metadata(x$sample_metadata, x$sample_ids),
        provenance = plain(provenance), genomic_ranges = ranges,
        precision_note = "Source values are exported without normalization. The shared GeneFox imported-matrix engine stores expression as Float32; metadata sidecars retain original types and categorical domains.")
    if (file.exists(directory)) stop("The destination already exists; choose a new input directory.")
    parent <- dirname(directory); dir.create(parent, recursive = TRUE, showWarnings = FALSE)
    temporary <- tempfile(".genefox-input-", tmpdir = parent); dir.create(temporary)
    on.exit(unlink(temporary, recursive = TRUE), add = TRUE)
    write_tsv <- function(name, headers, count, row_at) {
        connection <- file(file.path(temporary, name), open = "wt", encoding = "UTF-8")
        on.exit(close(connection), add = TRUE)
        writeLines(paste(headers, collapse = "\t"), connection, useBytes = TRUE)
        for (i in seq_len(count)) writeLines(paste(row_at(i), collapse = "\t"), connection, useBytes = TRUE)
    }
    matrix_row <- function(i) c(x$feature_ids[i], vapply(matrix[i, ], function(value) if (is.na(value)) "NA" else if (value == 0 && is.infinite(1 / value) && 1 / value < 0) "-0.0" else format(value, digits = 17, scientific = TRUE, trim = TRUE, decimal.mark = "."), ""))
    write_tsv("matrix.tsv", c("__genefox_id__", x$sample_ids), length(x$feature_ids), matrix_row)
    meta <- manifest$sample_metadata
    sample_row <- function(i) c(x$sample_ids[i], vapply(meta$values[[i]], text, ""))
    write_tsv("samples.tsv", c("__genefox_id__", names(x$sample_metadata)), length(x$sample_ids), sample_row)
    manifest$files <- setNames(lapply(c("matrix.tsv", "samples.tsv"), function(name) digest::digest(file = file.path(temporary, name), algo = "sha256", serialize = FALSE)), c("matrix.tsv", "samples.tsv"))
    writeLines(.gf_json(manifest), file.path(temporary, "experiment.json"), useBytes = TRUE)
    if (!file.rename(temporary, directory)) stop("The input directory could not be committed.")
    file.path(directory, "experiment.json")
}
