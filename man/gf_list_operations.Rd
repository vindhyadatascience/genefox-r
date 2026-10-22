% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_list_operations}
\alias{gf_list_operations}
\encoding{UTF-8}
\title{List every analysis GeneFox can perform, as the operation id, display name, summary and data scope...}
\description{List every analysis GeneFox can perform, as the operation id, display name, summary and data scope (imported/public_dataset). Instant.}
\usage{
gf_list_operations(
    session,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{list_operations} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
