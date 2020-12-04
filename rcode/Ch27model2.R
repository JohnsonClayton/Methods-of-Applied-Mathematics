Ch27model2 <- function(T,n) {

  #Chapter2.7 Model II
  #Perform Rk4 for decongestant & antihistamine
    
  #T is the time length for [0, T]
  #n is the number of time steps
  h = T/n  #This is the time step size
  
  #System Parameters
  t0 <- 0
  xd0 <- 0         #initial value for GI decongestant
  xa0 <- 0         #initial value for GI antihistamine
  yd0 <- 0         #initial value for Bloodstream decongestant
  ya0 <- 0         #initial value for Bloodstream antihistamine
  k1d <- 1.3860    #k1 value for GI decongestant
  k1a <- 0.6931    #k1 value for GI antihistamine
  k2d <- 0.1386    #k2 value for Bloodstream decongestant  
  k2a <- 0.0231    #k2 value for Bloodstream antihistamine
  Id  <- 1
  Ia  <- 1
  
  #System of ODEs
  f1d <- function(x) {Id - k1d*x}   
  f1a <- function(x) {Ia - k1a*x}   
  f2d <- function(x,y) {k1d*x - k2d*y}   
  f2a <- function(x,y) {k1a*x - k2a*y}   
  
  #Initialize vectors for time, GI-Tract x, and Bloodstream y
  t <- rep(0, n)
  xd <- rep(0, n)
  xa <- rep(0, n)
  yd <- rep(0, n)
  ya <- rep(0, n)
  t[1] <- t0
  xd[1] <- xd0
  xa[1] <- xa0
  yd[1] <- yd0
  ya[1] <- ya0
  
  #Runge-Kutta Loop for GI-Tract (Generate vectors xd and xa)
  for(i in 1:n) {
    a1 <- h*f1d(xd[i]);             #f1d = slope of xd
    a2 <- h*f1a(xa[i]);             #f2a = slope of xa
    b1 <- h*f1d(xd[i]+0.5*a1);      #Half-step predictor 
    b2 <- h*f1a(xa[i]+0.5*a2);      #Half-step predictor 
    c1 <- h*f1d(xd[i]+0.5*b1);      #Half-step predictor 
    c2 <- h*f1a(xa[i]+0.5*b2);      #Half-step predictor 
    d1 <- h*f1d(xd[i]+c1);          #Full-step predictor 
    d2 <- h*f1a(xa[i]+c2);          #Full-step predictor 
    xd[i+1] <- xd[i]+(1/6)*(a1+2*b1+2*c1+d1); #Next xd value
    xa[i+1] <- xa[i]+(1/6)*(a2+2*b2+2*c2+d2); #Next xa value
    t[i+1] <- t[i] + h
  }
  
  
  #Runge-Kutta Loop for Bloodstream (Generate vectors yd and ya)
  for(i in 1:n) {
    a1 <- h*f2d(xd[i],yd[i]);          #f1= slope of yd
    a2 <- h*f2a(xa[i],ya[i]);          #f2= slope of ya
    b1 <- h*f2d(xd[i]+0.5*a1,yd[i]+0.5*a1);  #Half-step predictor
    b2 <- h*f2a(xa[i]+0.5*a2,ya[i]+0.5*a2);  #Half-step predictor
    c1 <- h*f2d(xd[i]+0.5*b1,yd[i]+0.5*b1);  #Half-step predictor
    c2 <- h*f2a(xa[i]+0.5*b2,ya[i]+0.5*b2);  #Half-step predictor 
    d1 <- h*f2d(xd[i]+c1,yd[i]+c1);          #Full-step predictor
    d2 <- h*f2a(xa[i]+c2,ya[i]+c2);          #Full-step predictor
    yd[i+1] <- yd[i]+(1/6)*(a1+2*b1+2*c1+d1); #new yd value
    ya[i+1] <- ya[i]+(1/6)*(a2+2*b2+2*c2+d2); #new ya value
    }
  
  #Plot results 
  plot(t,xd,               #Use line breaks to see plot options
        main = "Model II: GI-Tract",
        xlab = "t (hours)",           #x-axis label
        ylab = "Amount (mg)",         #y-axis label
        type="l",col="blue", 
        xlim=c(0,T),                  #x-axis range
        ylim=c(0,2.0)                 #y-axis range
       )
  
  lines(t,xa, type="l",col="red")  #Place second graph in plot
  legend("topright",
         legend = c("Decongestant", "Antihistamine"),
         col=c("blue","red"),  #legend colors
         lty=c(1,1)  #lty = line type (for legend colors)
         )
  
  plot(t,yd,               #Use line breaks to see plot options
       main = "Model II: Bloodstream",
       xlab = "t (hours)",           #x-axis label
       ylab = "Amount (mg)",         #y-axis label
       type="l",col="blue", 
       xlim=c(0,T),                  #x-axis range
       ylim=c(0,45)                  #y-axis range
  )
  
  lines(t,ya, type="l",col="red")  #Place second graph in plot
  legend("topright",
         legend = c("Decongestant", "Antihistamine"),
         col=c("blue","red"),  #legend colors
         lty=c(1,1)  #lty = line type (for legend colors)
  )

}
