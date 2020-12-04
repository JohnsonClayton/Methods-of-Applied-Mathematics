Final Project Progress Report
========================================================
author: 
date: 
autosize: true

Problem Statement
========================================================

## Goals
 - Develop a basic model for the transmission of Cholera within a community  
 - Extend the model to account for more realistic features of Cholera  
 - Brief discussion on how we would handle multi-stage infectious diseases

Background Discussion [1]
========================================================

### What is Cholera?  
 - Disease caused by bacteria (*Vibrio cholerae*)  
 - Symptoms mostly include dehydration, cramps, diarrhea, and kidney failure if left untreated  
 - Once recovered, immunity lasts up to two years
 
### Why does it occur? 
 - Caused by contamination of water supply with the bacteria  
 - Infected individuals act as incubators for bacteria and reintroduce more bacteria into water supply  
 - Rare in industrialized nations due to improved infrastructure  
 
Assumptions
========================================================

 - Contraction of Cholera only occurs through contact with water (generally true)  
 - Immunity lasts *forever* (valid, unless time > 2 years)  
 - Bacteria introduction is only from first infected
 - Latent period in new infected is zero


***

<img src="gen-family-standing-water.gif" height=400px width=800px />

Compartment Diagram
========================================================



Variables, Parameters, and the Derivation of Differential Equations
========================================================
$$
\begin{align*}
  \frac{dS}{dt} &= -\lambda (t) S, \\
  \frac{dI}{dt} &= \lambda (t)S - \gamma I, \\
  \frac{dB}{dt} &= e_{\text{xcr}}I + (n_b - m_b)B, \\
\end{align*}
$$

 - $S(t)$ is the susceptible population,
 - $I(t)$ is the infected population,  
 - $B(t)$ is the bacteria cell count,
 - $\lambda (t)$ is the force of infection at time $t$,
 - $n_b - m_b$ is the net growth rate for the cell population.

Derivation of Differential Equations (cont.)
========================================================

## What's with this $\lambda (t)$ term?  
 This describes how quickly susceptible individuals become infected. Since contact with water through cooking, cleaning, and eating/drinking is the only way to contract, 
 
$$
\lambda (t) = cp(B) = c \frac{B}{k_{50} + B},
$$

where $c$ describes the number of contacts with water, $p$ is the probability of infection given the population of bacteria, and $k_{50}$ is the bacterial concentration at which chance of infection is 50%.


Derivation of Differential Equations (cont.)
========================================================
This leaves us with the following equations for our Cholera model,

$$
\begin{align*}
  \frac{dS}{dt} &= -c \frac{B}{k_{50} + B} S, \\
  \frac{dI}{dt} &= c \frac{B}{k_{50} + B}S - \gamma I, \\
  \frac{dB}{dt} &= e_{\text{xcr}}I + (n_b - m_b)B, \\
\end{align*}
$$

where $\gamma$ is the recovery rate and $e_{\text{xcr}}$ represents the rate of excretion of the bacteria.  

Code for Numerical Solution
========================================================
Here's the code I'm using to replicate Figure 5.5:  


```r
graph55 <- function(t_max) {
  # Define the RK4 constants
  N <- 10000;
  t_min <- 0;
  t_max <- t_max;
  h <- (t_max - t_min) / N;
  
  # Define the equation constants
  c <- 1; # day^-1
  k50 <- 1000000; # cells / ml
  gamma <- 0.2; # day^-1
  exr <- 10; # cells / (ml day person)
  nm <- -0.33; # day^-1
```

Code for Numerical Solution (Cont.)
========================================================


```r
  # Define the diff eqs
  Sp <- function(B, S) {
    -1*c*( B / (k50+B) )*S;
  }
  
  Ip <- function(B, S, I) {
    c*( B / (k50+B) )*S - gamma*I;
  }
  
  Bp <- function(B, I) {
    exr*I + nm*B;
  }
```
  
Code for Numerical Solution (Cont.)
========================================================
  

```r
  # Define the arrays for the values of the functions
  S <- rep(0, N);
  I <- rep(0, N);
  B <- rep(0, N);
  t <- rep(0, N);
  
  # Set up initial values
  S[1] <- 10000;
  I[1] <- 1;
  B[1] <- 0;
  t[1] = t_min;
```

Code for Numerical Solution (Cont.)
========================================================


```r
  # Runge-Kutta for each diff eq
  for(i in 1:N) {
    # dS/dt
    a1 <- h*Sp(B[i], S[i]);
    b1 <- h*Sp(B[i] + 0.5*a1, S[i] + 0.5*a1);
    c1 <- h*Sp(B[i] + 0.5*b1, S[i] + 0.5*b1)
    d1 <- h*Sp(B[i] + c1, S[i] + c1);
    S[i+1] <- S[i]+(1/6)*(a1+2*b1+2*c1+d1); # Next S value
```

Code for Numerical Solution (Cont.)
========================================================


```r
  # Later on...
  plot(t, S,
        main = "Cholera Susceptible Population",
        xlab = "t (days)",           #x-axis label
        ylab = "Population S(t)",      #y-axis label
        type="l",
        col="blue", 
        xlim=c(t_min, t_max),                  #x-axis range
        ylim=c(0, S[1])                #y-axis range
       )
}
```

Graphs for Numerical Solution
========================================================
![plot of chunk unnamed-chunk-6](FinalProjectProgressReportJohnsonClayton-figure/unnamed-chunk-6-1.png)

Graphs for Numerical Solution (Cont.)
========================================================

![plot of chunk unnamed-chunk-7](FinalProjectProgressReportJohnsonClayton-figure/unnamed-chunk-7-1.png)

```
Max number of 400 infected reached on day 136
```

Graphs for Numerical Solution (Cont.)
========================================================

![plot of chunk unnamed-chunk-8](FinalProjectProgressReportJohnsonClayton-figure/unnamed-chunk-8-1.png)

```
Max value reached on day 139
```

Discussion of Results
========================================================

### Observations
We can see the population of infected reaches a maximum of 400 on the 136th day, whereas the maximum bacteria count is reached three days later!  

### Discussion
Why is this? 

Calculating Cholera's Basic Reproduction Number
========================================================
Here, we will calculate Cholera's $R_0$.

Extensions
========================================================
 1. Waning Immunity  
 2. Endemic Cholera Model  
 3. Multi-stage Infection Model


References
========================================================
 [1] https://www.cdc.gov/cholera/index.html    
