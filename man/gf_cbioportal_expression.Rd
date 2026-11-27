% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_expression}
\alias{gf_cbioportal_expression}
\encoding{UTF-8}
\title{One gene's mRNA expression in a curated cBioPortal study, one box per contributing program (the study's...}
\description{One gene's mRNA expression in a curated cBioPortal study, one box per contributing program (the study's COHORT attribute: PBTA, TARGET, GTEx, TCGA, …), never pooled, as GeneFox's cBioPortal screen shows it, optionally restricted to one cancer-type subset (subset, from cbioportal_composition). A study without COHORT (e.g. a gdc-routed TCGA study) is one 'All samples' box (data.split_by_cohort false). Values are the study's own profile (log2(value+1); plan.is_tpm says whether that is TPM), not GeneFox's TOIL scale. The figure is the app's PNG export. Latency: 10-90 s.}
\usage{
gf_cbioportal_expression(
    session,
    `gene`,
    `study_id`,
    `dpi` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `outline_text` = NULL,
    `output_name` = NULL,
    `portal` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `subset` = NULL,
    `survival_detail` = NULL,
    `survival_median_lines` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{study_id}{(string) Curated study id from cbioportal_studies in its catalog portal. Uncurated ids are refused with closest matches.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") Figure format: png (raster, default), svg (vector with editable text), or tiff (raster, .tif); one per run. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Write the screen's single-figure HTML export under the output directory and return html.path. Requires figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include PNG MCP image content up to 1,048,576 bytes; larger files stay on disk and disclose inline_image_omitted. NULL omits it.}
\item{outline_text}{(boolean, optional; default false) With format svg, write labels as glyph outlines instead of editable text. Refused with other formats. NULL omits it.}
\item{output_name}{(string, optional) Optional figure name replacing tool and title slug: up to 64 letters, digits, '.', '_' or '-'; starts alphanumeric, no '..'. Session number, size and extension remain; collisions get -2, -3, etc. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{subset}{(string, optional) Exact subset value from cbioportal_composition data.subset.options[].untrusted_value (default: every sample). NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{survival_median_lines}{(boolean, optional; default false) Figure style: draw dashed median survival guides for reached medians. NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/cbioportal-expression-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
