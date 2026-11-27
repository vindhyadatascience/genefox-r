% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_finder_plan}
\alias{gf_geo_finder_plan}
\encoding{UTF-8}
\title{Plan GEO searches without executing them or using a model}
\description{Plan GEO searches without executing them or using a model. Returns intent and one or two geo_search suggestions: the key terms with smart search on, and the organism the question names; sample-size/comparison hints are advisory. No conversation or cloud consent path.}
\usage{
gf_geo_finder_plan(
    session,
    `text`,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{text}{(string) Nonempty dataset-finder question; maximum 4096 UTF-8 bytes before trimming. Topic must fit geo_search's 200-character query schema.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_finder_plan} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/geo-finder-plan-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
