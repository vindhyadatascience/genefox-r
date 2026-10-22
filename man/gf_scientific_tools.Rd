\name{gf_scientific_tools}
\alias{gf_scientific_tools}
\title{Generated GeneFox scientific tool clients}
\description{Typed clients generated from the shared runtime input schemas. The runtime validates scientific arguments and computes every result.}
\details{Use \code{gf_tools()} to inspect runtime availability. Each generated function has its own help page with usage and arguments, for example \code{?gf_account_status}. Functions accept a GeneFox session and the arguments documented by its tool schema; NULL arguments are omitted. Analyses retrieve public data from their providers over the network; no GeneFox account or language model is required.}
\value{A GeneFox result containing the original engine payload, provenance and owned figures.}
