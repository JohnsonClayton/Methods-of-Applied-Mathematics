"""
Description:Cubic spline fit 
"""
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

"""Enter data"""
x = [1,4,6,9,11,12,13,16,21]
y = [2,3,4,4.5,5,6,6,4,2]

"""Command for cubic spline spline polynomial p(x)"""
p = interp1d(x, y, kind = 'cubic')

"""Create vector of 500 points between 0 and x[n-1] on x-axis"""
n = len(x)
xnew = np.linspace(x[0], x[n-1], num=500, endpoint=True)

"""Plot the original data together with p(x) sampled at the 500 points"""
plt.plot(x, y, 'o', xnew, p(xnew), '-,r')
plt.legend(['Original Data','Cubic Spline p(x)'], loc = 'best')
plt.show()

