% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_reference_expression_atlas_catalog}
\alias{gf_reference_expression_atlas_catalog}
\encoding{UTF-8}
\title{The Expression Atlas experiments GeneFox's Reference › Expression Atlas picker offers: its three curated...}
\description{The Expression Atlas experiments GeneFox's Reference › Expression Atlas picker offers: its three curated baseline experiments, then every human baseline experiment in the live Atlas catalog, sorted by description (when the catalog cannot be reached, only the three curated ones, as on the screen, with the failure in catalogue_failure). Optional search (accession or description text) and limit. Use an accession with reference_expression_atlas. Latency: 2-10 s cold, cached for an hour.}
\usage{
gf_reference_expression_atlas_catalog(
    session,
    `limit` = NULL,
    `search` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{limit}{(integer, optional; default 100; range 1..500) How many experiments to list. NULL omits it.}
\item{search}{(string, optional) Keep experiments whose accession or description contains this text (case-insensitive). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{reference_expression_atlas_catalog} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/reference-expression-atlas-catalog-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
