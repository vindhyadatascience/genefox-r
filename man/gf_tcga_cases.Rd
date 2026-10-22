% Generated from the GeneFox runtime tool catalogue; do not edit.
\name{gf_tcga_cases}
\alias{gf_tcga_cases}
\encoding{UTF-8}
\title{One page of a GDC cohort's case roster, as GeneFox's Cases tab lists it (sorted by submitter id): case...}
\description{One page of a GDC cohort's case roster, as GeneFox's Cases tab lists it (sorted by submitter id): case UUID, submitter id, primary diagnosis, site, sex at birth and stage, with the total and the next page's `from`. Use tcga_case_detail for one case. Latency: 1-3 s.}
\usage{
gf_tcga_cases(
    session,
    `project`,
    `from` = NULL,
    `page_size` = NULL,
    progress_callback = NULL
)
}
\arguments{
\item{session}{A GeneFox session from \code{\link{gf_session}}.}
\item{project}{(string; one of "TCGA-ACC", "TCGA-BLCA", "TCGA-BRCA", "TCGA-CESC", "TCGA-CHOL", "TCGA-COAD", "TCGA-DLBC", "TCGA-ESCA", "TCGA-GBM", "TCGA-HNSC", "TCGA-KICH", "TCGA-KIRC", "TCGA-KIRP", "TCGA-LAML", "TCGA-LGG", "TCGA-LIHC", "TCGA-LUAD", "TCGA-LUSC", "TCGA-MESO", "TCGA-OV", "TCGA-PAAD", "TCGA-PCPG", "TCGA-PRAD", "TCGA-READ", "TCGA-SARC", "TCGA-SKCM", "TCGA-STAD", "TCGA-TGCT", "TCGA-THCA", "TCGA-THYM", "TCGA-UCEC", "TCGA-UCS", "TCGA-UVM", "TARGET-ALL-P1", "TARGET-ALL-P2", "TARGET-ALL-P3", "TARGET-AML", "TARGET-CCSK", "TARGET-NBL", "TARGET-OS", "TARGET-RT", "TARGET-WT", "APOLLO-LUAD", "BEATAML1.0-COHORT", "CDDP_EAGLE-1", "CGCI-BLGSP", "CGCI-HTMCP-CC", "CGCI-HTMCP-DLBCL", "CGCI-HTMCP-LC", "CMI-ASC", "CMI-MBC", "CMI-MPC", "CPTAC-2", "CPTAC-3", "CTSP-DLBCL1", "EXCEPTIONAL_RESPONDERS-ER", "HCMI-CMDC", "MMRF-COMMPASS", "MP2PRT-ALL", "MP2PRT-WT", "NCICCR-DLBCL", "OHSU-CNL", "ORGANOID-PANCREATIC", "REBC-THYR", "WCDT-MCRPC") TCGA/TARGET/other GDC project id with a GDC Xena expression dataset, e.g. TCGA-BRCA.}
\item{from}{(integer, optional; default 0; range 0..25000) Offset of the first case (data.next_from of the previous page). NULL omits it.}
\item{page_size}{(integer, optional; default 50; range 1..100) Cases per page (the app's page is 50). NULL omits it.}
\item{progress_callback}{Optional function receiving runtime progress events; NULL disables progress.}
}
\value{A \code{gf_result} holding the engine payload, provenance and owned figures for the \code{tcga_cases} tool. The runtime validates every argument and refuses tools absent from its \code{gf_tools()} list.}
\seealso{\code{\link{gf_scientific_tools}}, \code{\link{gf_tools}}, \code{\link{gf_call}}}
