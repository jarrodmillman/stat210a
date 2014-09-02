n = 100

myplot = function(x, y1, y2, xlim, ylim, xlab="", ylab="", yorigin=0) {
   plot(x, y1, type="l", lwd=2, xlab=xlab, ylab=ylab, xlim=xlim, ylim=ylim, axes=FALSE)
   abline(h=yorigin)
   abline(v=0)
   lines(x, y2, lwd=2)
   text(1.2, 5, expression(R(theta, delta[1])))
   text(1.2, 4, expression(R(theta, delta[2])))
   text(1.3, .8, expression(theta), 2)
}

# Illustrative example
x = seq(-1, 1, length=n)
y1 = 2*x^2 + 2
y2 = 2*x^2 + 3
y3 = 4*x^2 + 1

par(pty="s")
#par(mfrow=c(1,2), pty="s")
myplot(x, y1, y2, xlim=c(-1.3, 1.3), ylim=c(0.5,5.2), yorigin=1)
myplot(x, y1, y3, xlim=c(-1.3, 1.3), ylim=c(0.5,5.2), yorigin=1)


# Binomial example

p <- seq(0, 1, length=n)
p2 <- seq(0.3, 0.7, length=n)

r1 <- p*(1-p)/n
r2 <- p2*(1-p2)/(n+10)
#r2 <- rep(n/(4*(n+sqrt(n))^2),100)
myplot(p, r1, r2, xlim=c(0,1.3), ylim=NULL)
