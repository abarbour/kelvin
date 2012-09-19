#' Solutions to the Kelvin differential equations: 'Bei' and 'Ber'
#'
#' This function calculates the complex solution to the Kelvin differential
#' equations using modified Bessel function of the first kind, specifically
#' that which is produced by
#' \code{\link{Bessel::BesselJ}}.
#'
#' @param xseq vector; values to evaluate the complex solution at
#' @param nu scalar; controls the order of the Bessel functions
#' @param ... arguments passed to \code{\link{Bessel::BesselJ}}
#' @param return.list boolean; Should the result be a list instead of matrix?
#'
#' @export
#'
#' @return \code{return.list==FALSE} (default): matrix of complex values with columns
#' representing each order (if \code{nSeq.>1}); otherwise the result is a list with
#' Real and Imaginary components segregated.
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/KelvinFunctions.html}
#' 
#' @keywords Kelvin functions
#' 
#' @seealso \code{\link{Kelvin}}, \code{\link{Ber}}, \code{\link{Bei}}
#' 
#' @examples
#' Beir(1:10)    # defaults to nu.=0
#' Beir(1:10, nu.=2)
Beir <-
function(xseq, nu.=0, return.list=TRUE, ...) UseMethod("Beir")
#