% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_expression}
\alias{gf_tcga_expression}
\encoding{UTF-8}
\title{One gene's expression (or CNV / methylation) across a TCGA or other GDC cohort, as GeneFox's Expression...}
\description{One gene's expression (or CNV / methylation) across a TCGA or other GDC cohort, as GeneFox's Expression screen shows it: the distribution, or grouped by one clinical/sample factor (sample type, PanCanAtlas subtype, another gene's mutation status incl. one amino-acid change, sex, stage, grade, age, ...) with the screen's test banner and post-hoc summary, or split by a second factor. Returns n/median/quartiles, the screen's table and a PNG. Latency: 5-40 s cold (the case pull dominates; methylation adds a 22 MB probe manifest once). The grouped figure is the app's TCGA › Expression PNG export; the distribution and Gene Correlation figures use the same engine.}
\usage{
gf_tcga_expression(
    session,
    `gene`,
    `project`,
    `brackets` = NULL,
    `brackets_correction` = NULL,
    `brackets_test` = NULL,
    `color_by` = NULL,
    `csv` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `figure_kind` = NULL,
    `format` = NULL,
    `geometry` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `keep_color_groups` = NULL,
    `keep_groups` = NULL,
    `method` = NULL,
    `mutation_gene` = NULL,
    `output_name` = NULL,
    `recipe` = NULL,
    `saved_chart` = NULL,
    `second_gene` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `specific_mutation` = NULL,
    `stratify` = NULL,
    `stratify_secondary` = NULL,
    `survival_detail` = NULL,
    `track` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET/other GDC project id with a GDC Xena expression dataset, e.g. TCGA-BRCA.}
\item{brackets}{(string, optional; one of "none", "significant", "all"; default "none") On the one-factor grouped figure (box or violin): significance brackets from the screen's pairwise test. Two groups: Mann-Whitney U, its p, always drawn. Three or more: Dunn's test with Benjamini-Hochberg q; significant draws pairs with q < 0.05, all draws the rest as ns. At most 6, smallest q first; the figure's notes name the test and count what is not drawn. NULL omits it.}
\item{brackets_correction}{(string, optional; one of "holm", "bonferroni", "bh"; default "holm") With brackets_test t or welch and three or more groups: the multiple-comparison correction, as R's p.adjust. holm (default, R's), bonferroni, or bh (Benjamini-Hochberg). Labels read p.adj= for holm or bonferroni and q= for bh; a pair is drawn as significant when its adjusted value is under 0.05. NULL omits it.}
\item{brackets_test}{(string, optional; one of "nonparametric", "t", "welch", "tukey"; default "nonparametric") The brackets' test, with brackets significant or all. nonparametric (default): the screen's own tests, as brackets describes. t: R's defaults, t.test (Welch) for two groups and pairwise.t.test with one pooled SD for three or more. welch: Welch throughout, pairwise.t.test(pool.sd = FALSE) for three or more. tukey: Tukey's honest significant differences, as R's TukeyHSD(aov(x ~ g)), every pair against the studentized range over all groups (Tukey-Kramer for unequal sizes), labelled p.adj= with R's family-wise p adj and drawn as significant under 0.05; it takes no brackets_correction, and with two groups it equals the pooled t-test. Under t, welch or tukey with three or more groups the figure's notes also report the one-way ANOVA (reported only; it does not decide which pairs are drawn). NULL omits it.}
\item{color_by}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "none") With second_gene: color the scatter's points by this factor (the section's Color by); mutation needs mutation_gene. More than 8 color series is refused, the points drawn uncolored. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{figure_kind}{(string, optional; one of "distribution", "grouped", "correlation", "survival") Which of the screen's figures to draw: distribution (default ungrouped), grouped (default with stratify), correlation (default with second_gene) or survival (the median-split Kaplan-Meier report). NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{geometry}{(string, optional; one of "box", "strip", "violin", "histogram", "ecdf") The distribution figure (figure_kind distribution): histogram (the default) or ecdf (the screen's Cumulative distribution card). The grouped figure: box (the default, with the default sample_type grouping), strip or violin with one factor; box or strip with two, drawn dodged (bar, retired, is read as box with a caveat for one release). With figure_kind correlation or survival it is only the grouped figure's saved chart (the deep link and recipe keep it; the scatter or survival figure is drawn). NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{keep_color_groups}{(array, optional) Show only these groups of color_by (the correlation scatter's color), copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{keep_groups}{(array, optional) Show only these groups of stratify, copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{method}{(string, optional; one of "pearson", "spearman"; default "pearson") With second_gene: pearson (the default; draws the fit line) or spearman. NULL omits it.}
\item{mutation_gene}{(string, optional) The gene whose mutation status groups patients, when a factor is mutation (e.g. TP53). NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{saved_chart}{(string, optional; one of "box", "strip", "violin") With a distribution, correlation or survival export, retain this grouped chart control in its recipe while drawing the selected alternate figure. NULL omits it.}
\item{second_gene}{(string, optional) The Gene Correlation section: a second gene whose expression is paired with this gene's values sample by sample (Pearson r or Spearman rho, the scatter). NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{specific_mutation}{(string, optional) One amino-acid change of mutation_gene (e.g. R175H) for the three-group mutant/other/WT view; must be a change observed in the cohort. Omit for any mutation. NULL omits it.}
\item{stratify}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "sample_type") Group by this factor (sample_type by default, as every screen opens; none = the ungrouped distribution). subtype is TCGA only; mutation needs mutation_gene. NULL omits it.}
\item{stratify_secondary}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "none") Split each group by a second factor (descriptive two-factor view, no test). Needs stratify; must differ from it. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{track}{(string, optional; one of "expression", "cnv", "methylation"; default "expression") expression (STAR log2 TPM+1), cnv (gene-level GISTIC2) or methylation (mean HM450 beta); cnv and methylation are TCGA projects only. NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
