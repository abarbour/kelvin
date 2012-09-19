#' Solutions to the Kelvin differential equations: 'Kei' and 'Ker'
#'
#' This function calculates the complex solution to the Kelvin differential
#' equations using modified Bessel function of the second kind, specifically
#' that which is produced by
#' \code{\link{Bessel::BesselK}}.
#'
#' @param xseq vector; values to evaluate the complex solution at
#' @param nu scalar; controls the order of the Bessel functions
#' @param nSeq. positive integer; 
#' if > 1, computes the result for a whole sequence of nu values;
#' if nu >= 0,nu, nu+1, ..., nu+nSeq-1,
#' if nu < 0, nu, nu-1, ..., nu-nSeq+1.
#' @param add.tol boolean; fudge factor to prevent an error for zero-values
#' @param return.list boolean; Should the result be a list instead of matrix?
#' @param show.scaling boolean; Should the normalization values be given as a message?
#'
#' @return \code{return.list==FALSE} (default): matrix of complex values with columns
#' representing each order (if \code{nSeq.>1}); otherwise the result is a list with
#' Real and Imaginary components segregated.
#' 
#' @author Andrew Barbour <andy.barbour@@gmail.com>
#' 
#' @references \link{http://mathworld.wolfram.com/KelvinFunctions.html}
#' 
#' @keywords Orthogonal functions
#' @keywords Kelvin functions
#' 
#' @seealso \code{\link{Kelvin}}, \code{\link{Kei}}, \code{\link{Ker}}, \code{\link{Beir}}
#' 
#' @examples
#' Keir(1:10)    # defaults to nu.=0, nSeq=1
#' Keir(1:10,nSeq=2)
#' Keir(1:10,nSeq=2,return.list=FALSE)
Keir.default <-
function(xseq, nu., nSeq., 
         add.tol=TRUE, 
         return.list=FALSE, 
         show.scaling=FALSE, ...){
  require(Bessel)
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
  #
  BessX <- xseq*exp(pi/4*1i)
  # Bug fix: must multiply by the specific scaling for nu., so if
  # nSeq is given the scaling will be wrong.  Fix is to create a
  # vector of scalings.  This page was useful:
  #http://keisan.casio.com/has10/SpecExec.cgi
  Nu. <- nu.:(nu.+nSeq.-1)
  Bsc <- zapsmall(exp(-pi/2*(Nu.)*1i))
  if (show.scaling) {message(sprintf("\t>>>>\tnu=%i\tscaling:\t%s\n",Nu,Bsc))}
  #
  Bsl <- Bessel::BesselK(BessX, nu=nu., nSeq=nSeq.)
  nr. <- length(as.vector(BessX))
  stopifnot(!is.null(nr.))
  #
	mBsc <- matrix(rep(Bsc, nr.), nrow=nr., byrow=T)
  Bsl <- mBsc*Bsl
  rm(mBsc) #cleanup
  #
  if (return.list){
    Bsl <- list(kei=Im(Bsl), ker=Re(Bsl))
		if (ret.ind){Bsl$zero.indices=zero.inds}
	}
	return(Bsl)
}
