\name{gf_write_import}
\alias{gf_write_import}
\title{Write an Explicit Local Expression Input}
\usage{gf_write_import(x, directory, assay, scale)}
\arguments{
\item{x}{A dense experiment from gf_from_se().}
\item{directory}{A new output directory; existing directories are refused.}
\item{assay}{The exact name of the assay to export.}
\item{scale}{Explicitly linear, log2 or unknown; units never imply a transform.}}
\description{Writes a features-by-samples TSV and a manifest retaining units, exact IDs,
aligned metadata, factor domains, provenance and any genomic coordinates. Lists unselected
assays explicitly. Performs no normalization or analysis. The shared analysis engine stores
expression in Float32; the source TSV retains input precision.}
\details{A GRanges input retains sequence order, lengths, circularity, genome assembly,
unused sequence levels and JSON-compatible range metadata. Grouped ranges remain
available for R round-trips but must be converted explicitly before interchange export;
they are refused rather than flattened across feature identities.}
\value{The local experiment.json manifest path.}
