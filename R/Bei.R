#' Wrapper function to return Bei
#' 
#' Uses \code{\link{Beir}} and extracts imaginary component, i.e. 'Bei'
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/Bei.html}
#' 
#' @seealso \code{\link{Beir}}, \code{\link{Ber}}
#' 
#' @export
#' 
#' @examples
#' Bei(1:10)
Bei <-
function(...) Beir(..., return.list=TRUE)$bei
#