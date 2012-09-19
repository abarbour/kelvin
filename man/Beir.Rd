\name{Beir}
\alias{Beir}
\title{Solutions to the Kelvin differential equations: 'Bei' and 'Ber'}
\usage{
  Beir(xseq, nu. = 0, return.list = TRUE, ...)
}
\arguments{
  \item{xseq}{vector; values to evaluate the complex
  solution at}

  \item{nu.}{scalar; controls the order of the Bessel
  functions}

  \item{return.list}{boolean; Should the result be a list
  instead of matrix?}

  \item{...}{arguments passed to \code{Bessel::BesselJ}}
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
  function of the first kind, specifically that which is
  produced by \code{Bessel::BesselJ}.
}
\examples{
Beir(1:10)    # defaults to nu.=0
Beir(1:10, nu.=2)
}
\author{
  Andrew Barbour <andy.barbour@gmail.com>
}
\references{
  \url{http://mathworld.wolfram.com/KelvinFunctions.html}
}
\seealso{
  \code{\link{Ber}}, \code{\link{Bei}}
}
\keyword{"Kelvin}
\keyword{"Orthogonal}
\keyword{functions"}
\keyword{functions",}

