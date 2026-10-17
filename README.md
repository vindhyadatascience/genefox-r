# GeneFox for R

R access to GeneFox's shared scientific runtime, with data frames, tidyverse-compatible
tables and SummarizedExperiment adapters. The wrapper is MIT licensed; the GeneFox
engine and native runtime remain proprietary and are obtained separately.

Install the development package from the public repository:

```r
remotes::install_github("vindhyadatascience/genefox-r")
```

Or build a local checkout with `R CMD build .` and install its source tarball with
`R CMD INSTALL`. A C compiler and the dependencies in DESCRIPTION are needed; building
the wrapper does not compile or download the GeneFox engine.

After verifying a matching native runtime bundle's publisher signature:

```r
library(GeneFox)
session <- gf_session(runtime = "/path/to/genefox-runtime", output = "/path/to/results")
result <- gf_list_operations(session)
gf_table(result)
gf_close(session)
```

`gf_runtime(path)` validates the bundle's platform, architecture, ABI, contract and file
inventory before loading code. Digests check integrity and do not authenticate a publisher.
Native runtime bundles are a separate GeneFox release deliverable; none is included here.

Use `gf_to_tibble()` or `gf_to_data_table()` for common table frameworks, and `gf_from_se()` /
`gf_to_se()` for supported SummarizedExperiment data. GeneFox owns statistical analysis
and figure rendering; the R package preserves the results, provenance and figures.

See [GeneFox documentation](https://genefox.app/docs/) and [issues](https://github.com/vindhyadatascience/genefox-r/issues).
The export's `genefox-source.json` records its source commit and runtime compatibility.

Generated functions describe implemented tools; release flags and account grants still
control availability. Inspect `names(gf_tools(session))` in an open session before calling
a tool. A generated function does not enable a dark feature or grant access.

To check the standalone R checkout, install the dependencies listed in DESCRIPTION,
including the suggested packages for full interoperability coverage, and select a
verified matching runtime bundle:

```sh
export GENEFOX_SDK_TEST_RUNTIME=/absolute/path/to/genefox-runtime
R CMD build .
GENEFOX_R_VERSION="$(Rscript -e 'cat(read.dcf("DESCRIPTION")[1, "Version"])')"
R CMD check --no-manual "GeneFox_${GENEFOX_R_VERSION}.tar.gz"
```

Building the tarball applies the package's `.Rbuildignore` exclusions. The package
check runs the files under `tests/`. Keep the runtime variable set to include the
actual native and CLI transport checks.
