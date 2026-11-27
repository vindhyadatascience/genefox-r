% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_imported_de_enrichment}
\alias{gf_imported_de_enrichment}
\encoding{UTF-8}
\title{Analyze a complete precomputed gene-level DE CSV/TSV against validated bundled gene sets, free and locally}
\description{Analyze a complete precomputed gene-level DE CSV/TSV against validated bundled gene sets, free and locally. Requires at least 500 distinct exact gene symbols, finite log2FoldChange and raw pValue >0 and <=1; declare the full tested background including nonsignificant genes. Does not recompute DE or infer sample counts. Reports up/down overlap, expected overlap, conditional OR with one-sided lower 95\% bound, upper-tail p and BH q within each direction, overlapping genes and unavailable reasons. On request (pdf, html, csv; each off by default), writes a multipart branded PDF, matching HTML and full CSV when an output directory is configured.}
\usage{
gf_imported_de_enrichment(
    session,
    `comparison`,
    `complete_universe`,
    `source`,
    `table`,
    `csv` = NULL,
    `foreground_size` = NULL,
    `generated_at` = NULL,
    `html` = NULL,
    `pdf` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{comparison}{(string) Effect direction, 1–200 UTF-8 bytes without control characters; positive effects mean the first group is higher.}
\item{complete_universe}{(boolean; default false) Must be true: one row per exact gene symbol, including all tested genes, even nonsignificant ones. GeneFox cannot verify this.}
\item{source}{(string) User-declared origin of the precomputed DE table; 1–200 UTF-8 bytes, no control characters; not independently verified.}
\item{table}{(string) CSV/TSV with gene, log2FoldChange and raw pValue; <=2 MiB and <=50000 rows. No filtered hit list or gene panel.}
\item{csv}{(boolean, optional; default false) Also write every result and provenance as a create-only CSV. NULL omits it.}
\item{foreground_size}{(integer, optional; default 200; range 1..200) Maximum nonneutral genes per direction, ranked by sign(effect) * -log10(raw p). Zero effects and p=1 are neutral. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 report timestamp with time zone; omitted uses the current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML report. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write one complete multipart branded PDF with methods and every table row. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{imported_de_enrichment} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/imported-de-enrichment-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
