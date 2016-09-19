

## @knitr packages

library(deSolve)
library(ggplot2)
library(dplyr)


## @knitr plotting_functions

ggplot(data = data.frame(x = c(-10, 10)), mapping = aes(x)) + 
  
  stat_function(fun = function(x) (exp(x) - 1)/(exp(x) - 2))



## @knitr ODE_system

p <- c(1, 3, 5, 3)
yini <- c(4, 4)
times <- seq(0, 0.5, 0.001)

func <- function(t, y, parms) {
   dy1 <- p[1] * y[1] + p[2] * y[2]
   dy2 <- p[3] * y[1] + p[4] * y[2]
   list(c(dy1, dy2))
}

out <- ode(y = yini, times = times, func = func, parms = p)

plot(out)

