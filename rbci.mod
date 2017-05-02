close all
// Simple RBC Model 

var y,c,i,k,n,A,lambda omega; 
varexo e;

parameters alpha, beta, delta, rho, psi, sigmae, q;

alpha   = 0.33;
beta    = 0.984;
delta   = 0.025;
rho     = 0.97; 
sigmae  = 0.0072;
psi     = 3.48; 
q       = 4.5; 


model;
// Equation 1 FOC for c 
1/exp(c)             = exp(lambda);
// Equation 2 FOC for labour
psi/(1-exp(n))       = exp(lambda)*(1-alpha)*(exp(y)/exp(n));
// Equation 3 FOC for capital 
exp(omega)           = exp(lambda(+1))*beta + beta*exp(omega(+1))*(1-delta);
// Equation 4
exp(y)               = exp(A)*(exp(k(-1))^(alpha))*exp(n)^(1-alpha);
// Equation 5
A                    = rho*A(-1) + e;
// Equation 6
exp(y)               = exp(i) + exp(c);
// Equation 7
exp(i)*(1-(q/2)*((exp(i)/exp(i(-1)))-1)^2)  = exp(k)  - (1-delta)*exp(k(-1));
// Equation 8
exp(lambda)          = exp(omega)*(1- (q/2)*((exp(i)/exp(i(-1))-1) -1)^2 - q*((exp(i)/exp(i(-1)) -1)*(exp(i)/exp(i(-1))))) + beta*exp(omega(+1))*(q*(exp(i(+1))/exp(i) -1)*(exp(exp(i(+1))/exp(i)))^2);
end;


initval;
c = log(2.5);
y = log(3);
k = log(28); 
A = 0 ;
n = log(0.8);
i = log(1.5);
omega  = log(0.5);
end;

shocks;
var e =  sigmae^2;
end;

steady; 

stoch_simul;
