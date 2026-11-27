% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_arrayexpress_details}
\alias{gf_arrayexpress_details}
\encoding{UTF-8}
\title{An ArrayExpress study's record as GeneFox's source reads it: title, organism, platform, sample count,...}
\description{An ArrayExpress study's record as GeneFox's source reads it: title, organism, platform, sample count, experimental design, SDRF factors, and whether a processed expression matrix exists. Series with raw data only (all four Open TG-GATEs series) are reported as not loadable, with their metadata still listed. Latency: 2-10 s. Free; no Pro capability.}
\usage{
gf_arrayexpress_details(
    session,
    `accession`,
    `sample_offset` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) ArrayExpress accession, e.g. E-MTAB-797.}
\item{sample_offset}{(integer, optional; default 0; range 0..1000000) Index of the first sample row to return (pages of 200; next_sample_offset gives the next page). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{arrayexpress_details} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/arrayexpress-details-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
