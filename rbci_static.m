function [residual, g1, g2] = rbci_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

T44 = exp(y(6))*exp(y(4))^params(1)*exp(y(5))^(1-params(1));
T65 = (-(exp(y(7))*(1-params(1))*exp(y(1))/exp(y(5))));
lhs =1/exp(y(2));
rhs =exp(y(7));
residual(1)= lhs-rhs;
lhs =params(5)/(1-exp(y(5)));
rhs =exp(y(7))*(1-params(1))*exp(y(1))/exp(y(5));
residual(2)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(7))*params(2)+exp(y(8))*params(2)*(1-params(3));
residual(3)= lhs-rhs;
lhs =exp(y(1));
rhs =T44;
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(4)+x(1);
residual(5)= lhs-rhs;
lhs =exp(y(1));
rhs =exp(y(2))+exp(y(3));
residual(6)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(4))-(1-params(3))*exp(y(4));
residual(7)= lhs-rhs;
lhs =exp(y(7));
rhs =exp(y(8))*(1-params(7)/2);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-exp(y(2)))/(exp(y(2))*exp(y(2)));
  g1(1,7)=(-exp(y(7)));
  g1(2,1)=T65;
  g1(2,5)=(-(params(5)*(-exp(y(5)))))/((1-exp(y(5)))*(1-exp(y(5))))-exp(y(7))*(1-params(1))*(-(exp(y(5))*exp(y(1))))/(exp(y(5))*exp(y(5)));
  g1(2,7)=T65;
  g1(3,7)=(-(exp(y(7))*params(2)));
  g1(3,8)=exp(y(8))-exp(y(8))*params(2)*(1-params(3));
  g1(4,1)=exp(y(1));
  g1(4,4)=(-(exp(y(5))^(1-params(1))*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1),1)));
  g1(4,5)=(-(exp(y(6))*exp(y(4))^params(1)*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(1),1)));
  g1(4,6)=(-T44);
  g1(5,6)=1-params(4);
  g1(6,1)=exp(y(1));
  g1(6,2)=(-exp(y(2)));
  g1(6,3)=(-exp(y(3)));
  g1(7,3)=exp(y(3));
  g1(7,4)=(-(exp(y(4))-(1-params(3))*exp(y(4))));
  g1(8,7)=exp(y(7));
  g1(8,8)=(-(exp(y(8))*(1-params(7)/2)));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
end
end
