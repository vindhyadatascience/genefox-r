% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_gene_info}
\alias{gf_gene_info}
\encoding{UTF-8}
\title{NCBI Gene metadata for one gene, as GeneFox's gene-info card shows it: official symbol, Entrez ID, full...}
\description{NCBI Gene metadata for one gene, as GeneFox's gene-info card shows it: official symbol, Entrez ID, full name, aliases, cytogenetic location and the RefSeq summary, plus the NCBI Gene page URL. Pass a symbol (e.g. TP53) or an Entrez ID (e.g. 7157); human genes only, as the card searches. The summary and aliases are third-party NCBI text. Latency: 1-5 s. No figure.}
\usage{
gf_gene_info(
    session,
    `gene`,
    `organism` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) A gene symbol (e.g. TP53) or an Entrez Gene ID (e.g. 7157).}
\item{organism}{(string, optional) Organism; only human is supported (the default). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{gene_info} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
