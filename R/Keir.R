#' Solutions to the Kelvin differential equations: 'Kei' and 'Ker'
#'
#' This function calculates the complex solution to the Kelvin differential
#' equations using modified Bessel function of the second kind, specifically
#' that which is produced by \code{Bessel::BesselK}.
#'
#' @param xseq vector; values to evaluate the complex solution at
#' @param nu. scalar; controls the order of the Bessel functions
#' @param nSeq. positive integer; 
#' if > 1, computes the result for a whole sequence of nu values;
#' if nu >= 0,nu, nu+1, ..., nu+nSeq-1,
#' if nu < 0, nu, nu-1, ..., nu-nSeq+1.
#' @param add.tol boolean; fudge factor to prevent an error for zero-values
#' @param return.list boolean; Should the result be a list instead of matrix?
#' @param show.scaling boolean; Should the normalization values be given as a message?
#' @param ... additional parameters (currently unused)
#'
#' @return \code{return.list==FALSE} (default): matrix of complex values with columns
#' representing each order (if \code{nSeq.>1}); otherwise the result is a list with
#' Real and Imaginary components segregated.
#'
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \url{http://mathworld.wolfram.com/KelvinFunctions.html}
#' 
#' @keywords "Orthogonal functions","complementary Kelvin functions"
#' 
#' @seealso \code{\link{Ker}}, \code{\link{Kei}}
#' 
#' @export
#' 
#' @examples
#' Keir(1:10)    # defaults to nu.=0, nSeq=1
#' Keir(1:10,nSeq=2)
#' Keir(1:10,nSeq=2,return.list=FALSE)
Keir <-
function(xseq, nu.=0, nSeq.=1, 
         add.tol=TRUE, 
         return.list=TRUE, 
         show.scaling=FALSE, ...) UseMethod("Keir")
