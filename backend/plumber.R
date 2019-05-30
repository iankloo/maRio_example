# plumber.R

#' function to make sure requests aren't blocked - known issue with plumber
#' @filter cors
cors <- function(req, res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }
  
}


#' serve the data from the columns selected by the user
#' @param xvar
#' @param yvar
#' @get /mydata
#' @json

function(xvar, yvar){
  x <- mtcars[, xvar]
  y <- mtcars[, yvar]
  
  out <- list(x, y)
  names(out) <- c(xvar,yvar)
  
  out
}


#' serve the colname names
#' @get /mycols
#' @json
function(){
  cols <- colnames(mtcars)
  data.frame(id = 1:length(cols), name = cols)
}
