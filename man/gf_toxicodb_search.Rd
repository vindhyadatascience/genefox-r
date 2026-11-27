% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_toxicodb_search}
\alias{gf_toxicodb_search}
\encoding{UTF-8}
\title{Find genes or compounds in ToxicoDB (toxicodb.ca: Open TG-GATEs human and rat, DrugMatrix rat, EMEXP2458...}
\description{Find genes or compounds in ToxicoDB (toxicodb.ca: Open TG-GATEs human and rat, DrugMatrix rat, EMEXP2458 hepatocyte toxicogenomics). kind=gene matches symbol, Ensembl id, Entrez id or name; ToxicoDB gene ids are per species. kind=compound matches name or PubChem CID. Returns ToxicoDB ids to pass to toxicodb_experiments or toxicodb_analysis. Latency: 1-20 s cold (the gene catalogue is 6 MB), then instant.}
\usage{
gf_toxicodb_search(
    session,
    `kind`,
    `query`,
    `limit` = NULL,
    `species` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{kind}{(string; one of "gene", "compound") What to search.}
\item{query}{(string) Text to match, e.g. CYP1A1 or acetaminophen.}
\item{limit}{(integer, optional; default 20; range 1..100) Most matches returned. NULL omits it.}
\item{species}{(string, optional; one of "human", "rat") Genes only: restrict to one species. NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{toxicodb_search} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/toxicodb-search-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
