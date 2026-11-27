% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_composition}
\alias{gf_cbioportal_composition}
\encoding{UTF-8}
\title{What one curated cBioPortal study's cohort is made of, measured from its own COHORT attribute as GeneFox's...}
\description{What one curated cBioPortal study's cohort is made of, measured from its own COHORT attribute as GeneFox's cBioPortal screen shows it: pediatric tumors, patient-derived models, adult tumors and normal tissue, with counts, shares and the screen's mixture sentence (a 'pediatric' study can be mostly adult or normal), plus the cancer-type subsets expression can be restricted to. study_id is strict: a study cbioportal_studies lists. Latency: 5-60 s (OpenPedCan v15 is 35,972 samples).}
\usage{
gf_cbioportal_composition(
    session,
    `study_id`,
    `portal` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{study_id}{(string) Curated study id from cbioportal_studies in its catalog portal. Uncurated ids are refused with closest matches.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_composition} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/cbioportal-composition-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
