# -*- coding: utf-8 -*-
"""
Created on Wed Feb 19 08:37:09 2020

@author: cpjohnson

This program implements a simple version of Newton's Method
  The input required is x_0 and number of iterations n
"""

def f(x):
    return x**3 - 4*x**2 + 3*x + 1

def fp(x):
    return 3*x**2 - 8*x + 3

def g(x):
    return x - f(x)/fp(x) # Newton's method
    

def fxdpt(x_0, n):
    # x_0 is the initial guess
    # n is the number of iterations
    print(x_0)
    for k in range(1, n):
        x_0 = g(x_0)
        print("iteration {}: {}".format(k, x_0))
        
