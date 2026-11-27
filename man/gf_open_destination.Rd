% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_open_destination}
\alias{gf_open_destination}
\encoding{UTF-8}
\title{Open a GeneFox link (genefox://…) or a saved-view descriptor as the app would: returns where it goes...}
\description{Open a GeneFox link (genefox://…) or a saved-view descriptor as the app would: returns where it goes (GeneFox's route planner: a cohort analysis, a Reference screen, a GEO series, a cBioPortal study redirected to a native cohort, or why it cannot open), the decoded saved view (the app's own validation), and, where this server has that screen's tool, the tool call it maps to and its result. Latency: instant to plan; running takes the mapped tool's time.}
\usage{
gf_open_destination(
    session,
    `destination` = NULL,
    `figure` = NULL,
    `legacy_link` = NULL,
    `link` = NULL,
    `run` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{destination}{(object, optional) A saved-view descriptor (JSON: kind plus its fields, e.g. \{"kind":"tcga.survival","projectId":"TCGA-KIRC","gene":"CD276"\}). NULL omits it.}
\item{figure}{(boolean, optional; default true) Draw the figure and return its PNG path. NULL omits it.}
\item{legacy_link}{(string, optional) With destination: the deep link an older saved view kept, planned when the descriptor itself is not openable. NULL omits it.}
\item{link}{(string, optional) A GeneFox deep link, e.g. genefox://tcga/TCGA-BRCA/expression/ESR1?stratify=stage. Supply exactly one of link and destination; links are parsed, not fetched. NULL omits it.}
\item{run}{(boolean, optional; default true) Also run the mapped tool and return its result. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{open_destination} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/open-destination-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
