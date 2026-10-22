% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_treatment_counts}
\alias{gf_cbioportal_treatment_counts}
\encoding{UTF-8}
\title{Retrieve separate patient and sample Agent treatment count reports for one curated cBioPortal study}
\description{Retrieve separate patient and sample Agent treatment count reports for one curated cBioPortal study. An optional exact sample_ids filter uses StudyViewFilter.sampleIdentifiers; no cohorts or studies are combined. Preserves provider totals, unknown treatment and temporal labels, and complete original report JSON. Never substitutes sample counts for unique patients or infers response, effectiveness, percentages or overlapping-row totals. AgentClass/AgentTarget are refused. Instance capability checks precede counts; unsupported endpoints, missing fields and whole-query row/byte limits refuse without partial results. Count endpoints expose whole reports without pagination. On request (pdf, html, csv; each off by default), writes a coherent branded PDF, matching HTML and complete CSV when an output directory is available. Latency: 10–180 s.}
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
\item{study_id}{(string) A curated study id from cbioportal_studies, e.g. openpedcan_v15. Its portal is the one the catalog names. An id the catalog does not curate is refused with the closest curated ids.}
\item{csv}{(boolean, optional; default false) Also write complete counts, independent totals, query context and original report JSON. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 timestamp with time zone; omitted uses current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML report. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write the branded report with complete patient, sample and source tables. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{sample_ids}{(array, optional) Optional explicit sample cohort; omitted requests the study's provider treatment-report scope. Empty, duplicate or excessive filters refuse rather than falling back to the whole study. NULL omits it.}
\item{tier}{(string, optional; one of "Agent"; default "Agent") Only the source-audited Agent count scope is supported. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_treatment_counts} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
