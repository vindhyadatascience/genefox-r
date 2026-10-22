% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_survival}
\alias{gf_tcga_survival}
\encoding{UTF-8}
\title{Survival of a TCGA/GDC project's patients (Kaplan-Meier; eligible two-group log-rank, Cox HR for...}
\description{Survival of a TCGA/GDC project's patients (Kaplan-Meier; eligible two-group log-rank, Cox HR for expression splits), with its figure. With neither stratify nor gene it is the whole-cohort (overall) curve every survival screen opens on. stratify=expression (implied by a gene with no stratify) splits baseline-tumor patients at the median of one gene: outcome OS is GeneFox's Expression screen survival report (GDC clinical follow-up), and split_on=cnv|methylation splits on that gene's copy number or methylation instead (OS only, TCGA only); DSS, PFI and DFI are the Survival tab's PanCanAtlas endpoints (TCGA only). stratify=none is the Survival tab's whole-cohort curve for any outcome (no gene). Clinical stratify uses GDC case fields; mutation splits non-silent mutation status for gene. split_scheme=tertiles|quartiles with split_comparison=extremes|all uses the Survival tab, with shared cut points, exclusions, omnibus/trend tests and ordered hues (expression and methylation; CNV stays median-only by design). Clinical/mutation splits use the Survival tab's analysis for every endpoint (the app's PNG). csv / recipe write the screen's export. Latency: 5-30 s cold. Figures: OS median expression/track splits and the Survival tab's median, whole-cohort, categorical and quantile curves are the app's PNG exports; a methylation quantile figure is drawn by the same engine but has no app screen (the app's Survival tab analyzes expression only).}
\usage{
gf_tcga_survival(
    session,
    `project`,
    `csv` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `gene` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `outcome` = NULL,
    `output_name` = NULL,
    `recipe` = NULL,
    `scrub_at_years` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `split_comparison` = NULL,
    `split_on` = NULL,
    `split_scheme` = NULL,
    `stratify` = NULL,
    `survival_detail` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET project id, e.g. TCGA-KIRC.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{gene}{(string, optional) HGNC gene symbol for expression or mutation survival (required); forbidden for clinical or none. Upper-cased, as the app does. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{outcome}{(string, optional; one of "OS", "DSS", "PFI", "DFI"; default "OS") OS (overall survival, GDC clinical; the default), or a PanCanAtlas endpoint: DSS (disease-specific), PFI (progression-free interval), DFI (disease-free interval). DSS/PFI/DFI are TCGA projects only. NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{scrub_at_years}{(array, optional) Read the Kaplan-Meier figure at these times (years, each finite and at least 0; at most 20), as the app's hover card does: each time snaps to the nearest curve point and returns, per arm, survival and the number at risk AT the snapped time, plus the card's text. Answered in data.scrub, in request order. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{split_comparison}{(string, optional; one of "extremes", "all"; default "extremes") For tertiles/quartiles: extremes compares top vs bottom and counts excluded middle patients; all draws every group with omnibus and trend log-rank tests. Median requires extremes. NULL omits it.}
\item{split_on}{(string, optional; one of "expression", "cnv", "methylation"; default "expression") For stratify=expression only. What the median split reads: expression (default), cnv (gene-level GISTIC2) or methylation (mean HM450 beta). cnv and methylation are OS only and TCGA only, as in the app. NULL omits it.}
\item{split_scheme}{(string, optional; one of "median", "tertiles", "quartiles"; default "median") Expression and methylation only: median (default), tertiles or quartiles. Quantiles use the Survival tab's analysis for every endpoint; CNV remains median only. NULL omits it.}
\item{stratify}{(string, optional; one of "expression", "none", "mutation", "sex_at_birth", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "none") none: the whole-cohort curve (the default with no gene, as every survival screen opens); expression: gene median split (the default when gene is given); mutation: Mutant vs WT for gene. Clinical factors use case fields without gene. Vital status, sample type and molecular subtype are forbidden. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_survival} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
