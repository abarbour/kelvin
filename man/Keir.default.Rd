\name{Keir.default}
\alias{Keir.default}
\title{Solutions to the Kelvin differential equations: 'Kei' and 'Ker'}
\usage{
  Keir.default(xseq, nu. = 0, nSeq. = 1, add.tol = TRUE,
    return.list = TRUE, show.scaling = FALSE, ...)
}
\arguments{
  \item{xseq}{vector; values to evaluate the complex
  solution at}

  \item{nu}{scalar; controls the order of the Bessel
  functions}

  \item{nSeq.}{positive integer; if > 1, computes the
  result for a whole sequence of nu values; if nu >= 0,nu,
  nu+1, ..., nu+nSeq-1, if nu < 0, nu, nu-1, ...,
  nu-nSeq+1.}

  \item{add.tol}{boolean; fudge factor to prevent an error
  for zero-values}

  \item{return.list}{boolean; Should the result be a list
  instead of matrix?}

  \item{show.scaling}{boolean; Should the normalization
  values be given as a message?}
}
\value{
  \code{return.list==FALSE} (default): matrix of complex
  values with columns representing each order (if
  \code{nSeq.>1}); otherwise the result is a list with Real
  and Imaginary components segregated.
}
\description{
  This function calculates the complex solution to the
  Kelvin differential equations using modified Bessel
  function of the second kind, specifically that which is
  produced by \code{\link{Bessel::BesselK}}.
}
\examples{
Keir(1:10)    # defaults to nu.=0, nSeq=1
Keir(1:10,nSeq=2)
Keir(1:10,nSeq=2,return.list=FALSE)
}
\author{
  Andrew Barbour <andy.barbour@gmail.com>
}
\references{
  \link{http://mathworld.wolfram.com/KelvinFunctions.html}
}
\seealso{
  \code{\link{Kelvin}}, \code{\link{Keir}},
  \code{\link{Beir}}
}
\keyword{Kelvin}
\keyword{Orthogonal}
\keyword{functions}

