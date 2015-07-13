# just return the contents of the index.html file in the web directory
run <- function(...)
  WebResult(payload=readLines("/app/rserve/web/index.html"))