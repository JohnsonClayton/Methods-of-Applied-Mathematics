Ch 9.8 - Diffusion
========================================================
author: Clayton Johnson
date: 
autosize: true

Cylinder
========================================================
Now, we want to relate the concentration at equilibrium in a linear geometry,

$$
\frac{d^2C}{dx^2} = 0,
$$

to cylindrical geometries:

$$
\frac{d}{dr} \left( r \frac{dC}{dr} \right) = 0.
$$

Note that $r$ is present since the area through which diffusion occurs changes with the distance from the center in this cylindrical geometry.

Spherical
========================================================

Following similar logic as the movement from a linear to cylindrical geometry, we see the addition of another factor of $r$ for spherical geometries.

$$
\frac{d}{dr} \left( r^2 \frac{dC}{dr} \right) = 0.
$$

What happens if we add an additional source/sink of particles into the system at distance $r$ from the center of the sphere?

Volumetric Mass Source
========================================================

Assuming volumetric mass source at distance $r$ from the center, we have that 
$$
D \frac{1}{r^2} \frac{d}{dr} \left( r \frac{dC}{dr} \right) + M(r) = 0,
$$

where $D$ is the diffusion coefficient and $M(r)$ is the rate of the 'production' of mass, in $\frac{kg}{m^3 s}$.  

Note that $M(r) \gt 0$ and $M(r) \lt 0$ with the addition and removal of mass, respectively.
