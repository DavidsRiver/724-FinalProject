function [residual, g1, g2, g3] = rbci_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T46 = exp(y(9))*exp(y(2))^params(1);
T47 = exp(y(8))^(1-params(1));
T48 = T46*T47;
T61 = params(7)/2;
T64 = exp(y(6))/exp(y(1));
T65 = T64-1;
T69 = exp(y(6))*(1-T61*T65^2);
T82 = exp(y(11))*(1-T61*(T65-1)^2-params(7)*T64*T65);
T85 = exp(y(12))/exp(y(6));
T88 = exp(T85);
T89 = T88^2;
T94 = (-(exp(y(10))*(1-params(1))*exp(y(4))/exp(y(8))));
T101 = (-(exp(y(6))*exp(y(1))))/(exp(y(1))*exp(y(1)));
T135 = (-(exp(y(6))*exp(y(12))))/(exp(y(6))*exp(y(6)));
T156 = exp(y(9))*exp(y(2))*getPowerDeriv(exp(y(2)),params(1),1);
T170 = exp(y(10))*(1-params(1))*(-(exp(y(8))*exp(y(4))))/(exp(y(8))*exp(y(8)));
T173 = exp(y(8))*getPowerDeriv(exp(y(8)),1-params(1),1);
T225 = ((-(exp(y(6))*exp(y(1))))*exp(y(1))*exp(y(1))-(-(exp(y(6))*exp(y(1))))*(exp(y(1))*exp(y(1))+exp(y(1))*exp(y(1))))/(exp(y(1))*exp(y(1))*exp(y(1))*exp(y(1)));
T283 = ((-(exp(y(6))*exp(y(12))))*exp(y(6))*exp(y(6))-(-(exp(y(6))*exp(y(12))))*(exp(y(6))*exp(y(6))+exp(y(6))*exp(y(6))))/(exp(y(6))*exp(y(6))*exp(y(6))*exp(y(6)));
lhs =1/exp(y(5));
rhs =exp(y(10));
residual(1)= lhs-rhs;
lhs =params(5)/(1-exp(y(8)));
rhs =exp(y(10))*(1-params(1))*exp(y(4))/exp(y(8));
residual(2)= lhs-rhs;
lhs =exp(y(11));
rhs =exp(y(13))*params(2)+params(2)*exp(y(14))*(1-params(3));
residual(3)= lhs-rhs;
lhs =exp(y(4));
rhs =T48;
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(4)*y(3)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =exp(y(4));
rhs =exp(y(5))+exp(y(6));
residual(6)= lhs-rhs;
lhs =T69;
rhs =exp(y(7))-(1-params(3))*exp(y(2));
residual(7)= lhs-rhs;
lhs =exp(y(10));
rhs =T82+params(2)*exp(y(14))*params(7)*(T85-1)*T89;
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 15);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-exp(y(5)))/(exp(y(5))*exp(y(5)));
  g1(1,10)=(-exp(y(10)));
  g1(2,4)=T94;
  g1(2,8)=(-(params(5)*(-exp(y(8)))))/((1-exp(y(8)))*(1-exp(y(8))))-T170;
  g1(2,10)=T94;
  g1(3,13)=(-(exp(y(13))*params(2)));
  g1(3,11)=exp(y(11));
  g1(3,14)=(-(params(2)*exp(y(14))*(1-params(3))));
  g1(4,4)=exp(y(4));
  g1(4,2)=(-(T47*T156));
  g1(4,8)=(-(T46*T173));
  g1(4,9)=(-T48);
  g1(5,3)=(-params(4));
  g1(5,9)=1;
  g1(5,15)=(-1);
  g1(6,4)=exp(y(4));
  g1(6,5)=(-exp(y(5)));
  g1(6,6)=(-exp(y(6)));
  g1(7,1)=exp(y(6))*(-(T61*T101*2*T65));
  g1(7,6)=T69+exp(y(6))*(-(T61*T64*2*T65));
  g1(7,2)=(1-params(3))*exp(y(2));
  g1(7,7)=(-exp(y(7)));
  g1(8,1)=(-(exp(y(11))*((-(T61*T101*2*(T65-1)))-params(7)*(T65*T101+T64*T101))));
  g1(8,6)=(-(exp(y(11))*((-(T61*T64*2*(T65-1)))-params(7)*(T64*T65+T64*T64))+params(2)*exp(y(14))*(T89*params(7)*T135+params(7)*(T85-1)*T88*T135*2*T88)));
  g1(8,12)=(-(params(2)*exp(y(14))*(T89*params(7)*T85+params(7)*(T85-1)*2*T88*T85*T88)));
  g1(8,10)=exp(y(10));
  g1(8,11)=(-T82);
  g1(8,14)=(-(params(2)*exp(y(14))*params(7)*(T85-1)*T89));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(51,3);
  v2(1,1)=1;
  v2(1,2)=65;
  v2(1,3)=((-exp(y(5)))*exp(y(5))*exp(y(5))-(-exp(y(5)))*(exp(y(5))*exp(y(5))+exp(y(5))*exp(y(5))))/(exp(y(5))*exp(y(5))*exp(y(5))*exp(y(5)));
  v2(2,1)=1;
  v2(2,2)=145;
  v2(2,3)=(-exp(y(10)));
  v2(3,1)=2;
  v2(3,2)=49;
  v2(3,3)=T94;
  v2(4,1)=2;
  v2(4,2)=109;
  v2(4,3)=(-T170);
  v2(5,1)=2;
  v2(5,2)=53;
  v2(5,3)=  v2(4,3);
  v2(6,1)=2;
  v2(6,2)=113;
  v2(6,3)=((-(params(5)*(-exp(y(8)))))*(1-exp(y(8)))*(1-exp(y(8)))-(-(params(5)*(-exp(y(8)))))*((1-exp(y(8)))*(-exp(y(8)))+(1-exp(y(8)))*(-exp(y(8)))))/((1-exp(y(8)))*(1-exp(y(8)))*(1-exp(y(8)))*(1-exp(y(8))))-exp(y(10))*(1-params(1))*((-(exp(y(8))*exp(y(4))))*exp(y(8))*exp(y(8))-(-(exp(y(8))*exp(y(4))))*(exp(y(8))*exp(y(8))+exp(y(8))*exp(y(8))))/(exp(y(8))*exp(y(8))*exp(y(8))*exp(y(8)));
  v2(7,1)=2;
  v2(7,2)=139;
  v2(7,3)=T94;
  v2(8,1)=2;
  v2(8,2)=55;
  v2(8,3)=  v2(7,3);
  v2(9,1)=2;
  v2(9,2)=143;
  v2(9,3)=(-T170);
  v2(10,1)=2;
  v2(10,2)=115;
  v2(10,3)=  v2(9,3);
  v2(11,1)=2;
  v2(11,2)=145;
  v2(11,3)=T94;
  v2(12,1)=3;
  v2(12,2)=193;
  v2(12,3)=(-(exp(y(13))*params(2)));
  v2(13,1)=3;
  v2(13,2)=161;
  v2(13,3)=exp(y(11));
  v2(14,1)=3;
  v2(14,2)=209;
  v2(14,3)=(-(params(2)*exp(y(14))*(1-params(3))));
  v2(15,1)=4;
  v2(15,2)=49;
  v2(15,3)=exp(y(4));
  v2(16,1)=4;
  v2(16,2)=17;
  v2(16,3)=(-(T47*exp(y(9))*(exp(y(2))*getPowerDeriv(exp(y(2)),params(1),1)+exp(y(2))*exp(y(2))*getPowerDeriv(exp(y(2)),params(1),2))));
  v2(17,1)=4;
  v2(17,2)=107;
  v2(17,3)=(-(T156*T173));
  v2(18,1)=4;
  v2(18,2)=23;
  v2(18,3)=  v2(17,3);
  v2(19,1)=4;
  v2(19,2)=113;
  v2(19,3)=(-(T46*(T173+exp(y(8))*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(1),2))));
  v2(20,1)=4;
  v2(20,2)=122;
  v2(20,3)=(-(T47*T156));
  v2(21,1)=4;
  v2(21,2)=24;
  v2(21,3)=  v2(20,3);
  v2(22,1)=4;
  v2(22,2)=128;
  v2(22,3)=(-(T46*T173));
  v2(23,1)=4;
  v2(23,2)=114;
  v2(23,3)=  v2(22,3);
  v2(24,1)=4;
  v2(24,2)=129;
  v2(24,3)=(-T48);
  v2(25,1)=6;
  v2(25,2)=49;
  v2(25,3)=exp(y(4));
  v2(26,1)=6;
  v2(26,2)=65;
  v2(26,3)=(-exp(y(5)));
  v2(27,1)=6;
  v2(27,2)=81;
  v2(27,3)=(-exp(y(6)));
  v2(28,1)=7;
  v2(28,2)=1;
  v2(28,3)=exp(y(6))*(-(T61*(2*T65*T225+T101*2*T101)));
  v2(29,1)=7;
  v2(29,2)=76;
  v2(29,3)=exp(y(6))*(-(T61*T101*2*T65))+exp(y(6))*(-(T61*(T101*2*T65+T64*2*T101)));
  v2(30,1)=7;
  v2(30,2)=6;
  v2(30,3)=  v2(29,3);
  v2(31,1)=7;
  v2(31,2)=81;
  v2(31,3)=T69+exp(y(6))*(-(T61*T64*2*T65))+exp(y(6))*(-(T61*T64*2*T65))+exp(y(6))*(-(T61*(T64*2*T65+T64*2*T64)));
  v2(32,1)=7;
  v2(32,2)=17;
  v2(32,3)=(1-params(3))*exp(y(2));
  v2(33,1)=7;
  v2(33,2)=97;
  v2(33,3)=(-exp(y(7)));
  v2(34,1)=8;
  v2(34,2)=1;
  v2(34,3)=(-(exp(y(11))*((-(T61*(T101*2*T101+2*(T65-1)*T225)))-params(7)*(T101*T101+T65*T225+T101*T101+T64*T225))));
  v2(35,1)=8;
  v2(35,2)=76;
  v2(35,3)=(-(exp(y(11))*((-(T61*(T101*2*(T65-1)+T64*2*T101)))-params(7)*(T65*T101+T64*T101+T64*T101+T64*T101))));
  v2(36,1)=8;
  v2(36,2)=6;
  v2(36,3)=  v2(35,3);
  v2(37,1)=8;
  v2(37,2)=81;
  v2(37,3)=(-(exp(y(11))*((-(T61*(T64*2*(T65-1)+T64*2*T64)))-params(7)*(T64*T65+T64*T64+T64*T64+T64*T64))+params(2)*exp(y(14))*(params(7)*T135*T88*T135*2*T88+T89*params(7)*T283+params(7)*T135*T88*T135*2*T88+params(7)*(T85-1)*(2*T88*(T135*T88*T135+T88*T283)+T88*T135*2*T88*T135))));
  v2(38,1)=8;
  v2(38,2)=171;
  v2(38,3)=(-(params(2)*exp(y(14))*(T89*params(7)*T135+T88*T135*2*T88*params(7)*T85+params(7)*T135*2*T88*T85*T88+params(7)*(T85-1)*(T85*T88*2*T88*T135+2*T88*(T88*T135+T85*T88*T135)))));
  v2(39,1)=8;
  v2(39,2)=87;
  v2(39,3)=  v2(38,3);
  v2(40,1)=8;
  v2(40,2)=177;
  v2(40,3)=(-(params(2)*exp(y(14))*(T89*params(7)*T85+params(7)*T85*2*T88*T85*T88+params(7)*T85*2*T88*T85*T88+params(7)*(T85-1)*(T85*T88*2*T85*T88+2*T88*(T85*T88+T85*T85*T88)))));
  v2(41,1)=8;
  v2(41,2)=145;
  v2(41,3)=exp(y(10));
  v2(42,1)=8;
  v2(42,2)=151;
  v2(42,3)=(-(exp(y(11))*((-(T61*T101*2*(T65-1)))-params(7)*(T65*T101+T64*T101))));
  v2(43,1)=8;
  v2(43,2)=11;
  v2(43,3)=  v2(42,3);
  v2(44,1)=8;
  v2(44,2)=156;
  v2(44,3)=(-(exp(y(11))*((-(T61*T64*2*(T65-1)))-params(7)*(T64*T65+T64*T64))));
  v2(45,1)=8;
  v2(45,2)=86;
  v2(45,3)=  v2(44,3);
  v2(46,1)=8;
  v2(46,2)=161;
  v2(46,3)=(-T82);
  v2(47,1)=8;
  v2(47,2)=201;
  v2(47,3)=(-(params(2)*exp(y(14))*(T89*params(7)*T135+params(7)*(T85-1)*T88*T135*2*T88)));
  v2(48,1)=8;
  v2(48,2)=89;
  v2(48,3)=  v2(47,3);
  v2(49,1)=8;
  v2(49,2)=207;
  v2(49,3)=(-(params(2)*exp(y(14))*(T89*params(7)*T85+params(7)*(T85-1)*2*T88*T85*T88)));
  v2(50,1)=8;
  v2(50,2)=179;
  v2(50,3)=  v2(49,3);
  v2(51,1)=8;
  v2(51,2)=209;
  v2(51,3)=(-(params(2)*exp(y(14))*params(7)*(T85-1)*T89));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,3375);
end
end
