library(genefox)
schemas <- gf_result_schemas()
required <- c("report-table-v1.schema.json", "tool-figure-v1.schema.json", "tool-provenance-v1.schema.json", "tool-error-v1.schema.json", "survival-result-v1.schema.json")
stopifnot(all(required %in% names(schemas)))
stopifnot(identical(schemas[["report-table-v1.schema.json"]]$type, "object"))
stopifnot(identical(schemas[["report-table-v1.schema.json"]]$required, list("headers", "rows")))
schemas[["report-table-v1.schema.json"]]$type <- "changed"
stopifnot(identical(gf_result_schemas()[["report-table-v1.schema.json"]]$type, "object"))
cat("R installed result contract access PASS\n")
