% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_series_expression}
\alias{gf_geo_series_expression}
\encoding{UTF-8}
\title{Open a GEO series (GSE) as GeneFox's GEO Expression screen does and report one gene or probe: its...}
\description{Open a GEO series (GSE) as GeneFox's GEO Expression screen does and report one gene or probe: its distribution, or grouped by a sample characteristic with GeneFox's test line and figure, split by a second characteristic (two-factor view), or, for a continuous characteristic left unbinned, the scatter of expression against it. Call first without group_by to list characteristics[]. csv / recipe write the screen's export. figure_kind heatmap forwards a gene/probe panel to the shared public GEO heatmap tool. Latency: 10 s-3 min cold (matrix download), instant when the series is cached. The figure is the app's GEO › Expression PNG export.}
\usage{
gf_geo_series_expression(
    session,
    `accession`,
    `annotations` = NULL,
    `binning` = NULL,
    `cluster_columns` = NULL,
    `cluster_rows` = NULL,
    `csv` = NULL,
    `dpi` = NULL,
    `exclude_low_depth` = NULL,
    `exclude_samples` = NULL,
    `figure` = NULL,
    `figure_kind` = NULL,
    `format` = NULL,
    `gene` = NULL,
    `genes` = NULL,
    `geometry` = NULL,
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
    `probe` = NULL,
    `probes` = NULL,
    `recipe` = NULL,
    `secondary_binning` = NULL,
    `secondary_group_by` = NULL,
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
\item{accession}{(string) GEO series accession, e.g. GSE62564.}
\item{annotations}{(array, optional) NULL omits it.}
\item{binning}{(string, optional; one of "off", "median_split", "tertiles", "quartiles", "quintiles"; default "off") Quantile binning for a numeric group_by. A continuous characteristic left unbinned draws the screen's scatter of expression against it instead. NULL omits it.}
\item{cluster_columns}{(boolean, optional; default true) Cluster samples within the measured workload limit. NULL omits it.}
\item{cluster_rows}{(boolean, optional; default true) Cluster genes within the measured workload limit. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{exclude_low_depth}{(boolean, optional; default false) On an integer count matrix, drop samples whose library size (column sum) is below low_depth_fraction of the median before normalizing; they are always flagged in data.library_sizes and the caption. NULL omits it.}
\item{exclude_samples}{(array, optional) Samples to leave out (the screen's Exclude Samples), by id from data.points. A saved view never records exclusions, so no deep link is returned while any are excluded. NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{figure_kind}{(string, optional; one of "expression", "heatmap"; default "expression") Use heatmap to forward this call to the same public GEO heatmap tool. It accepts genes, probes or preset; expression uses gene or probe. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{gene}{(string, optional) Gene symbol (exactly one of gene and probe). NULL omits it.}
\item{genes}{(array, optional) Gene symbols, resolved through the series platform annotation; multiple exact-symbol probes use highest whole-source finite-raw sample variance before filtering/normalization, with choices disclosed. Exactly one of genes, probes and preset. NULL omits it.}
\item{geometry}{(string, optional; one of "box", "strip", "violin", "histogram", "ecdf", "scatter") histogram (the ungrouped default) or ecdf for the distribution card, including under grouping with keep_groups preserved; box (default), strip or violin with one factor (bar and median_bar, retired, are read as box with a caveat for one release); box or strip with two (the dodged figures); scatter for a continuous group_by without binning (its default). NULL omits it.}
\item{group_by}{(string, optional) A characteristic key, copied exactly from characteristics[].untrusted_key of an ungrouped call. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{identifier_column}{(string, optional) Key the matrix rows by this supplementary column instead of the inferred one: its exact header text, from geo_supplementary_layout's identifier_candidates. Integrity still applies: a column with repeated or empty values, a sample column, or a header the file lacks is refused (invalid_argument, field identifier_column), never replaced. Reads supplementary files only (the named file, else the ranked walk). Links and recipes record it. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{keep_groups}{(array, optional) Show only these groups of group_by (for a continuous scatter, of its color, secondary_group_by), copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{low_depth_fraction}{(number, optional; default 0.1; range 0.001..0.999) Low-depth threshold as a fraction of the median library size (default 0.1). NULL omits it.}
\item{normalization}{(string, optional; one of "raw", "log2", "z_score", "tpm", "cpm", "log_cpm"; default "raw") Value transform, as the screen's picker offers it (raw is the screen default). cpm and log_cpm (edgeR::cpm, log_cpm with prior.count 2; library size = column sum, no TMM) are offered only on a matrix of non-negative integer counts. NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{preset}{(string, optional) Bundled gene-set preset name; exactly one of genes, probes and preset. NULL omits it.}
\item{probe}{(string, optional) Matrix row id, e.g. a probe set (exactly one of gene and probe). NULL omits it.}
\item{probes}{(array, optional) NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{secondary_binning}{(string, optional; one of "off", "median_split", "tertiles", "quartiles", "quintiles"; default "off") Quantile binning for a numeric secondary_group_by. NULL omits it.}
\item{secondary_group_by}{(string, optional) Split each group by a second characteristic key (the screen's Split by; a descriptive two-factor view, no test), or color the continuous scatter by it. Must differ from group_by. NULL omits it.}
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
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_series_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
