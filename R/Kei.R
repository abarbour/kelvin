#' Wrapper function to return Kei
#' 
#' Uses \code{\link{Kelvin}} and extracts imaginary component, i.e. 'Kei'
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/Kei.html}
#' 
#' @seealso \code{\link{Kelvin}}, \code{\link{Ker}}
#' 
#' @export
#' 
#' @examples
#' Kei(1:10)
Kei <-
function(...) Kelvin(..., return.list=TRUE)$kei
