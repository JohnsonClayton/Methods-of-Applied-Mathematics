# -*- coding: utf-8 -*-
"""
Created on Fri Feb  7 08:33:41 2020

@author: cpjohnson
"""

import numpy as np

xdata = np.array([8.0, 9.0, 9.5, 11.0]) # This is the x data
N = len(xdata)                          # N = number (length) of xdata points
p = 0                                   # Initialize p
for k in range(0,N):                    # This loop adds up xdata values
    p = p + xdata[k]                    
p = p/N                                 # Compute average
print(p)