% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_chat_schema}
\alias{gf_geo_chat_schema}
\encoding{UTF-8}
\title{Read the shared GEO host's canonical capabilities and bounded untrusted local suggestion examples for a...}
\description{Read the shared GEO host's canonical capabilities and bounded untrusted local suggestion examples for a matrix, with actual explicit tool input schemas. Uses the same source-aware matrix cache and built-in metadata processing as GEO analyses. No chat interpreter, model, app consent, app matrix generation or recipe-library write.}
\usage{
gf_geo_chat_schema(
    session,
    `accession`,
    `supplementary_file` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession.}
\item{supplementary_file}{(string, optional) Exact decoded basename from geo_supplementary_layout. Analyze only this file, with no sibling or source fallback. No path, URL, encoding or surrounding whitespace. Explicit sources withhold saved-view links and recipes. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_chat_schema} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
