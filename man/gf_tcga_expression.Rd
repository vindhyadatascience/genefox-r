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
    `outline_text` = NULL,
    `output_name` = NULL,
    `recipe` = NULL,
    `saved_chart` = NULL,
    `second_gene` = NULL,
    `selection` = NULL,
    `show_caption_color_keys` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `specific_mutation` = NULL,
    `stratify` = NULL,
    `stratify_derived` = NULL,
    `stratify_secondary` = NULL,
    `survival_detail` = NULL,
    `survival_median_lines` = NULL,
    `track` = NULL,
    `width_in` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET/other GDC project id with a GDC Xena expression dataset, e.g. TCGA-BRCA.}
\item{brackets}{(string, optional; one of "none", "significant", "all"; default "none") One-factor grouped box or violin: significance brackets. Two groups: Mann-Whitney U p, always drawn. Three or more: Dunn with Benjamini-Hochberg q; significant draws q < 0.05, all draws the rest as ns. At most 6, smallest q first; notes name the test and count omitted pairs. NULL omits it.}
\item{brackets_correction}{(string, optional; one of "holm", "bonferroni", "bh"; default "holm") With brackets_test t or welch and 3+ groups: R p.adjust: holm (default), bonferroni or bh (Benjamini-Hochberg). Labels p.adj= for holm/bonferroni, q= for bh; significant if adjusted value < 0.05. NULL omits it.}
\item{brackets_test}{(string, optional; one of "nonparametric", "t", "welch", "tukey"; default "nonparametric") With brackets significant or all: nonparametric (default) uses the tests in brackets. t: R's t.test (Welch) for two groups, pairwise.t.test with pooled SD for 3+. welch: Welch throughout, pairwise.t.test(pool.sd = FALSE) for 3+. tukey: Tukey HSD, R's TukeyHSD(aov(x ~ g)), studentized range (Tukey-Kramer for unequal sizes), family-wise p.adj < 0.05; no brackets_correction, and with two groups equals pooled t-test. For t, welch or tukey with 3+ groups, notes report one-way ANOVA; it does not decide drawn pairs. NULL omits it.}
\item{color_by}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "none") With second_gene: color by factor; mutation requires mutation_gene. Over 8 color series is refused and points are drawn uncolored. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{figure_kind}{(string, optional; one of "distribution", "grouped", "correlation", "survival") Figure: distribution (ungrouped default), grouped (default with stratify), correlation (default with second_gene) or survival (median-split Kaplan-Meier). NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") Figure format: png (raster, default), svg (vector with editable text), or tiff (raster, .tif); one per run. NULL omits it.}
\item{geometry}{(string, optional; one of "box", "strip", "violin", "histogram", "ecdf") Distribution: histogram (default) or ecdf. Grouped: box (default with sample_type), strip or violin; two factors dodged; bar becomes box with a caveat. For correlation or survival, this controls the grouped chart in the deep link and recipe; the selected figure is drawn. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Write the screen's single-figure HTML export under the output directory and return html.path. Requires figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include PNG MCP image content up to 1,048,576 bytes; larger files stay on disk and disclose inline_image_omitted. NULL omits it.}
\item{keep_color_groups}{(array, optional) Show only these groups of color_by (the correlation scatter's color), copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{keep_groups}{(array, optional) Show only these groups of stratify, copied exactly from a previous call's levels (the screen's group filter). Statistics (r, r², n, the group test and its df) are recomputed on the retained samples with the other levels dropped, as R's droplevels(subset(...)); a level not in the data is refused, never ignored. NULL omits it.}
\item{method}{(string, optional; one of "pearson", "spearman"; default "pearson") With second_gene: pearson (the default; draws the fit line) or spearman. NULL omits it.}
\item{mutation_gene}{(string, optional) The gene whose mutation status groups patients, when a factor is mutation (e.g. TP53). NULL omits it.}
\item{outline_text}{(boolean, optional; default false) With format svg, write labels as glyph outlines instead of editable text. Refused with other formats. NULL omits it.}
\item{output_name}{(string, optional) Optional figure name replacing tool and title slug: up to 64 letters, digits, '.', '_' or '-'; starts alphanumeric, no '..'. Session number, size and extension remain; collisions get -2, -3, etc. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Write an app recipe that reopens this analysis and return recipe.path. NULL omits it.}
\item{saved_chart}{(string, optional; one of "box", "strip", "violin") With distribution, correlation or survival export, retain this grouped chart control in the recipe while drawing the selected figure. NULL omits it.}
\item{second_gene}{(string, optional) A second gene for sample-by-sample expression correlation (Pearson r or Spearman rho). NULL omits it.}
\item{selection}{(object, optional) Select the cohort by material and cancer context instead of the default patient tumor + normal samples (the GDC sample metadata, never barcodes; see tcga_cohort_composition for the labels). Models are one observation per model sample and never pooled with patient tissue: two or more materials need compare_by material. Survival stays with patient baseline tumors. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{specific_mutation}{(string, optional) An observed amino-acid change of mutation_gene (e.g. R175H) for the mutant/other/WT view. Omit for any mutation. NULL omits it.}
\item{stratify}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "sample_type") Group by factor (sample_type default; none for ungrouped). subtype requires TCGA; mutation requires mutation_gene. NULL omits it.}
\item{stratify_derived}{(object, optional) Group by a derived variable instead of a stratify factor (GeneFox's derived-variable recipe). sourceColumn is age_at_index with a numeric_threshold rule (bins the age itself), or a case-level factor token (gender, vital_status, stage, race, ethnicity, age_group, diagnosis, disease_type, grade) with a category_merge rule over that factor's labels. One factor only: no stratify, stratify_secondary or keep_groups beside it, and no saved recipe or link. NULL omits it.}
\item{stratify_secondary}{(string, optional; one of "none", "sample_type", "subtype", "mutation", "sex_at_birth", "vital_status", "stage", "race", "ethnicity", "age_group", "diagnosis", "disease_type", "grade"; default "none") Split each group by a second factor (descriptive two-factor view, no test). Needs stratify; must differ from it. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{survival_median_lines}{(boolean, optional; default false) Figure style: draw dashed median survival guides for reached medians. NULL omits it.}
\item{track}{(string, optional; one of "expression", "cnv", "methylation"; default "expression") expression (STAR log2 TPM+1), cnv (gene-level GISTIC2), or methylation (mean HM450 beta). cnv and methylation require TCGA. NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_expression} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/tcga-expression-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
