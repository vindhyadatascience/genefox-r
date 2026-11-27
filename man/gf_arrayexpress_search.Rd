% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_arrayexpress_search}
\alias{gf_arrayexpress_search}
\encoding{UTF-8}
\title{Search EMBL-EBI ArrayExpress (BioStudies) for expression studies, as GeneFox's ArrayExpress source does,...}
\description{Search EMBL-EBI ArrayExpress (BioStudies) for expression studies, as GeneFox's ArrayExpress source does, returning accession, title, release date and sample count for each. Several words must all match. Open TG-GATEs (toxicogenomics) lives here, not on GEO. Call arrayexpress_details on a hit before loading. Latency: 1-5 s. Free; no Pro capability.}
\usage{
gf_arrayexpress_search(
    session,
    `query`,
    `limit` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{query}{(string) Free text, e.g. 'TG-GATEs' or a compound name.}
\item{limit}{(integer, optional; default 10; range 1..20) How many results to return (1-20). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{arrayexpress_search} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/arrayexpress-search-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
