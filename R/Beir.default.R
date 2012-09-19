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
#' @return \code{return.list==FALSE} (default): matrix of complex values with columns
#' representing each order (if \code{nSeq.>1}); otherwise the result is a list with
#' Real and Imaginary components segregated.
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/KelvinFunctions.html}
#' 
#' @keywords Kelvin functions, Kei, Ker,
#' 
#' @seealso \code{\link{Kelvin}}, \code{\link{Bei}}, \code{\link{Ber}}
#' 
#' @examples
#' Beir(1:10)    # defaults to nu.=0
#' Beir(1:10, nu.=2)
Beir.default <-
function(xseq, nu.=0, return.list=TRUE, ...){
  require(Bessel)
	#
	# Kelvin defined the Kelvin functions bei and ber according to
	#
	#	ber_v(x) + i*bei_v(x)
	#	=	J_v(x*exp(3*pi*i/4))
	#	=	exp(v*pi*i)*J_v(x*exp(-pi*i/4))
	#	=	exp(v*pi*i/2)*I_v(x*exp(pi*i/4))
	#	=	exp(3*v*pi*i/2)*I_v(x*exp(-3*pi*i/4))
	# where	
	#	J_v(x)	is a Bessel function of the first kind and
	#	I_v(x)	is a modified Bessel function of the first kind. 
	# These functions satisfy the Kelvin differential equation.
	toret <- Bessel::BesselJ(xseq*exp(3*pi*(1i)/4), nu=nu., ...)
	if (return.list){
		toret <- list(bei=Im(toret), ber=Re(toret))
	}
	return(toret)
}
