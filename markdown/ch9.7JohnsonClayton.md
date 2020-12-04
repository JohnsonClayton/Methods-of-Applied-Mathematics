Chapter 9.7 - Heat Fins
========================================================
author: Clayton Johnson
date: 
autosize: true

Formulating the Differential Equation 
========================================================
Replacements in word equation 9.28 (below):

$$
\begin{equation}
  \begin{Bmatrix}
    \mathrm{rate \, heat} \\
    \mathrm{conducted} \\
    \mathrm{in\, at\, x} \\
  \end{Bmatrix}
  -
  \begin{Bmatrix}
    \mathrm{rate \, heat} \\
    \mathrm{conducted} \\
    \mathrm{out\, at\, x+\Delta x} \\
  \end{Bmatrix}
  - 
  \begin{Bmatrix}
    \mathrm{rate\, of\, heat} \\
    \mathrm{lost\, to} \\
    \mathrm{surroundings} \\
  \end{Bmatrix}
  = 0
\end{equation}
$$

to generate our differential equation.

We want to write this DE in terms of heat flux ($J$) and temperature ($U$), both 
with respect to space ($x$), no time.

Formulating the Differential Equation 
========================================================

Using what we learned in section 9.5 -- Heat Conduction through a Wall -- we can state

$$
\begin{Bmatrix}
  \mathrm{rate \, heat} \\
  \mathrm{conducted} \\
  \mathrm{in\, at\, x} \\
\end{Bmatrix}
= J(x)A(x)
= J(x)bw,
$$
and

$$
\begin{Bmatrix}
  \mathrm{rate \, heat} \\
  \mathrm{conducted} \\
  \mathrm{out\, at\, x+\Delta x} \\
\end{Bmatrix}
= J(x+\Delta x)A(x)
= J(x+\Delta x)bw,
$$

where $bw$ indicates the area through which heat is conducted.

Formulating the Differential Equation 
========================================================
What we have so far: 

$$
J(x)bw - J(x+\Delta x)bw - \begin{Bmatrix}
  \mathrm{rate\, of\, heat} \\
  \mathrm{lost\, to} \\
  \mathrm{surroundings} \\
\end{Bmatrix}
= 0.
$$

Final term from the word equation (9.28):

$$  
\begin{Bmatrix}
  \mathrm{rate\, of\, heat} \\
  \mathrm{lost\, to} \\
  \mathrm{surroundings} \\
\end{Bmatrix}
= \text{Newton's Law of Cooling stuff}
$$


Formulating the Differential Equation (Newton Cooling Stuff)
========================================================
What we have from section 9.3 -- Model for a Hot Water Heater:

$$
\begin{Bmatrix}
  \mathrm{rate\, heat} \\
  \mathrm{exchanged\, with} \\
  \mathrm{surroundings} \\
\end{Bmatrix}
= \pm hS \Delta U,
$$

where **$h$ is a positive constant of proportionality**, $S$ is the surface area from which heat is lost/gained, and $\Delta U$ is the temperature difference between the object (fin) and surroundings ($u_s$).

Formulating the Differential Equation
========================================================

<img src='./heat_fin_dimensions.png' height=300 width=400 align='center'>

Previous slide:

$$
\begin{Bmatrix}
  \mathrm{rate\, heat} \\
  \mathrm{exchanged\, with} \\
  \mathrm{surroundings} \\
\end{Bmatrix}
= hS \Delta U
$$
***
$h$ depends on the material,  

$S = 2w \Delta x$, since we are ignoring the side faces,  

$\Delta U$ is the difference in temperature from $U(x^*)$ and $u_s$, where $x \lt x^* \lt x+\Delta x$.

Formulating the Differential Equation
========================================================
Thus, we have  

$$
\begin{Bmatrix}
  \mathrm{rate\, heat} \\
  \mathrm{exchanged\, with} \\
  \mathrm{surroundings} \\
\end{Bmatrix}
= hS \Delta U
= 2hw\Delta x[U(x^*)-u_s]
$$

and the differential equation is now

$$
J(x)bw - J(x+\Delta x)bw - 2hw\Delta x[U(x^*)-u_s] = 0.
$$

or, as the book states: 

$$
J(x)bw - J(x+\Delta x)bw - 2hw\Delta x[U(x + \lambda \Delta x)-u_s] = 0.
$$

where $x^* = x + \lambda \Delta x$ and $0 \leq \lambda \leq 1$. 

Formulating the Differential Equation (Units) (Optional)
========================================================
## Units of **$h$**

$$
\begin{align*}
  \big[ hS \Delta U \big] &= \big[J(x)bw \big], \\
  \big[ h \big] \times \text{meters}^2 \times \text{Temperature} &= \frac{ \text{Watts} }{\text{meters}^2} \times \text{meters}^2, \\
  \big[ h \big] &= \frac{ \text{Watts} }{ \text{Temperature} \times \text{meters}^2 }, \\
  \big[ h \big] &= \frac{ \text{Joules} }{ \text{Temperature} \times \text{meters}^2 \times \text{Seconds} }
\end{align*}
$$
