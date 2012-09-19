#' Wrapper function to return Ker
#' 
#' Uses \code{\link{Kelvin}} and extracts real component, i.e. 'Ker'
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/Ker.html}
#' 
#' @seealso \code{\link{Kelvin}}, \code{\link{Kei}}
#' 
#' @export
#' 
#' @examples
#' Ker(1:10)
Ker <-
function(...) Kelvin(..., return.list=TRUE)$ker
#