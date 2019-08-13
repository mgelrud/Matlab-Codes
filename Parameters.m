%%
% ------------------------------------------------------------------------
%  Parameters
% ------------------------------------------------------------------------

% Preferences

beta = 0.012; % from Wachter (2013)
%gamma = [0.8 0.9 1 1.5 2 3 4 5];
%gamma = [5 6 7 10 12 15 17 20];
gamma = [0.8 3];

% Consumption

mu = 0.0252; % from Wachter (2013)
sigma = 0.02; % from Wachter (2013)
C_0 = 1; % scale consumption to time t=0
%phi = 5; % from Bansal and Yaron (2004)
%phi = 2.6; % from Wachter (2013)
phi = 1.2; % arbitrary such that b_bar < 0 and a < 0 for all gammas (the latter is stricter)

Z = 0.1; % assume the disaster size is 30%
exp_mZ = exp(- Z) - 1;
exp_gammaZ = exp(gamma .* Z) - 1;
exp_gammam1Z = exp((gamma - 1) .* Z) - 1;
exp_gammamphiZ = exp((gamma - phi) .* Z) - 1;
exp_mphiZ = exp( - phi .* Z) - 1;

exp_mZ_sqrt = (exp(- Z) - 1) .^ 2;


%mu_Z = - 0.1; % assume the disaster size is 10%
%sigma_Z = 0; % for simplicity assume Z is constant
%Z_spread = 0.02; % the spread of Z around mu_Z s.t. 95% is inside
%sigma_Z = Z_spread / 2 / 1.96; % assume Z is normal - needed to make F_D and S_C ratio differ
%exp_Z = exp(mu_Z + 0.5 .* sigma_Z^2) - 1;
%exp_mgammaZ = exp(- gamma .* mu_Z + 0.5 .* gamma .^ 2 .* sigma_Z .^ 2) - 1;
%exp_1mgammaZ = exp((1 - gamma) .* mu_Z + 0.5 .* (1 - gamma) .^ 2 .* sigma_Z .^ 2) - 1;
%exp_phimgammaZ = exp((phi - gamma) .* mu_Z + 0.5 .* (phi - gamma) .^ 2 .* sigma_Z .^ 2) - 1;
%exp_phiZ = exp(phi .* mu_Z + 0.5 .* phi .^ 2 .* sigma_Z .^ 2) - 1;

% Temperature

lambda_min = 0.01; % ???
lambda_max = 0.05; % ???
T_tilde = 1.5; % from climate science
T_0 = 0.1; % such that t=0 is about the 1930s
mu_T = 0.026; % such that T(0) = 0.1 and T(80) = 0.8 fit the T(t) function (t = 80 is 2010)

lambda_const = lambda_min / log(T_tilde); % formula

% Time

dt = 1/12; % time step (in years)
t_max = 200; % the terminal date (in years)
timeline = [0 : dt : t_max]';
time_years = [1930 : dt : 1930 + t_max]';
n = length(timeline); % # of time periods

t_tilde = (log(T_tilde) - log(T_0)) ./ mu_T; % formula
n_tilde = ceil(t_tilde ./ dt) + 1; % the nearest time point from above
t_tilde = timeline(n_tilde); % increase to match the nearest time point
t_bar = 1 ./ mu_T .* (lambda_max / lambda_min .* log(T_tilde) - log(T_0)); % formula
n_bar = ceil(t_bar ./ dt) + 1; % the nearest time point from above
t_bar = timeline(n_bar); % increase to match the nearest time point