% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_studies}
\alias{gf_cbioportal_studies}
\encoding{UTF-8}
\title{The cBioPortal studies GeneFox curates for one portal (ccdi, the screen's default, or public), as its...}
\description{The cBioPortal studies GeneFox curates for one portal (ccdi, the screen's default, or public), as its Reference › cBioPortal screen lists them: title, group, live sample count, the GDC project a study opens as, citation, and the drift note when the portal no longer serves a curated study or its sample count moved. pedcbioportal is refused (it needs a personal data-access token). Follow with cbioportal_composition, cbioportal_expression or cbioportal_alterations. Latency: 1-10 s.}
\usage{
gf_cbioportal_studies(
    session,
    `portal` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_studies} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
