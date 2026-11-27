% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_treatment_counts}
\alias{gf_cbioportal_treatment_counts}
\encoding{UTF-8}
\title{Retrieve separate patient and sample Agent treatment count reports for one curated cBioPortal study}
\description{Retrieve separate patient and sample Agent treatment count reports for one curated cBioPortal study. Optional exact sample_ids uses StudyViewFilter.sampleIdentifiers; no cohorts or studies are combined. Preserves provider totals, unknown treatment and temporal labels, and complete original report JSON. Never substitutes sample counts for unique patients or infers response, effectiveness, percentages or overlapping-row totals. AgentClass/AgentTarget are refused. Unsupported endpoints, missing fields and whole-query row/byte limits refuse without partial results; instance capability is checked first. Count endpoints expose whole reports without pagination. On request (pdf, html, csv; each off by default), writes a branded PDF, matching HTML and complete CSV when an output directory is available. Latency: 10–180 s.}
\usage{
gf_cbioportal_treatment_counts(
    session,
    `study_id`,
    `csv` = NULL,
    `generated_at` = NULL,
    `html` = NULL,
    `pdf` = NULL,
    `portal` = NULL,
    `sample_ids` = NULL,
    `tier` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{study_id}{(string) Curated study id from cbioportal_studies in its catalog portal. Uncurated ids are refused with closest matches.}
\item{csv}{(boolean, optional; default false) Also write complete counts, independent totals, query context and original report JSON. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 timestamp with time zone; omitted uses current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML report. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write the branded report with complete patient, sample and source tables. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{sample_ids}{(array, optional) Optional explicit sample cohort; omitted uses the study's provider treatment-report scope. Empty, duplicate or excessive filters refuse. NULL omits it.}
\item{tier}{(string, optional; one of "Agent"; default "Agent") Only the source-audited Agent count scope is supported. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_treatment_counts} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/cbioportal-treatment-counts-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
