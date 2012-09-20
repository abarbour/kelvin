#' Solutions to the Kelvin differential equations: 'Bei' and 'Ber'
#' 
#' @docType methods
#' @method Beir default
#' @S3method Beir default
#' @rdname Beir
Beir.default <- function(xseq, nu.=0, return.list=TRUE, ...){
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
#