
# The Quantile function in R

# Graphics for statistics and data analysis with R, Keen, 2010 (book)
# Sample Quantiles in Statistical Packages, Hyndman and Fan, 1996 (article)

# - not uniquely defined for a random sample
# - no consensus on which method is best



# Create sample

x <- c(80, 41, 48, 83, 79, 45, 39, 48, 80, 85)


# Basic order stats functions

F10 <- ecdf(x)
sort(x)
knots(F10)
plot(F10)


# The consecutive order statistics (sort(x)) are the ith *sample* quantiles

F10(sort(x))


# Software packages use the following to calculate sample quantiles

Q <- function(x, p, m = 1){
  n <- length(x)
  Fx <- ecdf(x)

  j <- floor(p*n + m)
  g <- p*n + m - j
  return(list(p = p,
              j = j,
              g = g,
              Q = (1 - g)*sort(x)[j] + g*sort(x)[j+1])
  )
}


sapply(c(0.1, 0.5, 0.8, 0.9), Q, x = 1:5)


