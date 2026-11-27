% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_list_coverage}
\alias{gf_list_coverage}
\encoding{UTF-8}
\title{List GeneFox's free app operations and, for each, the tool that reaches it (or null), whether it is...}
\description{List GeneFox's free app operations and, for each, the tool that reaches it (or null), whether it is available, partial, planned or not available headlessly, and a note. Use it to see what this server cannot do yet. No arguments. Instant.}
\usage{
gf_list_coverage(
    session,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{list_coverage} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/list-coverage-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
