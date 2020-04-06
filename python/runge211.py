"""
This program implements the Runge-Kutta Method for solving 
the IVP y' = f(x,y), y(x0) = y0.
This method comes from Ch21.1, and hence "runge211".  
The derivative function f(x,y) is typed into the program code. 
User input:
    x0 = initial x value
    y0 = initial y value
    h = step size
    N = number of iterations
If the exact solution g(x) is known in advance, then  
this program plots it along with the numerical solution.
"""

import numpy as np
import matplotlib.pyplot as plt
 
def runge211(x0,y0,h,N):  #This defines the program as a function. 
    
    def f(x,y):         #Derivative function from ODE
        return y + x
    
    def g(x):           #Exact solution to ODE; known in advance. 
        return np.exp(x) - x - 1.0
  
    x = np.zeros(N+1)   #Initialize x values for numerical solution
    y = np.zeros(N+1)   #Initialize y values for numerical solution
    x[0] = x0           #Initial x value 
    y[0] = y0           #Initial y value 
    for n in range(0,N): #This loop computes the numerical solution values
        x[n+1] = x[n] + h  #next x-value using full step size h
        k1 = h*f(x[n],y[n])  #k1 uses slope at current point      
        k2 = h*f(x[n]+0.5*h,y[n]+0.5*k1)  #k2 uses a half-step predictor slope
        k3 = h*f(x[n]+0.5*h,y[n]+0.5*k2)  #k3 uses a half-step predictor slope    
        k4 = h*f(x[n+1],y[n]+k3)          #k4 uses a half-step predictor slope
        y[n+1] = y[n] + 1.0/6*(k1+2*k2+2*k3+k4)  #corrector value
    
    print('Runge-Kutta Solution=', y)     #Print numerical solution y-values
    
    #Next, we plot the numerical and analytical solutions
    L = N*h  #[0,L] is the x-axis interval for solution, used in linspace
    xvalues = np.linspace(0,L,1000)  #1000 equally spaced x-values from 0 to L     
    plt.plot(xvalues,g(xvalues),'r',x,y,'bo') #plot command for both solutions
    plt.xlabel('x')
    plt.legend(('Exact','Runge-Kutta'),loc = 0)
    plt.show()
    
         
        
    