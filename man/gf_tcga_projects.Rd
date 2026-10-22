% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_projects}
\alias{gf_tcga_projects}
\encoding{UTF-8}
\title{List the GDC projects (cohorts) GeneFox's TCGA tab offers, grouped by program (TCGA, TARGET, CPTAC, ...)...}
\description{List the GDC projects (cohorts) GeneFox's TCGA tab offers, grouped by program (TCGA, TARGET, CPTAC, ...) with case and file counts, primary site and disease type, and whether this server's per-cohort tools accept each. Only projects with a GDC Xena expression dataset are listed, as in the app. Optional search filters by id, name or site. Latency: 1-3 s once, then instant.}
\usage{
gf_tcga_projects(
    session,
    `search` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{search}{(string, optional) Case-insensitive text matched against project id, name and primary site (the list's search field). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_projects} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
