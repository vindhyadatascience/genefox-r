% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_alterations}
\alias{gf_cbioportal_alterations}
\encoding{UTF-8}
\title{How often one gene is altered in a curated cBioPortal study, as GeneFox's cBioPortal screen reports it:...}
\description{How often one gene is altered in a curated cBioPortal study, as GeneFox's cBioPortal screen reports it: mutated, amplified, deep-deleted and unaltered among the samples the portal lists as PROFILED for the gene (the denominator), with mutation classes and the screen's coverage caveat and independently resolved gene-panel membership. Study-wide: not restricted to a cancer-type subset (the screen's subset applies to expression only). No figure (the screen shows rows). Latency: 5-60 s.}
\usage{
gf_cbioportal_alterations(
    session,
    `gene`,
    `study_id`,
    `portal` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{study_id}{(string) A curated study id from cbioportal_studies, e.g. openpedcan_v15. Its portal is the one the catalog names. An id the catalog does not curate is refused with the closest curated ids.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_alterations} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
