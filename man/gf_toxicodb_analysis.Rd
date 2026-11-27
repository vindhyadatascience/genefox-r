% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_toxicodb_analysis}
\alias{gf_toxicodb_analysis}
\encoding{UTF-8}
\title{ToxicoDB's own precomputed differential-expression results (limma; fold change, p-value and FDR exactly as...}
\description{ToxicoDB's own precomputed differential-expression results (limma; fold change, p-value and FDR exactly as ToxicoDB returns them, never recomputed). Give gene for its results across compounds, or compound (with dataset) for its results across genes. Each row is one compound x dataset x cell x dose x time contrast. Sorted by FDR. Latency: 1-20 s for a gene; a compound's answer is tens of MB, up to a minute.}
\usage{
gf_toxicodb_analysis(
    session,
    `compound` = NULL,
    `csv` = NULL,
    `dataset` = NULL,
    `gene` = NULL,
    `limit` = NULL,
    `max_fdr` = NULL,
    `species` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{compound}{(string, optional) Compound name, PubChem CID, or toxicodb:<id>; exactly one of gene and compound. NULL omits it.}
\item{csv}{(boolean, optional; default false) Also write the screen's CSV export (the app's own rows) under the output directory and return csv.path. NULL omits it.}
\item{dataset}{(string, optional) ToxicoDB dataset name: Open TG-GATEs Human, Open TG-GATEs Rat, DrugMatrix Rat or EMEXP2458. Required with compound. NULL omits it.}
\item{gene}{(string, optional) Gene symbol, Ensembl gene id, Entrez id, or toxicodb:<id>; exactly one of gene and compound. NULL omits it.}
\item{limit}{(integer, optional; default 200; range 1..2000) Most rows returned, smallest FDR first. NULL omits it.}
\item{max_fdr}{(number, optional; range 0..1) Keep rows whose ToxicoDB FDR is at most this. Default: every row. NULL omits it.}
\item{species}{(string, optional; one of "human", "rat") Gene species; needed when a symbol exists in both. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{toxicodb_analysis} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/toxicodb-analysis-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
