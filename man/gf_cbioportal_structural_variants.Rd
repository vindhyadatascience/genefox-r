% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_cbioportal_structural_variants}
\alias{gf_cbioportal_structural_variants}
\encoding{UTF-8}
\title{Analyze structural variants involving either partner of one gene in a curated cBioPortal study}
\description{Analyze structural variants involving either partner of one gene in a curated cBioPortal study. Select molecular_profile_id when several STRUCTURAL_VARIANT profiles exist. Uses gene-assayed samples; records, samples and patients remain separate. Retains both partners, source coordinates/genome, classifications and all source fields. The fusion subset uses exact source Class FUSION; free-text fusion annotations are retained without independent validation. Complete singular structural-variant/fetch responses are bounded or refused, without invented pagination. Missing profiles/coverage remain unavailable. On request (pdf, html, csv; each off by default), writes a multipart branded PDF, matching HTML and full source CSV when an output directory is configured. Latency: 10–180 s.}
\usage{
gf_cbioportal_structural_variants(
    session,
    `gene`,
    `study_id`,
    `csv` = NULL,
    `generated_at` = NULL,
    `html` = NULL,
    `molecular_profile_id` = NULL,
    `pdf` = NULL,
    `portal` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{gene}{(string) HGNC gene symbol, e.g. CLDN18. Upper-cased, as the app does.}
\item{study_id}{(string) Curated study id from cbioportal_studies in its catalog portal. Uncurated ids are refused with closest matches.}
\item{csv}{(boolean, optional; default false) Also write every record with all source fields as canonical JSON, full summary and methods. NULL omits it.}
\item{generated_at}{(string, optional) ISO 8601 report timestamp with time zone; omitted uses the current time. NULL omits it.}
\item{html}{(boolean, optional; default false) Also write the matching self-contained branded HTML. NULL omits it.}
\item{molecular_profile_id}{(string, optional) Exact STRUCTURAL_VARIANT profile ID; required if ambiguous. No profile is substituted. NULL omits it.}
\item{pdf}{(boolean, optional; default false) Also write one complete multipart branded PDF. NULL omits it.}
\item{portal}{(string, optional; one of "public", "ccdi", "pedcbioportal") public (cBioPortal), ccdi (CCDI cBioPortal, pediatric) or pedcbioportal (refused: it needs a personal data-access token, which this server never takes). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{cbioportal_structural_variants} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list. Result contract: \url{https://genefox.app/schemas/v1/cbioportal-structural-variants-result-v1.schema.json}.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
