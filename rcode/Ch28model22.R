Ch28model22 <- function(T,N,n) {

  #Chapter2.8 Model II: Full Stomach, continuous drinking.
  #Perform Rk4 for alcohol in GI-tract and bloodstream
    
  #T is the time length for [0, T]
  #N is the number of time steps
  #n is the number of drinks per hour
  h = T/N  #This is the time step size
  
  
  #System Parameters
  t0 <- 0
  x0 <- 0         #initial value for GI-tract
  y0 <- 0         #initial value for bloodstream 
  k1 <- 6         #k1 value for GI-tract
  k2 <- k1/2      #k2 value for bloodstream 
  k3 <- 0.014     #k2 value for bloodstream 
  M  <- 0.005     #Modeling constant from reading
  I  <- 0.025*n   #BAL input from drinking continuously

  #System of ODEs
  f1 <- function(x) {I - k1*x}   
  f2 <- function(x,y) {k2*x - k3*y/(y + M)}   
  
  #Initialize vectors for time, GI-Tract x, and Bloodstream y
    t   <- rep(0, N)
    x   <- rep(0, N)
    y   <- rep(0, N)
    z   <- rep(0.05,N+1)
  t[1]  <- t0
  x[1]  <- x0
  y[1]  <- y0
 
  #Runge-Kutta Loop for GI-Tract & Bloodstream
  for(i in 1:N) {
    a1 <- h*f1(x[i]);                      #f1 = slope of x
    a2 <- h*f2(x[i],y[i]);                 #f2 = slope of y
    b1 <- h*f1(x[i]+0.5*a1);               #Half-step predictor 
    b2 <- h*f2(x[i]+0.5*a2,y[i]+0.5*a2);   #Half-step predictor
    c1 <- h*f1(x[i]+0.5*b1);               #Half-step predictor 
    c2 <- h*f2(x[i]+0.5*b2,y[i]+0.5*b2);   #Half-step predictor 
    d1 <- h*f1(x[i]+c1);                   #Full-step predictor 
    d2 <- h*f2(x[i]+c2,y[i]+c2);           #Full-step predictor
    x[i+1] <- x[i]+(1/6)*(a1+2*b1+2*c1+d1);  #Next x value
    y[i+1] <- y[i]+(1/6)*(a2+2*b2+2*c2+d2);  #Next y value 
    t[i+1] <- t[i] + h
  }
  
  #Plot results
  plot(t,x,               #Use line breaks to see plot options
        main = "Model II: Three Drinks Per Hour",
        xlab = "t (hours)",           #x-axis label
        ylab = "BAL (g/100 ml)",      #y-axis label
        type="l",col="blue", 
        xlim=c(0,T),                  #x-axis range
        ylim=c(0,0.10)                #y-axis range
       )
  
  lines(t,y, type="l",col="red")       #Place second graph in plot
  lines(t,z, type="l",col="green")     #Place third graph in plot
  legend("topright",
         legend = c("GI-Tract", "Bloodstream", "Legal Limit"),
         col=c("blue","red","green"),  #legend colors
         lty=c(1,1,1)  #lty = line type (for legend colors)
         )
  
}

