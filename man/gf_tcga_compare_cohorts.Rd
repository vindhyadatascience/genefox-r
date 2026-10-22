% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_compare_cohorts}
\alias{gf_tcga_compare_cohorts}
\encoding{UTF-8}
\title{One gene's participant-level expression across several GDC cohorts on one common scale, as GeneFox's...}
\description{One gene's participant-level expression across several GDC cohorts on one common scale, as GeneFox's Compare Cohorts screen draws it: each cohort's baseline-tumor arm, optionally its tissue-normal arm and the matched GTEx normal tissue (identical GTEx references drawn once), with the screen's report table (Group/n/Mean/Median/Q1/Q3 and the significance line, pairing-aware) and every disclosure (arms a cohort could not supply, exact vs proxy GTEx sites). Fail-closed like the app: if any cohort cannot contribute its tumor arm, or the cohorts cannot share one scale, nothing is published and the app's sentence is returned. Arms come back in the order GeneFox draws them. csv, recipe, html. Latency: 10 s to several minutes cold (one classification and one fetch per cohort). The figure is the app screen's PNG export (box, violin or strip).}
\usage{
gf_tcga_compare_cohorts(
    session,
    `gene`,
    `project_ids`,
    `csv` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `geometry` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `include_adjacent` = NULL,
    `include_gtex` = NULL,
    `inline_image` = NULL,
    `output_name` = NULL,
    `recipe` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `survival_detail` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{project_ids}{(array) The cohorts to compare (GDC projects with a Xena expression dataset), e.g. ["TCGA-STAD","TCGA-PAAD"]. The figure draws them in the order GeneFox's runner draws them.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{geometry}{(string, optional; one of "box", "strip", "violin"; default "box") The screen's chart picker: box (default), violin or strip (bar and median_bar, retired, are read as box with a caveat for one release). NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{include_adjacent}{(boolean, optional; default true) Also draw each cohort's baseline tissue-normal arm (the screen's Adjacent normal switch). NULL omits it.}
\item{include_gtex}{(boolean, optional; default true) Also draw each cohort's matched GTEx normal tissue on the TOIL scale (the screen's GTEx switch). NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_compare_cohorts} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
