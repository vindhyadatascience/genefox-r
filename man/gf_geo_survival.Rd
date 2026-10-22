% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_survival}
\alias{gf_geo_survival}
\encoding{UTF-8}
\title{Kaplan-Meier survival from a GEO series' own sample metadata, as GeneFox's GEO Survival section computes...}
\description{Kaplan-Meier survival from a GEO series' own sample metadata, as GeneFox's GEO Survival section computes it, in two steps. First call with just accession (and optionally gene/probe) to list the candidate follow-up time columns and status columns with their values. Then call with time_key, time_unit, event_key and event_values (which status values mean the event occurred) to compute: all samples, or split at the median of the gene/probe with GeneFox's eligibility-gated log-rank; split_scheme=tertiles|quartiles with split_comparison=extremes|all uses the TCGA Survival tab's quantile split over the endpoint-eligible samples (type-7 cuts, ties lower, extremes log-rank + Cox or k-group + trend log-rank). Latency: the matrix download when cold, then instant. Numbers and figure match the app's section (a quantile split's figure is drawn by the same engine; the section offers the median only).}
\usage{
gf_geo_survival(
    session,
    `accession`,
    `dpi` = NULL,
    `event_key` = NULL,
    `event_values` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `gene` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `identifier_column` = NULL,
    `inline_image` = NULL,
    `normalization` = NULL,
    `output_name` = NULL,
    `probe` = NULL,
    `recipe` = NULL,
    `scrub_at_years` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `split_by_expression` = NULL,
    `split_comparison` = NULL,
    `split_scheme` = NULL,
    `supplementary_file` = NULL,
    `survival_detail` = NULL,
    `time_key` = NULL,
    `time_unit` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession, e.g. GSE62564.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{event_key}{(string, optional) The status column, copied exactly from a discover call's status_keys[].untrusted_key. NULL omits it.}
\item{event_values}{(array, optional) The status values that mean the event was observed (each one of the column's untrusted_values). Everything else is censored. NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{gene}{(string, optional) Gene symbol to split at the median (at most one of gene and probe; omit both for the whole-series curve). NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{identifier_column}{(string, optional) Key the matrix rows by this supplementary column instead of the inferred one: its exact header text, from geo_supplementary_layout's identifier_candidates. Integrity still applies: a column with repeated or empty values, a sample column, or a header the file lacks is refused (invalid_argument, field identifier_column), never replaced. Reads supplementary files only (the named file, else the ranked walk). Links and recipes record it. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{normalization}{(string, optional; one of "raw", "log2", "z_score", "tpm", "cpm", "log_cpm"; default "raw") The value transform the split reads (the screen's picker; raw is its default). NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{probe}{(string, optional) Matrix row id to split at the median. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{scrub_at_years}{(array, optional) Read the Kaplan-Meier figure at these times (years, each finite and at least 0; at most 20), as the app's hover card does: each time snaps to the nearest curve point and returns, per arm, survival and the number at risk AT the snapped time, plus the card's text. Answered in data.scrub, in request order. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{split_by_expression}{(boolean, optional; default true) With a gene or probe, split at its median (the section's toggle, on by default). NULL omits it.}
\item{split_comparison}{(string, optional; one of "extremes", "all"; default "extremes") For tertiles/quartiles: extremes compares the top vs bottom group (log-rank and Cox; the middle samples are counted as excluded); all draws every group with a k-group log-rank and a log-rank test for trend. Median requires extremes. NULL omits it.}
\item{split_scheme}{(string, optional; one of "median", "tertiles", "quartiles"; default "median") With a gene or probe and split_by_expression: median (default), tertiles or quartiles of the endpoint-eligible samples' values. Cuts are type-7 quantiles, a value tied at a cut stays in the lower group, and every group needs 3 samples or the split is refused. NULL omits it.}
\item{supplementary_file}{(string, optional) Exact decoded basename from geo_supplementary_layout. Analyze only this file, with no sibling or source fallback. No path, URL, encoding or surrounding whitespace. Explicit sources withhold saved-view links and recipes. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{time_key}{(string, optional) The follow-up time column, copied exactly from a discover call's time_keys[].untrusted_key. NULL omits it.}
\item{time_unit}{(string, optional; one of "days", "weeks", "months", "years"; default "months") What the time column counts (the section's picker; months is its default). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_survival} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
