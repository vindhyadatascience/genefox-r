\name{gf_import_experiment}
\alias{gf_import_experiment}
\alias{gf_analyze_imported}
\title{Import and Analyze a Local Experiment in GeneFox}
\description{Serialize one explicitly selected assay and import it through the shared reviewed-store tool. Analysis and figure drawing execute in GeneFox on either transport. Analyze Your Own Data access is required; a wrapper cannot establish a grant.}
\usage{
gf_import_experiment(session, experiment, assay, scale, display_name = NULL)
gf_analyze_imported(experiment,
  workflow = c("plot", "heatmap", "signature", "differential"), ...)
}
\arguments{
\item{session}{An open GeneFox session with an explicitly configured imported store.}
\item{experiment}{A dense interchange experiment for import, or an imported experiment reference for analysis.}
\item{assay}{Exact named assay to import.}
\item{scale}{Explicit linear, log2 or unknown measurement scale.}
\item{display_name}{Optional user-declared dataset label.}
\item{workflow}{The shared engine workflow to execute.}
\item{...}{Arguments accepted by the corresponding generated scientific tool function.}
}
\value{Import returns a store reference containing its exact original manifest JSON; analysis returns the original GeneFox result and owned engine figures.}
\details{The temporary source copy is deleted after the call; the private store retains its own verified bytes. The manifest text preserves typed metadata and categorical domains without an intermediate numeric conversion. Runtime tool discovery is authoritative.}
