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
Keir.default(xseq, nu. = 0, add.tol = TRUE, return.list = TRUE, ...)
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
function (xseq, nu. = 0, add.tol = TRUE, return.list = TRUE, 
    ...) 
{
    if (add.tol) {
        ret.ind <- FALSE
        tol <- 1e-12
        zero.inds <- xseq == 0
        if (TRUE \%in\% zero.inds) {
            ret.ind <- TRUE
            warning(sprintf("values of zero were replaced with  \%s", 
                tol))
            xseq[zero.inds] <- tol
        }
    }
    else {
        stopifnot(!(0 \%in\% xseq))
    }
    toret <- exp(-1 * nu. * pi * (0+1i)/2) * Bessel::BesselK(xseq * 
        exp(pi * (0+1i)/4), nu = nu., ...)
    if (return.list) {
        toret <- list(kei = Im(toret), ker = Re(toret))
        if (ret.ind) {
            toret$zero.indices = zero.inds
        }
    }
    return(toret)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
