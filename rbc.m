%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'rbc';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'sigmae');
M_.param_names_tex = char(M_.param_names_tex, 'sigmae');
M_.param_names_long = char(M_.param_names_long, 'sigmae');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 6;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('rbc_static');
erase_compiled_function('rbc_dynamic');
M_.lead_lag_incidence = [
 0 3 0;
 0 4 9;
 0 5 0;
 1 6 0;
 0 7 10;
 2 8 11;]';
M_.nstatic = 2;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 23;
M_.NNZDerivatives(2) = 50;
M_.NNZDerivatives(3) = -1;
close all
M_.params( 1 ) = 0.4;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.9;
beta = M_.params( 2 );
M_.params( 3 ) = 0.02;
delta = M_.params( 3 );
M_.params( 4 ) = 0.8;
rho = M_.params( 4 );
M_.params( 6 ) = 0.09;
sigmae = M_.params( 6 );
M_.params( 5 ) = 0.75;
psi = M_.params( 5 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0.9162907318741551;
oo_.steady_state( 1 ) = 1.09861228866811;
oo_.steady_state( 4 ) = 3.332204510175204;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 5 ) = (-0.2231435513142097);
oo_.steady_state( 3 ) = 0.4054651081081644;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(6)^2;
steady;
3
var_list_=[];
info = stoch_simul(var_list_);
save('rbc_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
