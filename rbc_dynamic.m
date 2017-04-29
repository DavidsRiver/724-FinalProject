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
T24 = params(1)*exp(y(11))*exp(y(6))^(params(1)-1);
T28 = exp(y(10))^(1-params(1));
T29 = T24*T28;
T32 = T29+1-params(3);
T44 = (1-params(1))*exp(y(8))*exp(y(6))^params(1);
T46 = exp(y(7))^(-params(1));
T47 = T44*T46;
T55 = exp(y(8))*exp(y(1))^params(1);
T56 = exp(y(7))^(1-params(1));
T57 = T55*T56;
T75 = (-exp(y(4)))/(exp(y(4))*exp(y(4)));
T81 = params(2)*(-exp(y(9)))/(exp(y(9))*exp(y(9)));
T86 = exp(y(8))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1),1);
T92 = params(1)*exp(y(11))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1)-1,1);
T93 = T28*T92;
T98 = (1-params(1))*exp(y(8))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1),1);
T99 = T46*T98;
T109 = exp(y(7))*getPowerDeriv(exp(y(7)),(-params(1)),1);
T110 = T44*T109;
T114 = exp(y(7))*getPowerDeriv(exp(y(7)),1-params(1),1);
T118 = exp(y(10))*getPowerDeriv(exp(y(10)),1-params(1),1);
T119 = T24*T118;
T132 = ((-exp(y(4)))*exp(y(4))*exp(y(4))-(-exp(y(4)))*(exp(y(4))*exp(y(4))+exp(y(4))*exp(y(4))))/(exp(y(4))*exp(y(4))*exp(y(4))*exp(y(4)));
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

  g1(1,4)=T75;
  g1(1,9)=(-(T32*T81));
  g1(1,6)=(-(T15*T93));
  g1(1,10)=(-(T15*T119));
  g1(1,11)=(-(T15*T29));
  g1(2,4)=(-(T47*T75));
  g1(2,6)=(-(T10*T99));
  g1(2,7)=(-(params(5)*(-exp(y(7)))))/((1-exp(y(7)))*(1-exp(y(7))))-T10*T110;
  g1(2,8)=(-(T10*T47));
  g1(3,3)=exp(y(3));
  g1(3,1)=(-(T56*T86));
  g1(3,7)=(-(T55*T114));
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

  v2 = zeros(50,3);
  v2(1,1)=1;
  v2(1,2)=40;
  v2(1,3)=T132;
  v2(2,1)=1;
  v2(2,2)=105;
  v2(2,3)=(-(T32*params(2)*((-exp(y(9)))*exp(y(9))*exp(y(9))-(-exp(y(9)))*(exp(y(9))*exp(y(9))+exp(y(9))*exp(y(9))))/(exp(y(9))*exp(y(9))*exp(y(9))*exp(y(9)))));
  v2(3,1)=1;
  v2(3,2)=69;
  v2(3,3)=(-(T81*T93));
  v2(4,1)=1;
  v2(4,2)=102;
  v2(4,3)=  v2(3,3);
  v2(5,1)=1;
  v2(5,2)=66;
  v2(5,3)=(-(T15*T28*params(1)*exp(y(11))*(exp(y(6))*getPowerDeriv(exp(y(6)),params(1)-1,1)+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1)-1,2))));
  v2(6,1)=1;
  v2(6,2)=117;
  v2(6,3)=(-(T81*T119));
  v2(7,1)=1;
  v2(7,2)=106;
  v2(7,3)=  v2(6,3);
  v2(8,1)=1;
  v2(8,2)=114;
  v2(8,3)=(-(T15*T92*T118));
  v2(9,1)=1;
  v2(9,2)=70;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=118;
  v2(10,3)=(-(T15*T24*(T118+exp(y(10))*exp(y(10))*getPowerDeriv(exp(y(10)),1-params(1),2))));
  v2(11,1)=1;
  v2(11,2)=129;
  v2(11,3)=(-(T29*T81));
  v2(12,1)=1;
  v2(12,2)=107;
  v2(12,3)=  v2(11,3);
  v2(13,1)=1;
  v2(13,2)=126;
  v2(13,3)=(-(T15*T93));
  v2(14,1)=1;
  v2(14,2)=71;
  v2(14,3)=  v2(13,3);
  v2(15,1)=1;
  v2(15,2)=130;
  v2(15,3)=(-(T15*T119));
  v2(16,1)=1;
  v2(16,2)=119;
  v2(16,3)=  v2(15,3);
  v2(17,1)=1;
  v2(17,2)=131;
  v2(17,3)=(-(T15*T29));
  v2(18,1)=2;
  v2(18,2)=40;
  v2(18,3)=(-(T47*T132));
  v2(19,1)=2;
  v2(19,2)=64;
  v2(19,3)=(-(T75*T99));
  v2(20,1)=2;
  v2(20,2)=42;
  v2(20,3)=  v2(19,3);
  v2(21,1)=2;
  v2(21,2)=66;
  v2(21,3)=(-(T10*T46*(1-params(1))*exp(y(8))*(exp(y(6))*getPowerDeriv(exp(y(6)),params(1),1)+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),params(1),2))));
  v2(22,1)=2;
  v2(22,2)=76;
  v2(22,3)=(-(T75*T110));
  v2(23,1)=2;
  v2(23,2)=43;
  v2(23,3)=  v2(22,3);
  v2(24,1)=2;
  v2(24,2)=78;
  v2(24,3)=(-(T10*T98*T109));
  v2(25,1)=2;
  v2(25,2)=67;
  v2(25,3)=  v2(24,3);
  v2(26,1)=2;
  v2(26,2)=79;
  v2(26,3)=((-(params(5)*(-exp(y(7)))))*(1-exp(y(7)))*(1-exp(y(7)))-(-(params(5)*(-exp(y(7)))))*((1-exp(y(7)))*(-exp(y(7)))+(1-exp(y(7)))*(-exp(y(7)))))/((1-exp(y(7)))*(1-exp(y(7)))*(1-exp(y(7)))*(1-exp(y(7))))-T10*T44*(T109+exp(y(7))*exp(y(7))*getPowerDeriv(exp(y(7)),(-params(1)),2));
  v2(27,1)=2;
  v2(27,2)=88;
  v2(27,3)=(-(T47*T75));
  v2(28,1)=2;
  v2(28,2)=44;
  v2(28,3)=  v2(27,3);
  v2(29,1)=2;
  v2(29,2)=90;
  v2(29,3)=(-(T10*T99));
  v2(30,1)=2;
  v2(30,2)=68;
  v2(30,3)=  v2(29,3);
  v2(31,1)=2;
  v2(31,2)=91;
  v2(31,3)=(-(T10*T110));
  v2(32,1)=2;
  v2(32,2)=80;
  v2(32,3)=  v2(31,3);
  v2(33,1)=2;
  v2(33,2)=92;
  v2(33,3)=(-(T10*T47));
  v2(34,1)=3;
  v2(34,2)=27;
  v2(34,3)=exp(y(3));
  v2(35,1)=3;
  v2(35,2)=1;
  v2(35,3)=(-(T56*exp(y(8))*(exp(y(1))*getPowerDeriv(exp(y(1)),params(1),1)+exp(y(1))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1),2))));
  v2(36,1)=3;
  v2(36,2)=73;
  v2(36,3)=(-(T86*T114));
  v2(37,1)=3;
  v2(37,2)=7;
  v2(37,3)=  v2(36,3);
  v2(38,1)=3;
  v2(38,2)=79;
  v2(38,3)=(-(T55*(T114+exp(y(7))*exp(y(7))*getPowerDeriv(exp(y(7)),1-params(1),2))));
  v2(39,1)=3;
  v2(39,2)=85;
  v2(39,3)=(-(T56*T86));
  v2(40,1)=3;
  v2(40,2)=8;
  v2(40,3)=  v2(39,3);
  v2(41,1)=3;
  v2(41,2)=91;
  v2(41,3)=(-(T55*T114));
  v2(42,1)=3;
  v2(42,2)=80;
  v2(42,3)=  v2(41,3);
  v2(43,1)=3;
  v2(43,2)=92;
  v2(43,3)=(-T57);
  v2(44,1)=4;
  v2(44,2)=27;
  v2(44,3)=exp(y(3));
  v2(45,1)=4;
  v2(45,2)=40;
  v2(45,3)=(-exp(y(4)));
  v2(46,1)=4;
  v2(46,2)=1;
  v2(46,3)=(1-params(3))*exp(y(1));
  v2(47,1)=4;
  v2(47,2)=66;
  v2(47,3)=(-exp(y(6)));
  v2(48,1)=6;
  v2(48,2)=53;
  v2(48,3)=exp(y(5));
  v2(49,1)=6;
  v2(49,2)=1;
  v2(49,3)=(1-params(3))*exp(y(1));
  v2(50,1)=6;
  v2(50,2)=66;
  v2(50,3)=(-exp(y(6)));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,144);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,1728);
end
end
