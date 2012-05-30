Keir.default <-
function(xseq, nu.=0, add.tol=TRUE, return.list=TRUE, ...){
	if (add.tol){
		ret.ind <- FALSE
		#heuristic fix for zero values
		tol <- 1e-12
		zero.inds <- xseq==0
		if (TRUE %in% zero.inds){
			ret.ind <- TRUE
			warning(sprintf('values of zero were replaced with  %s',tol))
			xseq[zero.inds] <- tol
		}
	} else {
		stopifnot(!(0 %in% xseq))
	}
	#
	# Similarly, the functions kei and ker by
	#
	#	ker_v(x) + i*kei_v(x) = exp(-v*pi*i/2)*K_v(x*exp(pi*i/4))
	#
	# where	K_v(x)	is a modified Bessel function of the second kind. 
	# For the special case v=0,
	#
	#	J_0(i*sqrt(i)*x)
	#	=	J_0(sqrt(2)*(i-1)*x/2)
	#	=	ber(x) + i*bei(x)
	toret <- exp(-1*nu.*pi*(1i)/2)*Bessel::BesselK(xseq*exp(pi*(1i)/4), nu=nu., ...)
	if (return.list){
		toret <- list(kei=Im(toret), ker=Re(toret))
		if (ret.ind){toret$zero.indices=zero.inds}
	}
	return(toret)
}
