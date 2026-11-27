% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_gdc_project_summary}
\alias{gf_gdc_project_summary}
\encoding{UTF-8}
\title{What a GDC project holds, for ANY GDC project (e.g}
\description{What a GDC project holds, for ANY GDC project (e.g. MMRF-COMMPASS, CPTAC-3, TCGA-BRCA): case count, open and controlled file counts by data type and workflow, the cases with open STAR - Counts RNA-seq, and how many cases have each key clinical field (vital status, days to death or follow-up, age, ISS and AJCC stage, treatment), in the whole project and within the open RNA cohort. Counts from GDC metadata only; no files are read. Names the GDC data release. Latency: 5-20 s.}
\usage{
gf_gdc_project_summary(
    session,
    `project`,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{project}{(string) A GDC project id, e.g. MMRF-COMMPASS. Case-insensitive.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{gdc_project_summary} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/gdc-project-summary-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
