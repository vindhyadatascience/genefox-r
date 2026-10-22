\name{gf_result_schemas}
\alias{gf_result_schemas}
\title{Inspect the versioned GeneFox result contracts}
\description{Read the JSON Schema documents shipped with this client package. This does not load or start a GeneFox runtime.}
\usage{gf_result_schemas()}
\value{A named list of JSON Schema documents, keyed by their published file names. JSON objects and arrays retain their list structure. Each call returns a fresh copy.}
\details{These contracts are pinned to this package version. Use \code{\link{gf_tools}} to inspect which tools the selected runtime makes available. Report tables contain display strings; original numeric values remain in the scientific data payload.}
\seealso{\code{\link{gf_session}}, \code{\link{gf_table}}}
