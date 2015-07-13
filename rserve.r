require('Rserve')
require('FastRWeb')

root <- "/app/rserve"
options(FastRWeb.root = "/app/rserve")

setwd(paste(root,"tmp",sep='/'))

# get the port allowed
port <- Sys.getenv('PORT')

.http.request <- FastRWeb:::.http.request

init <- function() {
    set.seed(Sys.getpid()) # we want different seeds so we get different file names
    
    ## get a temporary file name for this session
    tmpfile<<-paste('tmp-',paste(sprintf('%x',as.integer(runif(4)*65536)),collapse=''),'.tmp',sep='')

    ## if there is a common script, source it first
    common <- paste(root,"/web.R/common.R",sep='')
    if (isTRUE(file.exists(common))) source(paste(root,"/web.R/common.R",sep=''))
}

# run Rserve in process
run.Rserve(http.port = port, config.file = "./rserve.conf")
