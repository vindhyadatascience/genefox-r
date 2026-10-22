% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_heatmap}
\alias{gf_geo_heatmap}
\encoding{UTF-8}
\title{Draw GeneFox's public GEO expression heatmap from a whole series matrix, using the same shared analysis...}
\description{Draw GeneFox's public GEO expression heatmap from a whole series matrix, using the same shared analysis and figure engine as the GeneFox apps. Give a gene panel, exact probes, or a bundled preset. Optional characteristic strips, group selection and sample exclusions; missing rows/cells, annotation overflow and workload-limited clustering are disclosed. Descriptive only. CSV contains the displayed values. Public GEO access is free.}
\usage{
gf_geo_heatmap(
    session,
    `accession`,
    `annotations` = NULL,
    `cluster_columns` = NULL,
    `cluster_rows` = NULL,
    `csv` = NULL,
    `dpi` = NULL,
    `exclude_low_depth` = NULL,
    `exclude_samples` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `genes` = NULL,
    `group_by` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `identifier_column` = NULL,
    `inline_image` = NULL,
    `keep_groups` = NULL,
    `low_depth_fraction` = NULL,
    `normalization` = NULL,
    `output_name` = NULL,
    `preset` = NULL,
    `probes` = NULL,
    `show_caption_color_keys` = NULL,
    `show_dendrograms` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `supplementary_file` = NULL,
    `survival_detail` = NULL,
    `width_in` = NULL,
    `z_normalize` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession.}
\item{annotations}{(array, optional) NULL omits it.}
\item{cluster_columns}{(boolean, optional; default true) Cluster samples within the measured workload limit. NULL omits it.}
\item{cluster_rows}{(boolean, optional; default true) Cluster genes within the measured workload limit. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{exclude_low_depth}{(boolean, optional; default false) On an integer count matrix, drop samples whose library size (column sum) is below low_depth_fraction of the median before normalizing; they are always flagged in data.library_sizes and the caption. NULL omits it.}
\item{exclude_samples}{(array, optional) Samples to leave out (the screen's Exclude Samples), by id from data.points. A saved view never records exclusions, so no deep link is returned while any are excluded. NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{genes}{(array, optional) Gene symbols, resolved through the series platform annotation; multiple exact-symbol probes use highest whole-source finite-raw sample variance before filtering/normalization, with choices disclosed. Exactly one of genes, probes and preset. NULL omits it.}
\item{group_by}{(string, optional) Characteristic whose levels keep_groups selects; does not change expression values. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{identifier_column}{(string, optional) Key the matrix rows by this supplementary column instead of the inferred one: its exact header text, from geo_supplementary_layout's identifier_candidates. Integrity still applies: a column with repeated or empty values, a sample column, or a header the file lacks is refused (invalid_argument, field identifier_column), never replaced. Reads supplementary files only (the named file, else the ranked walk). Links and recipes record it. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{keep_groups}{(array, optional) Show only these groups of group_by, copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{low_depth_fraction}{(number, optional; default 0.1; range 0.001..0.999) Low-depth threshold as a fraction of the median library size (default 0.1). NULL omits it.}
\item{normalization}{(string, optional; one of "raw", "log2", "tpm", "cpm", "log_cpm"; default "raw") Author values, log2(x+1), supplied TPM, or existing GeneFox CPM/log-CPM (integer counts only, full-source library sizes; no TMM). NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{preset}{(string, optional) Bundled gene-set preset name; exactly one of genes, probes and preset. NULL omits it.}
\item{probes}{(array, optional) NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_dendrograms}{(boolean, optional; default true) Display the trees found by the analysis; never changes order. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{supplementary_file}{(string, optional) Exact decoded basename from geo_supplementary_layout. Analyze only this file, with no sibling or source fallback. No path, URL, encoding or surrounding whitespace. Explicit sources withhold saved-view links and recipes. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{z_normalize}{(boolean, optional; default true) Per-gene z-score after base normalization, across retained samples. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_heatmap} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
