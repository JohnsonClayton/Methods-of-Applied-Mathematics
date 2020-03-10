# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 08:21:16 2020

@author: cpjohnson
"""

import numpy as np

# Data collected from my face
xdata = np.array([1, 2.5, 7, 8, 9,   10,  13,  14,  16, 16.5, 17,   18,   19,   20,  21.5, 23,  26.5, 28])  
ydata = np.array([6, 6,   6, 6, 6.5, 6.5, 7.5, 7.5, 7,  6,    5.5,  4.75, 4.75, 4.5, 4,    3.5, 3,    1 ])   

# Note that the following code could break if len(xdata) < len(ydata)
    
# Use rectangle rule to find area under my face
rect = 0

# Use trapezoid rule to find area under my face
trap = 0

for i in range(len(ydata) - 1):
    # Left-Rectangle rule
    rect += ydata[i]*(xdata[i+1] - xdata[i])
    
    # Trapezoid rule (How do you catch a zoid?)
    trap += (ydata[i] + ydata[i+1]) * (xdata[i+1] - xdata[i]) / 2.0

print('Rectangle rule: {}', rect)
print('Trapezoid rule: {}', trap)