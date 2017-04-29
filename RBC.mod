close all
// Simple RBC Model 

var y,c,i,k,n,A; 
varexo e;

parameters alpha, beta, delta, rho, psi, sigmae;

alpha   = 0.33;
beta    = 0.99;
delta   = 0.025;
rho     = 0.95; 
sigmae  = 0.01;
psi     = 1; 

model;
1/exp(c)        =  beta*(1/exp(c(+1)))*(alpha*exp(A(+1))*exp(k)^(alpha-1)*exp(n(+1))^(1-alpha) + (1-delta));
psi/(1-exp(n))   =  (1/exp(c))  * ((1-alpha)*exp(A)*exp(k)^(alpha)*exp(n)^(-alpha));
exp(y)          = exp(A)*(exp(k(-1))^(alpha))*exp(n)^(1-alpha);
exp(y)          = exp(c) + exp(k)  - (1-delta)*exp(k(-1));
A               = rho*A(-1) + e;
exp(i)          = exp(k)  - (1-delta)*exp(k(-1));
end;

initval;
c = log(2.5);
y = log(3);
k = log(28); 
A = 0 ;
n = log(0.8);
i = log(1.5);
end;

shocks;
var e =  sigmae^2;
end;

steady; 
3
stoch_simul;

