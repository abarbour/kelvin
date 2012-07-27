\name{Keir.default}
\alias{Keir.default}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{S3:Keir
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
#Keir.default(xseq, nu. = 0, add.tol = TRUE, return.list = TRUE, ...)
Keir.default(xseq, nu. = 0, nSeq. = 1, add.tol = TRUE, return.list = TRUE, show.scaling = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xseq}{
%%     ~~Describe \code{xseq} here~~
}
  \item{nu.}{
%%     ~~Describe \code{nu.} here~~
}
  \item{add.tol}{
%%     ~~Describe \code{add.tol} here~~
}
  \item{return.list}{
%%     ~~Describe \code{return.list} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(xseq, nu.=0, nSeq.=1, 
         add.tol=TRUE, 
         return.list=TRUE, 
         show.scaling=FALSE, ...){
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
  nr. <- nrow(Bsl)
	mBsc <- matrix(rep(Bsc,nr.), nrow=nr., byrow=T)
  Bsl <- mBsc*Bsl
  rm(mBsc) #cleanup
  #
  if (return.list){
    Bsl <- list(kei=Im(Bsl), ker=Re(Bsl))
		if (ret.ind){Bsl$zero.indices=zero.inds}
	}
	return(Bsl)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
