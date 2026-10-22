% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_heatmap}
\alias{gf_tcga_heatmap}
\encoding{UTF-8}
\title{An expression heatmap of a gene panel across one TCGA or other GDC cohort, as GeneFox's Heatmap screen...}
\description{An expression heatmap of a gene panel across one TCGA or other GDC cohort, as GeneFox's Heatmap screen draws it: every sample (tumor then normal), each gene z-scored or raw log2(TPM+1), genes and samples clustered (UPGMA) within this host's measured leaf limit or ordered by principal component above it (the notice says which and why), pinned expression rows on top, annotation strips (sample type, subtype, stage, … and one Mutant/WT strip per mutation gene), and every gene it could not draw named. genes (2 to 1,000), one of the app's bundled presets, or from_differential_expression: the top top_n genes up and down (by BH q, then |effect|) of a tcga_differential_expression comparison, its tested samples as columns under a DE group strip. csv (long format, values as drawn), recipe, html. Latency: 10-60 s cold (the matrix fetch dominates). The figure is the app screen's PNG export.}
\usage{
gf_tcga_heatmap(
    session,
    `project`,
    `annotations` = NULL,
    `cluster_columns` = NULL,
    `cluster_rows` = NULL,
    `csv` = NULL,
    `dpi` = NULL,
    `figure` = NULL,
    `format` = NULL,
    `from_differential_expression` = NULL,
    `genes` = NULL,
    `height_in` = NULL,
    `html` = NULL,
    `inline_image` = NULL,
    `mutation_genes` = NULL,
    `output_name` = NULL,
    `pinned_genes` = NULL,
    `preset` = NULL,
    `recipe` = NULL,
    `show_caption_color_keys` = NULL,
    `show_dendrograms` = NULL,
    `show_figure_legends` = NULL,
    `show_row_counts` = NULL,
    `size` = NULL,
    `survival_detail` = NULL,
    `top_n` = NULL,
    `width_in` = NULL,
    `z_normalize` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET/other GDC project id with a GDC Xena expression dataset, e.g. TCGA-BRCA.}
\item{annotations}{(array, optional) The annotation strips (the screen's Annotate samples by menu); default sample_type, subtype, stage. mutation draws one strip per mutation_genes entry. A strip this cohort cannot supply is named in the notices, not drawn. NULL omits it.}
\item{cluster_columns}{(boolean, optional; default true) Cluster the samples (columns). NULL omits it.}
\item{cluster_rows}{(boolean, optional; default true) Cluster the genes (rows). NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dpi}{(integer, optional; default 300; range 72..1200) Resolution of a custom size (at most 8,192 px a side and 16 MP). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{format}{(string, optional; one of "png", "svg", "tiff"; default "png") File format the figure is written as: png (raster, the default), svg (vector, with its labels as editable text), or tiff (raster, .tif, for journal submission). Every figure is written in all three formats. NULL omits it.}
\item{from_differential_expression}{(object, optional) Open the heatmap of a differential-expression comparison's top genes (the Differential screen's Heatmap of top genes button): the tcga_differential_expression arguments that define it, on this project. Its genes are the top top_n each way by BH q, then |effect|, then symbol; its tested samples are the columns, with a DE group strip first. Exactly one of genes, preset and from_differential_expression. NULL omits it.}
\item{genes}{(array, optional) The gene panel (at least 2), e.g. ["ESR1","PGR","ERBB2"]; canonicalized through the existing human symbol/alias reference and de-duplicated as the screen parses it; typed tokens and exact dataset mappings remain inspectable. Exactly one of genes and preset. NULL omits it.}
\item{height_in}{(number, optional; range 1..40) Custom figure height in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the screen's single-figure HTML export (the app's own document: title, subtitle, source, the figure and its table, plus the figure's alt text as the image alt and its data table) under the output directory and return html.path. Needs figure. NULL omits it.}
\item{inline_image}{(boolean, optional; default false) Include MCP image content for a written PNG up to 1,048,576 bytes; larger PNGs disclose inline_image_omitted and remain on disk. NULL omits it.}
\item{mutation_genes}{(array, optional) With annotations including mutation: one Mutant/WT strip per gene (GDC non-silent mutations), in order. NULL omits it.}
\item{output_name}{(string, optional) Optional name for the figure file, in place of the tool name and title slug. Letters, digits, '.', '_' and '-' only, starting with a letter or digit, at most 64 characters, no '..'. The file keeps its session number, size and extension, and a name already taken gets -2, -3, and so on. NULL omits it.}
\item{pinned_genes}{(array, optional) Genes drawn as pinned expression rows at the top, in pin order, excluded from clustering (the screen's Pinned expression). Pins and mutation strips share an 8-track limit. NULL omits it.}
\item{preset}{(string, optional) The name of one of the app's bundled gene-set presets (the panel's Load preset… menu), exactly as listed. Exactly one of genes, preset and from_differential_expression. NULL omits it.}
\item{recipe}{(boolean, optional; default false) Also write a GeneFox recipe file (the app's recipe format) that reopens this analysis in the app, and return recipe.path. NULL omits it.}
\item{show_caption_color_keys}{(boolean, optional; default true) Figure style: a table caption carries the sentence explaining the figure's colors. NULL omits it.}
\item{show_dendrograms}{(boolean, optional; default true) Draw the gene and sample trees of a clustered axis (the screen's Show dendrograms). NULL omits it.}
\item{show_figure_legends}{(boolean, optional; default true) Figure style: the figure draws its own legend. NULL omits it.}
\item{show_row_counts}{(boolean, optional; default true) Figure style: a box plot's row labels carry each group's n. NULL omits it.}
\item{size}{(string, optional; one of "single_column", "one_and_a_half_column", "double_column", "slide", "poster"; default "double_column") Figure size preset (the app's export presets); double_column is the app default. NULL omits it.}
\item{survival_detail}{(string, optional; one of "none", "inference", "inferenceAndEffect", "full"; default "inferenceAndEffect") Figure style: how much of a Kaplan-Meier findings block to draw (the app's Figure Style setting). NULL omits it.}
\item{top_n}{(integer, optional; default 25; range 1..100) With from_differential_expression: genes per direction (the Differential screen's stepper). Fewer are drawn when fewer rank; the notices say so. NULL omits it.}
\item{width_in}{(number, optional; range 1..40) Custom figure width in inches (with the other side; instead of size). The app's size control range. NULL omits it.}
\item{z_normalize}{(boolean, optional; default true) Z-score each gene across samples (the screen's Z-normalize per gene). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_heatmap} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
