pkgname <- "kitagawa"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('kitagawa')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("alpha_constants")
### * alpha_constants

flush(stderr()); flush(stdout())

### Name: alpha_constants
### Title: Calculate any constants depending on effective stress
###   coefficient alpha
### Aliases: alpha_constants alpha_constants.default

### ** Examples

alpha_constants()   # kelvin::Keir gives warning
alpha_constants(1)  # defaults to constant 'Phi' (note output also has Kel)
alpha_constants(1:10, c.type="A")  # constant 'A' (again, note output)



cleanEx()
nameEx("cross_spectrum")
### * cross_spectrum

flush(stderr()); flush(stdout())

### Name: cross_spectrum
### Title: Calculate the cross-spectrum of two timeseries
### Aliases: cross_spectrum cross_spectrum.mts cross_spectrum.default

### ** Examples

require(stats)
require(psd)

n <- 1000
ramp <- seq_len(n)
parab <- ramp^2

set.seed(1255)
X <- ts(rnorm(n) + ramp/2)
Y <- ts(rnorm(n) + ramp/10 + parab/100)

# Calculate the multitaper cross spectrum
csd <- cross_spectrum(X, Y, k=20)




cleanEx()
nameEx("kitagawa-constants")
### * kitagawa-constants

flush(stderr()); flush(stdout())

### Name: kitagawa-constants
### Title: Access to constants used by default
### Aliases: kitagawa-constants constants

### ** Examples

constants()
constants(FALSE) # returns invisibly



cleanEx()
nameEx("kitagawa-utilities")
### * kitagawa-utilities

flush(stderr()); flush(stdout())

### Name: kitagawa-utilities
### Title: General utility functions
### Aliases: kitagawa-utilities .nullchk .in0to1 is.wrsp is.owrsp

### ** Examples

## Not run: 
##D .nullchk(1:10) # OK
##D .nullchk(NULL) # error
##D .nullchk(c(1:10,NULL)) # error
##D .nullchk(NA) # error
##D .nullchk(c(1:10,NA)) # error
##D 
##D .in0to1(1:10) # error
##D .in0to1(NULL) # error
##D .in0to1(c(1:10,NULL)) # error
##D .in0to1(NA) # error
##D .in0to1(c(1:10,NA)) # error
##D .in0to1(c(1,NA)) # error
##D 
##D is.wrsp(1) # FALSE
## End(Not run)



cleanEx()
nameEx("logsmoo")
### * logsmoo

flush(stderr()); flush(stdout())

### Name: logsmoo
### Title: Logarithmic smoothing with loess
### Aliases: logsmoo

### ** Examples

set.seed(11133)
n <- 101
lx <- seq(-1,1,length.out=n)
y <- rnorm(n) + cumsum(rnorm(n))
plot(lx, y, col='grey')
lines(logsmoo(lx, y, x.is.log=TRUE))




cleanEx()
nameEx("logticks")
### * logticks

flush(stderr()); flush(stdout())

### Name: logticks
### Title: Add proper logarithm ticks to a plot axis.
### Aliases: logticks log_ticks log2_ticks log10_ticks

### ** Examples

x <- 10^(0:8)
y <- 1:9

plot(log10(x),y,xaxt="n",xlab="x",xlim=c(0,9))
logticks()
logticks(ax=3, ticks.only=TRUE)

par(tcl=0.5) # have tick marks show up on inside instead
plot(log10(x),y,xaxt="n",xlab="x",xlim=c(0,9))
logticks()
logticks(ax=3, ticks.only=TRUE)



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("omega_constants")
### * omega_constants

flush(stderr()); flush(stdout())

### Name: omega_constants
### Title: Calculate any constants that depend on angular frequency omega
### Aliases: omega_constants omega_constants.default

### ** Examples

# alpha
omega_constants() # default is alpha, but will give warnings about S., T., Rs.
omega_constants(T.=1,S.=1,Rs.=1)  # 0, no warnings
omega_constants(1:10)  # sequence, with warnings about S., T., Rs.
omega_constants(1:10,T.=1,S.=1,Rs.=1) # sequence, no warnings
# diffusivity time
omega_constants(c.type="diffusivity_time", D.=1)  # 0, no warnings
omega_constants(c.type="diff", D.=1)  # 0, no warnings (arg matching)
omega_constants(c.type="diff")  # 0, warnings about S., T. because no D.
omega_constants(c.type="diff", S.=1)  # 0, warnings about T. because no D. or S.



cleanEx()
nameEx("open_well_response")
### * open_well_response

flush(stderr()); flush(stdout())

### Name: open_well_response
### Title: Spectral response for an open well
### Aliases: open_well_response open_well_response.default

### ** Examples

OWR <- open_well_response(1:10,1,1)
plot(OWR)
OWR <- open_well_response(1/(1:200),1,1,Ta=100,Hw=10,model="liu",freq.units="Hz")
plot(OWR)



