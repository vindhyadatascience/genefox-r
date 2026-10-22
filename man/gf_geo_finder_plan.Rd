% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_finder_plan}
\alias{gf_geo_finder_plan}
\encoding{UTF-8}
\title{Plan GEO dataset searches from a natural-language question using the app's regex interpreter and bundled...}
\description{Plan GEO dataset searches from a natural-language question using the app's regex interpreter and bundled synonym dictionary only. Returns interpreted intent and one or two explicit geo_search suggestions without executing searches. No model was used. Organism/data type remain the interpreter's defaults; sample-size and comparison hints are advisory, not verified dataset evidence. No conversation or cloud consent path.}
\usage{
gf_geo_finder_plan(
    session,
    `text`,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{text}{(string) A dataset-finder question. Nonempty; maximum 4096 UTF-8 bytes before trimming. The interpreted topic must also fit geo_search's 200-character query schema.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_finder_plan} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
