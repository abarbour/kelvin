\name{kelvin-package}
\alias{kelvin-package}
\alias{kelvin}
\docType{package}
\title{
Kelvin: Uses Bessel functions to calculate Kelvin functions: Bei, Ber, Kei, Ker
}
\description{
Simple wrapper functions 
which may be used to calculate Kelvin functions of arbirtrary
order.
}
\details{
\tabular{ll}{
Package: \tab kelvin\cr
Type: \tab Package\cr
Version: \tab 1.0-1\cr
Date: \tab 2012-07-27\cr
License: \tab GPL-2\cr
}
}
\author{
Andrew J. Barbour
(and maintainer) <andy.barbour@gmail.com>
}
\references{
\link{http://mathworld.wolfram.com/KelvinFunctions.html}
}
\keyword{ Bessel functions }
\keyword{ Kelvin functions }
\keyword{ Orthogonal functions }
\seealso{
\code{\link[<Bessel>:<Bessel>-package]{<Bessel>}} 
}
\examples{
Kelvin{1:10}	# defaults to nu.=0, nSeq=1
Kelvin{1:10,nSeq=2}
Kelvin{1:10,nSeq=2,return.list=FALSE}
Beir{1:10}	# defaults to nu.=0, nSeq=1
Beir{1:10,nSeq=2}
Beir{1:10,nSeq=2,return.list=FALSE}
}
