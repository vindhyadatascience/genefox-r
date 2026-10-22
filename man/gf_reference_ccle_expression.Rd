% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_reference_ccle_expression}
\alias{gf_reference_ccle_expression}
\encoding{UTF-8}
\title{One gene's expression across the CCLE cancer cell lines (Treehouse Cell Line Compendium v1, log2(TPM+1)),...}
\description{One gene's expression across the CCLE cancer cell lines (Treehouse Cell Line Compendium v1, log2(TPM+1)), as GeneFox's Reference › Cell Lines screen shows it: the distribution and its 7-statistic table, and the cell lines grouped by TCGA acronym, tissue, disease, histology or subtype with the screen's Mann-Whitney/Kruskal-Wallis banner and post-hoc summary, the top cell lines, and the grouped figure (box, violin or strip) or the histogram. csv and recipe as the screen exports them. Latency: 5-30 s cold (the cell-line index), seconds after. Both figures are the app screen's PNG export.}
\usage{
gf_reference_ccle_expression(
    session,
    `gene`,
    `csv` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `geometry` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `keep_groups` = NULL,
    `limit` = NULL,
    `output_name` = NULL,
    `recipe` = NULL,
    `saved_chart` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `stratify` = NULL,
    `survival_detail` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. SOX10. Upper-cased, as the screen does.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{geometry}{(string, optional; one of "box", "strip", "violin", "histogram") Figure: box (default when grouped), violin or strip for a grouping (the screen's chart picker); histogram for the distribution (the only figure when stratify=none) (bar and median_bar, retired, are read as box with a caveat for one release). NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{keep_groups}{(array, optional) Show only these groups of stratify, copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{limit}{(integer, optional; default 25; range 1..200) How many of the highest-expressing cell lines to list (the screen's table shows 200). NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{saved_chart}{(string, optional; one of "box", "strip", "violin") With a histogram export, retain this grouped chart control in its recipe. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{stratify}{(string, optional; one of "none", "tcga", "tissue", "disease", "histology", "subtype"; default "tissue") Group the cell lines by: none, tcga (TCGA acronym), tissue (the screen default), disease, histology or subtype. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{reference_ccle_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
