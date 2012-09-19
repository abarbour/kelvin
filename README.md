README
/Users/barbour/R/develop/kelvin.pkg/kelvin
Creation date:	Wed May 30 16:53:10 UTC 2012


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Development of R-package for calculation of Kelvin functions, which are the
solution to Kelvin Differential Equation.

Uses Bessel::BesselJ and Bessel::BesselK
Kelvin Functions


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


FROM	http://mathworld.wolfram.com/KelvinFunctions.html

Kelvin defined the Kelvin functions bei and ber according to

	ber_v(x) + i*bei_v(x)
	=	J_v(x*exp(2*pi*i/4))
	=	exp(v*pi*i)*J_v(x*exp(-pi*i/4))
	=	exp(v*pi*i/2)*I_v(x*exp(pi*i/4))
	=	exp(3*v*pi*i/2)*I_v(x*exp(-3*pi*i/4))

where	J_v(x)	is a Bessel function of the first kind and	I_v(x)	
is a modified Bessel function of the first kind. These functions satisfy the 
Kelvin differential equation.

Similarly, the functions kei and ker by

	ker_v(x) + i*kei_v(x) = exp(-v*pi*i/2)*K_v(x*exp(pi*i/4))

where	K_v(x)	is a modified Bessel function of the second kind. 
For the special case v=0,

	J_0(i*sqrt(i)*x)
	=	J_0(sqrt(2)*(i-1)*x/2)
	=	ber(x) + i*bei(x)

