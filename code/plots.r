# number of points on x-axis
n = 100

# Illustrative example
myplot = function(x, y1, y2, xlim, ylim, xlab="", ylab="", yorigin=0) {
   plot(x, y1, type="l", lwd=2, xlab=xlab, ylab=ylab, xlim=xlim, ylim=ylim, axes=FALSE)
   abline(h=yorigin)
   abline(v=0)
   lines(x, y2, lwd=2)
   text(1.2, 5, expression(R(theta, delta[1])))
   text(1.2, 4, expression(R(theta, delta[2])))
   text(1.3, .8, expression(theta), 2)
}

x = seq(-1, 1, length=n)
y1 = 2*x^2 + 2
y2 = 2*x^2 + 3
y3 = 4*x^2 + 1

par(pty="s")
myplot(x, y1, y2, xlim=c(-1.3, 1.3), ylim=c(0.5,5.2), yorigin=1)
myplot(x, y1, y3, xlim=c(-1.3, 1.3), ylim=c(0.5,5.2), yorigin=1)


# Binomial example

myplot2 = function(x, y1, y2, y3, xlim, ylim, xlab="", ylab="", yorigin=0) {
   plot(x, y1, type="l", lwd=2, xlab=xlab, ylab=ylab, xlim=xlim, ylim=ylim, axes=FALSE)
   abline(h=yorigin)
   abline(v=0)
   lines(x, y2, lwd=2)
   lines(x, y3, lwd=2)
   text(1.1, 0.0001, expression(R(theta, delta[1])))
   text(1, 0.0017, expression(R(theta, delta[2])))
   text(1.05, 0.0007, expression(R(theta, delta[3])))
   text(1.3, -.0001, expression(theta), 2)

}

p = seq(0, 1, length=n)

r1 = p*(1-p)/100
r2 = (9 + 100*p*(1-p))/(100^2)
r3 = (9 - 8*p)*(1 + 8*p)/(106^2)
myplot2(p, r3, r2, r1, xlim=c(0,1.3), ylim=c(0,0.0035))
