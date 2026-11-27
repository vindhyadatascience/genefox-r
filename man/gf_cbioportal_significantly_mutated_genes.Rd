% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_significantly_mutated_genes}
\alias{gf_cbioportal_significantly_mutated_genes}
\encoding{UTF-8}
\title{Retrieve published MutSig significantly mutated genes for a curated study, distinct from GISTIC...}
\description{Retrieve published MutSig significantly mutated genes for a curated study, distinct from GISTIC copy-number results. Preserves provider ranks, mutation counts and exact p/q JSON decimal tokens as strings; no statistics are recomputed. All pages are retrieved or the query refuses. Algorithm version, bases covered and original censoring bounds are unavailable if absent from the API. Empty or unsupported endpoints mean unavailable results, not zero significant genes. Chart shows the first 12 ranked genes; complete tables and CSV retain all records and original source JSON. On request (pdf, html, csv; each off by default), writes a branded PDF, matching HTML and full CSV when an output directory is configured. Latency: 10–180 s.}
\usage{
gf_cbioportal_significantly_mutated_genes(
    session,
    `study_id`,
    `csv` = NULL,
    `generated_at` = NULL,
    `html` = NULL,
    `pdf` = NULL,
    `portal` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{study_id}{(string) Curated study id from cbioportal_studies in its catalog portal. Uncurated ids are refused with closest matches.}
\item{csv}{(boolean, optional; default false) Also write all published ranks, counts, exact p/q source tokens and original record JSON. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 report timestamp with time zone; omitted uses current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML report. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write one branded PDF containing the chart and complete paginated tables. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_significantly_mutated_genes} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/cbioportal-significantly-mutated-genes-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
