library(genefox)
feed <- getFromNamespace(".gf_queue_cli_output", "genefox")
s <- new.env(parent = emptyenv()); s$queue <- list(); s$output_buffer <- raw()
payload <- paste0('{"jsonrpc":"2.0","id":2,"result":{"text":"', paste(rep("x", 140000L), collapse = ""), '\u03b2"}}')
bytes <- charToRaw(paste0(payload, "\n", '{"jsonrpc":"2.0","id":3,"result":{}}', "\n"))
for (start in seq.int(1L, length(bytes), by = 4093L)) feed(s, bytes[start:min(length(bytes), start + 4092L)])
stopifnot(length(s$queue) == 2L, s$queue[[1L]]$id == 2, s$queue[[2L]]$id == 3,
    identical(s$queue[[1L]]$result$text, paste0(paste(rep("x", 140000L), collapse = ""), "\u03b2")), length(s$output_buffer) == 0L)
s$queue <- list(); bytes <- charToRaw(paste0('{"id":4,"result":"', "\u03b2", '"}', "\n"))
split <- which(bytes == charToRaw("\u03b2")[[1L]])[[1L]]
feed(s, bytes[seq_len(split)])
stopifnot(!length(s$queue), length(s$output_buffer) == split)
feed(s, bytes[(split + 1L):length(bytes)])
stopifnot(length(s$queue) == 1L, identical(s$queue[[1L]]$result, "\u03b2"), !length(s$output_buffer))
