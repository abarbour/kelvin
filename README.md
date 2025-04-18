# kelvin

Solutions to the the Kelvin differential equation in R

by Andrew J Barbour

<!-- badges: start -->
[![](https://www.r-pkg.org/badges/version-last-release/kelvin?color=green)](https://cran.r-project.org/package=kelvin)
[![Downloads](https://cranlogs.r-pkg.org/badges/kelvin)](https://www.r-pkg.org/pkg/kelvin) 
[![License](https://img.shields.io/badge/license-GPL-lightgrey.svg)](https://www.gnu.org/licenses/gpl-2.0.html)

[![Codecov test coverage](https://codecov.io/gh/abarbour/kelvin/graph/badge.svg)](https://app.codecov.io/gh/abarbour/kelvin)
[![R-CMD-check](https://github.com/abarbour/kelvin/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/abarbour/kelvin/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

--------
Calculation of solutions to the Kelvin Differential Equation
using Bessel functions namely
`BesselJ`  and  `BesselK` from the [Bessel package](https://cran.r-project.org/package=Bessel).

## Background information

*The following is taken from [Wolfram](http://mathworld.wolfram.com/KelvinFunctions.html):*

Kelvin defined the Kelvin functions bei and ber according to

	ber_v(x) + i*bei_v(x)
	=	J_v(x*exp(2*pi*i/4))
	=	exp(v*pi*i)*J_v(x*exp(-pi*i/4))
	=	exp(v*pi*i/2)*I_v(x*exp(pi*i/4))
	=	exp(3*v*pi*i/2)*I_v(x*exp(-3*pi*i/4))

where `J_v(x)` is a Bessel function of the first kind and `I_v(x)`
is a modified Bessel function of the first kind. These functions satisfy the 
Kelvin differential equation.

Similarly, the functions kei and ker by

	ker_v(x) + i*kei_v(x) = exp(-v*pi*i/2)*K_v(x*exp(pi*i/4))

where `K_v(x)` is a modified Bessel function of the second kind. 
For the special case v=0,

	J_0(i*sqrt(i)*x)
	=	J_0(sqrt(2)*(i-1)*x/2)
	=	ber(x) + i*bei(x)

