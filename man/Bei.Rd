\name{Bei}
\alias{Bei}
\title{Bei}
\description{
Imaginary component of the complex solution to the Kelvin Differential Equation.
}
\usage{
Bei(...)
}
\arguments{
  \item{\dots}{arguments to pass to Beir
}
}
\details{
An alias function which uses the method Beir.
}
\value{
a vector or imaginal components.  If $nSeq>1$ the result is a matrix for
the orders of the resulting sequence.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
\link{http://mathworld.wolfram.com/Bei.html}
}
\author{
Andrew J Barbour
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{Keir}}
}
\examples{
Kei{1:10}
Kei{1:10,nSeq=2}

## The function is currently defined as
function (...) 
Beir(..., return.list = TRUE)$bei
}
\keyword{ Kelvin Function }
\keyword{ Imaginary }
