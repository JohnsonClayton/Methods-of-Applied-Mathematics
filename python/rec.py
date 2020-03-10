# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 08:21:16 2020

@author: cpjohnson
"""

import numpy as np

xdata = np.array([1.0, 2.0, 3.0, 4.0])      # This is the x data
N = len(xdata)
n = N - 1

ydata = np.zeros(N)                         # Initialize y data as zeros

for k in range(0, N):                       # This loop creates y data using Ln(x)
    ydata[k] = np.log(xdata[k])
    
h = (xdata[n] - xdata[0]) / n               # h is the step size
print('h is {}'.format(h))
p = 0
for k in range(0, n):
    p = p + ydata[k]
p = h*p
print(p)