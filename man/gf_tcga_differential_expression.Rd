% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_differential_expression}
\alias{gf_tcga_differential_expression}
\encoding{UTF-8}
\title{Two-group differential expression on a gene panel in one TCGA or other GDC cohort, as GeneFox's...}
\description{Two-group differential expression on a gene panel in one TCGA or other GDC cohort, as GeneFox's Differential screen computes it: per-gene two-sided Mann-Whitney on one mean per patient, Benjamini-Hochberg over the WHOLE requested panel (unresolved or underpowered genes kept at p = 1), the volcano, the ranked table and the CSV. Four contrasts (each offered where the data allows): tumor_vs_normal (baseline tumors vs GTEx donors of the matched tissue, TOIL hub), expression_high_low (median split of split_gene), subgroup (two levels of a clinical factor or molecular subtype), mutation_status (split_gene Mutant vs WT). Panel: genes (2-80), a bundled preset, or the screen's default panel. csv, recipe, html. Latency: 10-60 s cold. The figure is the app screen's PNG export.}
\usage{
gf_tcga_differential_expression(
    session,
    `project`,
    `arm_order` = NULL,
    `csv` = NULL,
    `dpi` = NULL,
    `factor` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `genes` = NULL,
    `group1` = NULL,
    `group2` = NULL,
    `gtex_tissue` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `log2fc_cutoff` = NULL,
    `mode` = NULL,
    `output_name` = NULL,
    `preset` = NULL,
    `q_cutoff` = NULL,
    `recipe` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `sort` = NULL,
    `split_gene` = NULL,
    `survival_detail` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET/other GDC project id with a GDC Xena expression dataset, e.g. TCGA-BRCA.}
\item{arm_order}{(string, optional; one of "high_first", "low_first", "mutant_first", "wt_first") A split's arm order: high_first (default) or low_first for expression_high_low, mutant_first (default) or wt_first for mutation_status. The second order inverts every fold change. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{factor}{(string, optional; one of "subtype", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade") subgroup: the variable whose two levels are compared (the Variable picker). Default: Stage, else the first factor this cohort can compare. NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{genes}{(array, optional) The gene panel (2 to 80 distinct symbols), canonicalized through the existing human symbol/alias reference and de-duplicated as the screen parses its panel field; typed tokens and exact dataset mappings remain inspectable. At most one of genes and preset; neither is the screen's default panel. NULL omits it.}
\item{group1}{(string, optional) subgroup: the first level (Group 1), one of the factor's testable levels (data.levels). With group2, or neither: the first two testable levels. Unicode labels allowed; control and format characters refused by the server. NULL omits it.}
\item{group2}{(string, optional) subgroup: the second level (Group 2). Swapping the groups inverts every fold change. Unicode labels allowed; control and format characters refused by the server. NULL omits it.}
\item{gtex_tissue}{(string, optional) tumor_vs_normal: one mapped GTEx tissue, required when the project maps to several. Only this tissue contributes donor means; tissues are never pooled. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{log2fc_cutoff}{(number, optional; default 1; range 0..3) The |Δ mean log₂ expression| threshold the volcano and table shade by (the screen's slider range, 0 to 3). It never enters the test. NULL omits it.}
\item{mode}{(string, optional; one of "tumor_vs_normal", "expression_high_low", "subgroup", "mutation_status") The contrast (the screen's Contrast picker). Default: the screen's for this cohort (tumor_vs_normal where offered, else subgroup). NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{preset}{(string, optional) The name of one of the app's bundled gene-set presets (the panel's Load preset… menu), exactly as listed. NULL omits it.}
\item{q_cutoff}{(number, optional; default 0.05; range 0.0001..1) The BH q threshold (the screen's FDR slider range, 0.0001 to 1). It never enters the test. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{sort}{(string, optional; one of "q", "effect"; default "q") The on-screen table's order: q (the kernel's p-then-symbol order) or effect (|Δ| descending). The CSV and report table keep the kernel's order. NULL omits it.}
\item{split_gene}{(string, optional) expression_high_low: the gene whose patient-level median splits patients High vs Low; mutation_status: the gene whose non-silent mutations split Mutant vs WT. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_differential_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
