\name{gf_runtime}
\alias{gf_runtime}
\title{Validate a Local GeneFox Runtime Bundle}
\usage{gf_runtime(directory)}
\arguments{\item{directory}{A local directory containing runtime.json and its matching files.}}
\description{Checks the runtime ABI, scientific contract, operating system, architecture,
file inventory and SHA-256 digests before loading executable code. It downloads nothing.
Checksums detect file corruption and mismatches; they do not authenticate a publisher.}
\value{A list containing library, binary and resource paths and the manifest. Pass the
directory to \code{gf_session(runtime = directory, output = output)} to use the matched bundle.}