cleanEx()
nameEx("owrsp-methods")
### * owrsp-methods

flush(stderr()); flush(stdout())

### Name: owrsp-methods
### Title: Generic methods for objects with class "owrsp".
### Aliases: owrsp-methods owrsp as.data.frame.owrsp data.frame.owrsp
###   print.owrsp summary.owrsp print.summary.owrsp lines.owrsp
###   points.owrsp plot.owrsp

### ** Examples

S. <- 1e-5  	# Storativity [nondimensional]
T. <- 1e-4		# Transmissivity [m**2 / s]
frq <- 1/(1:200)
# Defaults to the Rojstaczer formulation
W <- open_well_response(frq, T. = T., S. = S., Rs. = 0.12, freq.units="Hz")
# (warning message about missing 'z')
W <- open_well_response(frq, T. = T., S. = S., Rs. = 0.12, freq.units="Hz", z=1)
str(W)
print(W)
print(summary(W))
plot(rnorm(10), xlim=c(-1,11), ylim=c(-2,2))
lines(W)
lines(W, "phs", col="red")
points(W)
points(W, "phs")
#
Wdf <- as.data.frame(W)
plot(Mod(wellresp) ~ omega, Wdf) # amplitude
plot(Arg(wellresp) ~ omega, Wdf) # phase
plot(W)
# change limits:
plot(W, xlims=c(-4,0), ylims=list(amp=c(-7,-3), phs=185*c(-1,1)))



cleanEx()
nameEx("sensing_volume")
### * sensing_volume

flush(stderr()); flush(stdout())

### Name: sensing_volume
### Title: Calculate volume of fluids in the sensing region of the
###   borehole.
### Aliases: sensing_volume

### ** Examples

#### dummy example
sensing_volume(1, 1, 1, 1)
#
#### a more physically realistic calculation:
# Physical params applicable for B084 borehole
# (see: http://pbo.unavco.org/station/overview/B084/ for details)
#
Rc <- 0.0508   # m, radius of water-sensing (2in)
Lc <- 146.9    # m, length of grouted region (482ft)
Rs <- 3*Rc     # m, radius of screened region (6in)
Ls <- 9.14     # m, length of screened region (30ft)
#
# calculate the sensing volume for the given well parameters
sensing_volume(Rc, Lc, Rs, Ls) # m**3, ~= 1.8



cleanEx()
nameEx("well_response")
### * well_response

flush(stderr()); flush(stdout())

### Name: well_response
### Title: Spectral response for a sealed well
### Aliases: well_response well_response.default

### ** Examples

#### dummy example
well_response(1:10, T.=1, S.=1, Vw.=1, Rs.=1, Ku.=1, B.=1)

#### a more physically realistic calculation:
# Physical params applicable for B084 borehole
# (see: http://pbo.unavco.org/station/overview/B084/ for details)
#
Rc <- 0.0508   # m, radius of water-sensing (2in)
Lc <- 146.9    # m, length of grouted region (482ft)
Rs <- 3*Rc     # m, radius of screened region (6in)
Ls <- 9.14     # m, length of screened region (30ft)
#
# calculate the sensing volume for the given well parameters
Volw <- sensing_volume(Rc, Lc, Rs, Ls) # m**3, ~= 1.8
#
Frqs <- 10**seq.int(from=-4,to=0,by=0.1) # log10-space
head(Rsp <- well_response(omega=Frqs, T.=1e-6, S.=1e-5, 
Vw.=Volw, Rs.=Rs, Ku.=40e9, B.=0.2, freq.units="Hz"))

# Access plot.wrsp:
plot(Rsp)




cleanEx()
nameEx("wrsp-methods")
### * wrsp-methods

flush(stderr()); flush(stdout())

### Name: wrsp-methods
### Title: Generic methods for objects with class "wrsp".
### Aliases: wrsp-methods wrsp as.data.frame.wrsp data.frame.wrsp
###   print.wrsp summary.wrsp print.summary.wrsp lines.wrsp points.wrsp
###   plot.wrsp kitplot kitplot.wrsp

### ** Examples

W <- well_response(1:10, T.=1, S.=1, Vw.=1, Rs.=1, Ku.=1, B.=1)
str(W)
print(W)
print(summary(W))
#
# Plot the response
plot(rnorm(10), xlim=c(-1,11), ylim=c(-2,2))
lines(W)
lines(W, "phs", col="red")
points(W)
points(W, "phs")
#
Wdf <- as.data.frame(W)
plot(Mod(wellresp) ~ omega, Wdf) # amplitude
plot(Arg(wellresp) ~ omega, Wdf) # phase
#
# or use the builtin method plot.wrsp
plot(W)
# change limits:
plot(W, xlims=c(-1,1), ylims=list(amp=c(5,8), phs=185*c(-1,1)))



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
