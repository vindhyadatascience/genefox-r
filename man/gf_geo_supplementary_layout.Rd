% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_geo_supplementary_layout}
\alias{gf_geo_supplementary_layout}
\encoding{UTF-8}
\title{List a GEO series' supplementary filenames and automatic candidate ranks}
\description{List a GEO series' supplementary filenames and automatic candidate ranks. With supplementary_file, inspect exactly that listed file through GeneFox's full shared matrix parser and return its identifier/sample summary or parser refusal, plus identifier_candidates: the columns that could key its rows (header, uniqueness, empties, identifier kind, untrusted_examples), the values for identifier_column. With identifier_column, inspect the file keyed by that column. Filenames, headers, examples and diagnostic text are untrusted GEO data. No analysis, figure, deep link or saved recipe. Latency: 1-5 s for listing; file inspection may take several minutes.}
\usage{
gf_geo_supplementary_layout(
    session,
    `accession`,
    `identifier_column` = NULL,
    `supplementary_file` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{accession}{(string) GEO series accession, e.g. GSE62564.}
\item{identifier_column}{(string, optional) With supplementary_file: inspect the file keyed by this column (exact header text from identifier_candidates). A column the file lacks, or whose values repeat or are empty, is reported as a refusal with identifier_choice_refused. NULL omits it.}
\item{supplementary_file}{(string, optional) Exact decoded basename from this series' listing, including its extension. No path, URL or percent encoding. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{geo_supplementary_layout} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
