rk4data <- function (f, x0 , y0 , h, n) {
  x <- rep(0, n)
  y <- rep(0, n)
  x[1] <- x0
  y[1] <- y0
  for(i in 1:n) {
    s1 <- h * f(x[i], y[i])
    s2 <- h * f(x[i] + h / 2, y[i] + s1 / 2)
    s3 <- h * f(x[i] + h / 2, y[i] + s2 / 2)
    s4 <- h * f(x[i] + h, y[i] + s3)
    y[i+1] <- y[i] + s1 / 6 + s2 / 3 + s3 / 3 + s4 / 6
    x[i+1] <- x[i] + h
  }
  return(data.frame (x = x, C = y))
}
