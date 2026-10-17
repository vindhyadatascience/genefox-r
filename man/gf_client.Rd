\name{gf_client}
\alias{gf_session}
\alias{gf_close}
\alias{gf_call}
\alias{gf_tools}
\alias{gf_table}
\alias{gf_save_figure}
\alias{gf_to_tibble}
\alias{gf_to_data_table}
\alias{gf_from_se}
\alias{gf_to_se}
\title{GeneFox scientific client and framework adapters}
\description{Create a native or persistent CLI GeneFox session and retain the shared engine results, provenance and owned figures. Framework dependencies are optional.}
\details{\code{gf_session(resources = NULL, output, library)} uses the native SDK. Set \code{backend = "cli"} and \code{binary} for stdio. Inspect \code{gf_tools(session)} for runtime schemas and call \code{gf_call(session, tool, arguments)}. \code{gf_table(result, path)} returns a data.frame; the path selects an engine table or record array. \code{gf_from_se(x, units)} and \code{gf_to_se(x)} preserve named dense assays and align metadata using unique feature/sample identifiers. Close the session explicitly with \code{gf_close}. Figure allocations are copied before returning and survive session close.}
\value{Sessions are explicit owners; tool calls return a gf_result; table adapters return standard framework objects; figure save returns its path invisibly.}
