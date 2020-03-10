# -*- coding: utf-8 -*-
"""
Created on Mon Feb  3 08:42:23 2020

@author: cpjohnson
"""

import numpy as np
import matplotlib.pyplot as plt

def newtoninterp(x):
    xdata = np.array([8.0, 9.0, 9.5, 11.0]) # This is the x data
    N = len(xdata)                          # N = number (length) of xdata points
    ydata=np.zeros(N)                       # Initialize y data as N zeros
    
    for k in range(0, N):                   # This loop creates y data using Ln(x)
        ydata[k] = np.log(xdata[k])
        
    a = ydata.copy()                        # Create a copy of y data
    for k in range(1, N):                   # k = column number of divided diffs
        for i in range(k, N):               # Create column vector of divided diffs
            a[i] = (a[i]-a[k-1])/(xdata[i]-xdata[k-1])
    
    p = a[N-1]                              # Nested computation of p(x)
    for k in range(2, N+1):
        p = (x-xdata[N-k])*p + a[N-k]
        
    solution = p, a
    print(solution)
    
    xp = np.array(x)                      # Put the x value in as a length 1 array
    yp = np.array(p)                      # Put the p value in as a length 1 array
    plt.plot(xdata, ydata, '-o', xp, yp, 's') # Plot array ordered pairs; s = square
    plt.xlabel('x')
    plt.legend(('Data', 'Point value'), loc=0)
    plt.show()
    
def average():
    xdata = np.array([8.0, 9.0, 9.5, 11.0]) # This is the x data
    sum = 0
    for i in xdata:
        sum += i
    avg = sum / len(xdata)
    print(avg)
    #print(np.average(xdata))