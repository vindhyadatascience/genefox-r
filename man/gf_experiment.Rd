\name{gf_experiment}
\alias{gf_experiment}
\title{Construct a Dense Expression Experiment}
\usage{gf_experiment(assays, units, feature_ids = NULL, sample_ids = NULL,
  feature_metadata = NULL, sample_metadata = NULL, metadata = list(), row_ranges = NULL)}
\arguments{
\item{assays}{A named list of dense numeric matrices in features-by-samples orientation.}
\item{units}{Explicit units for every named assay.}
\item{feature_ids}{Unique nonempty feature IDs, defaulting to the first matrix's row names.}
\item{sample_ids}{Unique nonempty sample IDs, defaulting to the first matrix's column names.}
\item{feature_metadata}{Optional data.frame indexed by exact feature IDs.}
\item{sample_metadata}{Optional data.frame indexed by exact sample IDs.}
\item{metadata}{Experiment provenance and annotations as a list.}
\item{row_ranges}{Optional named genomic ranges retained by the SummarizedExperiment adapter.}}
\description{Validates named assays, explicit units and identifiers, and aligns annotations
by exact IDs. Plain R matrix workflows need no Bioconductor packages. No normalization,
analysis, relabeling or sparse/backed materialization is performed.}
\value{A gf_experiment interchange object accepted by gf_write_import and gf_to_se.}
