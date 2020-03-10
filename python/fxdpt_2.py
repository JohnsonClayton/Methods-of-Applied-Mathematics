# -*- coding: utf-8 -*-
"""
Created on Wed Feb 19 08:37:09 2020

@author: cpjohnson

This program implements a simple version of Newton's Method
  The input required is x_0 and number of iterations n
"""
import numpy as np

def f(x):
    return x**3 + 4*x**2 - 10

def fp(x):
    return 3*x**2 + 8*x

def g_1(x):
    return x - f(x)/fp(x) # Newton's method

def g_2(x):
    return np.sqrt(10.0/x - 4*x)

def g_3(x):
    return 0.5 * np.sqrt(10 - x**3)

def g_4(x):
    return np.sqrt(10/(4+x))

def fxdpt_2(x_0, n):
    # x_0 is the initial guess
    # n is the number of iterations
    print(x_0)
    for k in range(1, n):
        x_0 = g_3(x_0)
        print("iteration {}: {}".format(k, x_0))
        
