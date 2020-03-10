"""
Description:Cubic spline fit for my face
"""
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

"""Enter data"""
x = [1, 2.5, 7, 8, 9,   10,  13,  14,  16, 16.5, 17,   18,   19,   20,  21.5, 23,  26.5, 28]
y = [6, 6,   6, 6, 6.5, 6.5, 7.5, 7.5, 7,  6,    5.5,  4.75, 4.75, 4.5, 4,    3.5, 3,    1 ]

"""Command for cubic spline spline polynomial p(x)"""
p = interp1d(x, y, kind = 'cubic')

"""Create vector of 500 points between 0 and x[n-1] on x-axis"""
n = len(x)
xnew = np.linspace(x[0], x[n-1], num=500, endpoint=True)

"""Plot the original data together with p(x) sampled at the 500 points"""
plt.plot(x, y, 'o', xnew, p(xnew), '-,r')
plt.legend(['Original Data','Cubic Spline p(x)'], loc = 'best')
plt.show()
