close all
% IAC RBC Model 

var y,c,i,k,n,A,lambda,omega,q; 
varexo e;

parameters alpha, beta, delta, rho, psi, sigmae, phi;

alpha   = 0.35;
beta    = 0.97;
delta   = 0.06;
rho     = 0.95; 
sigmae  = 0.01;
psi     = 1;  
phi     = 500; 

model;

% IAC Model;

% Equation 1: FOC for C
1/exp(c) = exp(lambda);

% Equation 2: FOC for N
psi/(1-exp(n)) = exp(lambda)*(1-alpha)*(exp(y)/exp(n));

% Equation 3: Law of Motion for TFP Shocks
A = rho * A(-1) + e;

% Equation 4: Production Function
exp(y)= exp(A)*(exp(k(-1))^alpha)*exp(n)^(1-alpha);

% Equation 5: Resource Constraint
exp(y) = exp(c) + exp(i); 

% Equation 6: Law of Motion for Capital Accumulation (Penalized)
exp(k) = exp(i) - (phi/2)*exp(i)*((exp(i)/exp(i(-1))) -1)^2 + (1-delta)*exp(k(-1)) ;

% Equation 7: FOC for K
exp(omega) = beta*exp(lambda(+1))*(alpha*(exp(y(+1))/exp(k)))+beta*exp(omega(+1))*(1-delta);

% Equation 8: FOC for I
exp(lambda) = exp(omega)-exp(omega)*(phi/2)*((exp(i)/exp(i(-1))-1)^2)-exp(omega)*phi*( (exp(i)/exp(i(-1))) -1  )* (exp(i)/exp(i(-1))) + beta*exp(omega(+1))*phi*((exp(i(+1))/exp(i))-1)*((exp(i(+1))/exp(i))^2);

exp(q)=exp(omega)/exp(lambda);

end;


initval;
c = log(2.5);
y = log(3);
k = log(28); 
A = 0 ;
n = log(0.8);
i = log(1.5);
omega  = log(0.5);
lambda = log(2);
end;

shocks;
var e =  sigmae^2;
end;

steady; 

stoch_simul;
