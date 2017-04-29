function [residual, g1, g2] = rbc_static(y, x, params)
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

residual = zeros( 6, 1);

%
% Model equations
%

T10 = 1/exp(y(2));
T12 = T10*params(2);
T25 = exp(y(5))^(1-params(1));
T26 = params(1)*exp(y(6))*exp(y(4))^(params(1)-1)*T25;
T29 = T26+1-params(3);
T40 = exp(y(6))*(1-params(1))*exp(y(4))^params(1)*exp(y(5))^(-params(1));
T63 = (-exp(y(2)))/(exp(y(2))*exp(y(2)));
lhs =T10;
rhs =T12*T29;
residual(1)= lhs-rhs;
lhs =params(5)/(1-exp(y(5)));
rhs =T10*T40;
residual(2)= lhs-rhs;
lhs =exp(y(1));
rhs =T25*exp(y(6))*exp(y(4))^params(1);
residual(3)= lhs-rhs;
lhs =exp(y(1));
rhs =exp(y(2))+exp(y(4))-exp(y(4))*(1-params(3));
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(4)+x(1);
residual(5)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(4))-exp(y(4))*(1-params(3));
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

  g1(1,2)=T63-T29*params(2)*T63;
  g1(1,4)=(-(T12*T25*params(1)*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1)-1,1)));
  g1(1,5)=(-(T12*params(1)*exp(y(6))*exp(y(4))^(params(1)-1)*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(1),1)));
  g1(1,6)=(-(T12*T26));
  g1(2,2)=(-(T40*T63));
  g1(2,4)=(-(T10*exp(y(5))^(-params(1))*exp(y(6))*(1-params(1))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1),1)));
  g1(2,5)=(-(params(5)*(-exp(y(5)))))/((1-exp(y(5)))*(1-exp(y(5))))-T10*exp(y(6))*(1-params(1))*exp(y(4))^params(1)*exp(y(5))*getPowerDeriv(exp(y(5)),(-params(1)),1);
  g1(2,6)=(-(T10*T40));
  g1(3,1)=exp(y(1));
  g1(3,4)=(-(T25*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1),1)));
  g1(3,5)=(-(exp(y(6))*exp(y(4))^params(1)*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(1),1)));
  g1(3,6)=(-(T25*exp(y(6))*exp(y(4))^params(1)));
  g1(4,1)=exp(y(1));
  g1(4,2)=(-exp(y(2)));
  g1(4,4)=(-(exp(y(4))-exp(y(4))*(1-params(3))));
  g1(5,6)=1-params(4);
  g1(6,3)=exp(y(3));
  g1(6,4)=(-(exp(y(4))-exp(y(4))*(1-params(3))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
end
end
