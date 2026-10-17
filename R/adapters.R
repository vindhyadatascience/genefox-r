gf_table <- function(result, path = NULL) {
    value <- result$payload
    if (is.null(path)) path <- if (!is.null(value$display$table)) c("display", "table") else character()
    for (key in path) value <- value[[key]]
    if (is.null(value)) stop("No table at the selected path.")
    if (!is.null(value$headers) && !is.null(value$rows)) {
        headers <- unlist(value$headers, use.names = FALSE)
        rows <- value$rows
        if (any(vapply(rows, length, 0L) != length(headers))) stop("Table width mismatch.")
        records <- lapply(rows, function(row) setNames(row, headers))
    } else {
        records <- value
        headers <- if (length(records)) names(records[[1L]]) else character()
    }
    if (anyDuplicated(headers)) stop("Duplicate table columns.")
    if (any(vapply(records, function(row) !setequal(names(row), headers), FALSE))) stop("Inconsistent table columns.")
    columns <- setNames(lapply(headers, function(key) {
        values <- lapply(records, `[[`, key)
        nonnull <- Filter(Negate(is.null), values)
        if (!length(nonnull)) return(rep(NA, length(values)))
        if (all(vapply(nonnull, function(x) is.integer(x) && length(x) == 1L, FALSE))) return(vapply(values, function(x) if (is.null(x)) NA_integer_ else x, 0L))
        if (all(vapply(nonnull, function(x) is.numeric(x) && length(x) == 1L, FALSE))) return(vapply(values, function(x) if (is.null(x)) NA_real_ else x, 0.0))
        if (all(vapply(nonnull, function(x) is.character(x) && length(x) == 1L, FALSE))) return(vapply(values, function(x) if (is.null(x)) NA_character_ else x, ""))
        if (all(vapply(nonnull, function(x) is.logical(x) && length(x) == 1L, FALSE))) return(vapply(values, function(x) if (is.null(x)) NA else x, FALSE))
        I(values)
    }), headers)
    out <- if (length(headers)) as.data.frame(columns, stringsAsFactors = FALSE, check.names = FALSE) else data.frame(row.names = seq_len(length(records)))
    attr(out, "genefox_provenance") <- result$provenance
    out
}
gf_to_tibble <- function(x) { if (!requireNamespace("tibble", quietly = TRUE)) stop("Install tibble for this adapter."); tibble::as_tibble(x) }
gf_to_data_table <- function(x) {
    if (!requireNamespace("data.table", quietly = TRUE)) stop("Install data.table for this adapter.")
    if (length(dim(x)) == 2L && nrow(x) > 0L && ncol(x) == 0L) stop("data.table cannot represent rows without columns; retain this as a data.frame or tibble.")
    data.table::as.data.table(x)
}
gf_save_figure <- function(figure, path) {
    suffix <- tolower(tools::file_ext(path))
    if (nzchar(suffix) && !suffix %in% c(figure$format, if (figure$format == "tiff") "tif")) stop("Request the desired format from GeneFox; saving does not convert it.")
    writeBin(figure$bytes, path); invisible(path)
}
plot.gf_figure <- function(x, ...) {
    if (x$format != "png") stop("RStudio display currently accepts the engine's PNG; other formats can be saved.")
    if (!requireNamespace("png", quietly = TRUE)) stop("Install png to display the engine image.")
    grid::grid.newpage(); grid::grid.raster(png::readPNG(x$bytes))
    invisible(x)
}
knit_print.gf_figure <- function(x, ...) {
    path <- tempfile(fileext = paste0(".", x$format)); gf_save_figure(x, path)
    knitr::knit_print(knitr::include_graphics(path), ...)
}
gf_experiment <- function(assays, units, feature_ids = NULL, sample_ids = NULL,
                          feature_metadata = NULL, sample_metadata = NULL, metadata = list(), row_ranges = NULL) {
    if (!is.list(assays) || !length(assays) || is.null(names(assays)) || anyNA(names(assays)) || any(!nzchar(names(assays))) || anyDuplicated(names(assays))) stop("Assays must have unique nonempty names.")
    if (!all(vapply(assays, function(a) is.matrix(a) && is.numeric(a), FALSE))) stop("Sparse/backed assays need an explicit adapter; no automatic densification.")
    if (is.null(feature_ids)) feature_ids <- rownames(assays[[1L]])
    if (is.null(sample_ids)) sample_ids <- colnames(assays[[1L]])
    for (ids in list(feature_ids, sample_ids)) if (!is.character(ids) || anyNA(ids) || any(!nzchar(ids)) || anyDuplicated(ids)) stop("Unique nonempty feature and sample identifiers are required.")
    if (is.null(names(units)) || anyNA(names(units)) || anyDuplicated(names(units)) || !setequal(names(units), names(assays)) || !all(vapply(units, function(unit) is.character(unit) && length(unit) == 1L && !is.na(unit) && nzchar(unit), FALSE))) stop("Supply units for every named assay.")
    assays <- lapply(assays, function(a) {
        if (!identical(dim(a), c(length(feature_ids), length(sample_ids)))) stop("Assay dimensions do not match identifiers.")
        if ((!is.null(rownames(a)) && !identical(rownames(a), feature_ids)) || (!is.null(colnames(a)) && !identical(colnames(a), sample_ids))) stop("Assay labels must agree with the declared identifiers; reorder explicitly before construction.")
        dimnames(a) <- list(feature_ids, sample_ids); a
    })
    align <- function(frame, ids) {
        if (is.null(frame)) return(data.frame(row.names = ids))
        if (!is.data.frame(frame) || is.null(rownames(frame)) || anyDuplicated(rownames(frame)) || !setequal(rownames(frame), ids)) stop("Metadata identifiers must match the assay identifiers.")
        frame[match(ids, rownames(frame)), , drop = FALSE]
    }
    if (!is.null(row_ranges)) {
        if (is.null(names(row_ranges)) || anyNA(names(row_ranges)) || anyDuplicated(names(row_ranges)) || !setequal(names(row_ranges), feature_ids)) stop("Genomic range identifiers must match features.")
        row_ranges <- row_ranges[match(feature_ids, names(row_ranges))]
    }
    if (!is.list(metadata)) stop("Experiment metadata must be a list.")
    structure(list(assays = assays, feature_ids = feature_ids, sample_ids = sample_ids, units = units,
        feature_metadata = align(feature_metadata, feature_ids), sample_metadata = align(sample_metadata, sample_ids),
        metadata = metadata, row_ranges = row_ranges), class = "gf_experiment")
}
gf_from_se <- function(x, units) {
    if (!requireNamespace("SummarizedExperiment", quietly = TRUE)) stop("Install SummarizedExperiment.")
    gf_experiment(assays = as.list(SummarizedExperiment::assays(x)), units = units,
        feature_ids = rownames(x), sample_ids = colnames(x),
        feature_metadata = as.data.frame(SummarizedExperiment::rowData(x)),
        sample_metadata = as.data.frame(SummarizedExperiment::colData(x)), metadata = S4Vectors::metadata(x),
        row_ranges = if (methods::is(x, "RangedSummarizedExperiment")) SummarizedExperiment::rowRanges(x) else NULL)
}
gf_to_se <- function(x) {
    if (!requireNamespace("SummarizedExperiment", quietly = TRUE)) stop("Install SummarizedExperiment.")
    x <- gf_experiment(x$assays, x$units, x$feature_ids, x$sample_ids,
        x$feature_metadata, x$sample_metadata, x$metadata, x$row_ranges)
    metadata <- x$metadata; metadata$genefox_assay_units <- x$units
    if (!is.null(x$row_ranges)) {
        ranges <- x$row_ranges
        S4Vectors::mcols(ranges) <- S4Vectors::DataFrame(x$feature_metadata)
        return(SummarizedExperiment::SummarizedExperiment(assays = x$assays, rowRanges = ranges,
            colData = S4Vectors::DataFrame(x$sample_metadata), metadata = metadata))
    }
    SummarizedExperiment::SummarizedExperiment(assays = x$assays,
        rowData = S4Vectors::DataFrame(x$feature_metadata), colData = S4Vectors::DataFrame(x$sample_metadata), metadata = metadata)
}
