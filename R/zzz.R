#
.onAttach <- function(...) { 
  packageStartupMessage(
    sprintf("Loaded kelvin (%s) -- Solutions to the Kelvin differential equation.",
            utils:::packageVersion("kelvin")))
}
.Last.lib <- function(...){
  NULL
}