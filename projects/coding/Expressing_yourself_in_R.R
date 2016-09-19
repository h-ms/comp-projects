# Expresing yourself in R (Hadley Wickham slides)

a <- c(11, 2, 4, NA,  2, 12,  5, 12, NA, NA,  3)
d <- c(11, 2, 4, NA, -1, NA, NA, NA,  1, NA, -1)

sum(is.na(a) & is.na(d))


set.seed(129)
x <- sample(c(TRUE, FALSE), prob = c(0.2, 0.8), 
            100, replace = TRUE
)

set.seed(130)
z <- sample(c(TRUE, FALSE), prob = c(0.2, 0.8), 
            100, replace = TRUE
)

y <- cumsum(z)
y <- c(1, 1 + y[-length(y)])

data.frame(z = z, y = y)
