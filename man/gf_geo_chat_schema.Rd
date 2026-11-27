% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_chat_schema}
\alias{gf_geo_chat_schema}
\encoding{UTF-8}
\title{Read GEO host capabilities, bounded untrusted local suggestions and tool schemas for a matrix}
\description{Read GEO host capabilities, bounded untrusted local suggestions and tool schemas for a matrix. No model, chat interpreter, app consent, app matrix generation or recipe-library write.}
\usage{
gf_geo_chat_schema(
    session,
    `accession`,
    `platform` = NULL,
    `supplementary_file` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession.}
\item{platform}{(string, optional) For a series on several platforms (GEO writes one series matrix per platform), the GPL to read, e.g. GPL96. Without it such a series is refused (invalid_argument, field platform) with details.platforms. Links and recipes record it. NULL omits it.}
\item{supplementary_file}{(string, optional) Exact decoded basename from geo_supplementary_layout; no path, URL, encoding or surrounding whitespace. Only this file is analyzed; no fallback, saved-view links or recipes. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_chat_schema} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/geo-chat-schema-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
