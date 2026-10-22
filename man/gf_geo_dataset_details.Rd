% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_dataset_details}
\alias{gf_geo_dataset_details}
\encoding{UTF-8}
\title{A GEO series' record as GeneFox's dataset detail screen shows it: title, summary, organism, platform,...}
\description{A GEO series' record as GeneFox's dataset detail screen shows it: title, summary, organism, platform, sample count and the sample table (accession + title), GeneFox's usability prediction, and the GEO page / SOFT / supplementary links. Call this before geo_series_expression to see the samples. Latency: 1-5 s. No figure.}
\usage{
gf_geo_dataset_details(
    session,
    `accession`,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession, e.g. GSE62564.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_dataset_details} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
