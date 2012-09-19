#' Wrapper function to return Ber
#' 
#' Uses \code{\link{Beir}} and extracts real component, i.e. 'Ber'
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/Ber.html}
#' 
#' @seealso \code{\link{Beir}}, \code{\link{Bei}}
#' 
#' @export
#' 
#' @examples
#' Ber(1:10)
Ber <-
function(...) Beir(..., return.list=TRUE)$ber
#