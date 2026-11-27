% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_account_status}
\alias{gf_account_status}
\encoding{UTF-8}
\title{Report the account link, granted capabilities such as Dose-Response, and build flavor}
\description{Report the account link, granted capabilities such as Dose-Response, and build flavor. No arguments.}
\usage{
gf_account_status(
    session,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{account_status} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/account-status-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
