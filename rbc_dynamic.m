function [residual, g1, g2, g3] = rbc_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(6, 1);
T10 = 1/exp(y(4));
T15 = params(2)*1/exp(y(9));
T29 = params(1)*exp(y(11))*exp(y(6))^(params(1)-1)*exp(y(10))^(1-params(1));
T32 = T29+1-params(3);
T47 = (1-params(1))*exp(y(8))*exp(y(6))^params(1)*exp(y(7))^(-params(1));
T57 = exp(y(8))*exp(y(1))^params(1)*exp(y(7))^(1-params(1));
lhs =T10;
rhs =T15*T32;
residual(1)= lhs-rhs;
lhs =params(5)/(1-exp(y(7)));
rhs =T10*T47;
residual(2)= lhs-rhs;
lhs =exp(y(3));
rhs =T57;
residual(3)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(4))+exp(y(6))-(1-params(3))*exp(y(1));
residual(4)= lhs-rhs;
lhs =y(8);
rhs =params(4)*y(2)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(6))-(1-params(3))*exp(y(1));
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 12);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-exp(y(4)))/(exp(y(4))*exp(y(4)));
  g1(1,9)=(-(T32*params(2)*(-exp(y(9)))/(exp(y(9))*exp(y(9)))));
  g1(1,6)=(-(T15*exp(y(10))^(1-params(1))*params(1)*exp(y(11))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1)-1,1)));
  g1(1,10)=(-(T15*params(1)*exp(y(11))*exp(y(6))^(params(1)-1)*exp(y(10))*getPowerDeriv(exp(y(10)),1-params(1),1)));
  g1(1,11)=(-(T15*T29));
  g1(2,4)=(-(T47*(-exp(y(4)))/(exp(y(4))*exp(y(4)))));
  g1(2,6)=(-(T10*exp(y(7))^(-params(1))*(1-params(1))*exp(y(8))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1),1)));
  g1(2,7)=(-(params(5)*(-exp(y(7)))))/((1-exp(y(7)))*(1-exp(y(7))))-T10*(1-params(1))*exp(y(8))*exp(y(6))^params(1)*exp(y(7))*getPowerDeriv(exp(y(7)),(-params(1)),1);
  g1(2,8)=(-(T10*T47));
  g1(3,3)=exp(y(3));
  g1(3,1)=(-(exp(y(7))^(1-params(1))*exp(y(8))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1),1)));
  g1(3,7)=(-(exp(y(8))*exp(y(1))^params(1)*exp(y(7))*getPowerDeriv(exp(y(7)),1-params(1),1)));
  g1(3,8)=(-T57);
  g1(4,3)=exp(y(3));
  g1(4,4)=(-exp(y(4)));
  g1(4,1)=(1-params(3))*exp(y(1));
  g1(4,6)=(-exp(y(6)));
  g1(5,2)=(-params(4));
  g1(5,8)=1;
  g1(5,12)=(-1);
  g1(6,5)=exp(y(5));
  g1(6,1)=(1-params(3))*exp(y(1));
  g1(6,6)=(-exp(y(6)));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,144);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
