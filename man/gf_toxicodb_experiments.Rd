% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_toxicodb_experiments}
\alias{gf_toxicodb_experiments}
\encoding{UTF-8}
\title{One gene's ToxicoDB expression under one compound: every sample by dose (Control, Low, Middle, High:...}
\description{One gene's ToxicoDB expression under one compound: every sample by dose (Control, Low, Middle, High: categorical labels, not concentrations) and time (h), for one dataset x cell panel at a time (panels are never pooled). figure_kind=time_course draws time on x with one line per dose and every replicate as a point; dose_box draws boxes by dose at each time. Values are ToxicoDB's processed expression, unchanged. In vitro hepatocyte and hepatoma material only. Latency: 1-20 s.}
\usage{
gf_toxicodb_experiments(
    session,
    `compound`,
    `gene`,
    `cell` = NULL,
    `center` = NULL,
    `csv` = NULL,
    `dataset` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `figure_kind` = NULL,
    `format` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `outline_text` = NULL,
    `output_name` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `species` = NULL,
    `survival_detail` = NULL,
    `survival_median_lines` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{compound}{(string) Compound name, PubChem CID, or toxicodb:<id>.}
\item{gene}{(string) Gene symbol, Ensembl gene id, Entrez id, or toxicodb:<id>.}
\item{cell}{(string, optional) Cell within the dataset (Hepatocyte, Hep-G2, HepaRG). NULL omits it.}
\item{center}{(string, optional; one of "median", "mean"; default "median") Time-course line center per dose and time. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dataset}{(string, optional) ToxicoDB dataset name: Open TG-GATEs Human, Open TG-GATEs Rat, DrugMatrix Rat or EMEXP2458. Default: the first panel returned. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{figure_kind}{(string, optional; one of "time_course", "dose_box"; default "time_course") Which figure to draw. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") Figure format: png (raster, default), svg (vector with editable text), or tiff (raster, .tif); one per run. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Write the screen's single-figure HTML export under the output directory and return html.path. Requires figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include PNG MCP image content up to 1,048,576 bytes; larger files stay on disk and disclose inline_image_omitted. NULL omits it.}
\item{outline_text}{(boolean, optional; default false) With format svg, write labels as glyph outlines instead of editable text. Refused with other formats. NULL omits it.}
\item{output_name}{(string, optional) Optional figure name replacing tool and title slug: up to 64 letters, digits, '.', '_' or '-'; starts alphanumeric, no '..'. Session number, size and extension remain; collisions get -2, -3, etc. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{species}{(string, optional; one of "human", "rat") Gene species; needed when a symbol exists in both. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{survival_median_lines}{(boolean, optional; default false) Figure style: draw dashed median survival guides for reached medians. NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{toxicodb_experiments} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/toxicodb-experiments-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
