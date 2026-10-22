% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_cross_study_mutations}
\alias{gf_cbioportal_cross_study_mutations}
\encoding{UTF-8}
\title{Compare one gene's protein-altering mutations across 1–32 curated cBioPortal studies in one portal}
\description{Compare one gene's protein-altering mutations across 1–32 curated cBioPortal studies in one portal. Explicit gene-assayed sample denominators and complete global mutations/fetch pagination; choose molecular_profile_id when a study publishes several mutation profiles. Separate study/sample observations, never pooled unique patients. Missing profiles and empty assay cohorts remain unavailable. Same shared analysis, tables and figures as the GeneFox apps. On request (pdf, html, csv; each off by default), writes one multipart branded PDF, matching HTML and full CSV when an output directory is configured. Latency: 10–180 s.}
\usage{
gf_cbioportal_cross_study_mutations(
    session,
    `gene`,
    `studies`,
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
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{studies}{(array)}
\item{csv}{(boolean, optional; default false) Also write all selected study results, unavailable reasons, counts, source and methods. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 report timestamp with time zone; omitted uses the current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML report. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write one complete multipart branded PDF. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_cross_study_mutations} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
