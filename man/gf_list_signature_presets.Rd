% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_list_signature_presets}
\alias{gf_list_signature_presets}
\encoding{UTF-8}
\title{List GeneFox's bundled signature presets in app order, with exact names, gene counts, descriptions,...}
\description{List GeneFox's bundled signature presets in app order, with exact names, gene counts, descriptions, recommended scoring methods and source/license provenance. Use a returned name as tcga_gene_signature.preset. No arguments. Local resources only; instant.}
\usage{
gf_list_signature_presets(
    session,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{list_signature_presets} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/list-signature-presets-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
