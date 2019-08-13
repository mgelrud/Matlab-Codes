%%
% ------------------------------------------------------------------------
%  Dividend & Consumption Claims
% ------------------------------------------------------------------------

H = zeros(3, length(gamma), n);

% Parameters

mu_pi = - gamma .* mu - beta + 0.5 .* gamma .* (gamma + 1) .* sigma^2;
mu_D = phi .* mu + 0.5 .* phi .* (phi - 1) .* sigma^2;

disaster_size = [exp_gammam1Z; exp_mZ + exp_gammaZ; exp_gammamphiZ]; % 1st entry for C_t, 2nd for A_t, 3nd for D_t
a = [mu_pi + mu - gamma .* sigma^2; mu_pi + mu - gamma .* sigma^2; mu_pi + mu_D - phi .* gamma .* sigma^2];
b1 = a + disaster_size .* lambda_const .* log(T_0);
b_bar = b1 + disaster_size .* lambda_const .* mu_T .* t_bar;
b2 = lambda_const .* mu_T .* disaster_size;

if length(find(a == 0)) > 0
    display('ERROR: there exists a = 0');
end      
if length(find(b_bar >= 0)) > 0
    display('ERROR: there exists b_bar >= 0');
end    
%%

% Find S for t < t_tilde

t = timeline(1 : n_tilde - 1);

n_steps = 100000; % approximating the integral
limit_min = t_tilde;
limit_max = t_bar;
du = (limit_max - limit_min) ./ n_steps;
    
integral1 = 0;
x = limit_min;
for i = 1 : n_steps
    func = nu(x, b1 , b2) ./ nu(t_tilde, b1 , b2);
    integral1 = integral1 + func .* du;
    x = x + du;
end

xi = 1 ./ a + integral1 - 1./ b_bar .* nu(t_bar, b1 , b2) ./ nu(t_tilde, b1 , b2);

H(:, :, 1 : n_tilde - 1) = exp(a .* reshape(t_tilde - t, [1, 1, n_tilde - 1])) .* xi - 1 ./ a;
%%

% Find S for t_tilde < t < t_bar

t = timeline(n_tilde : n_bar);
    
n_steps = 10000; % approximating the integral
limit_min = t;
limit_max = t_bar;
du = (limit_max - limit_min) ./ n_steps;
 
integral2 = 0;
x = limit_min;
for i = 1 : n_steps
    func = nu(x, b1, b2) ./ nu(t, b1, b2);
    integral2 = integral2 + func .* repmat(reshape(du, [1, 1, length(t)]), [3, length(gamma), 1]);
    x = x + du;
end   

H(:, :, n_tilde : n_bar) = integral2 - 1 ./ b_bar .* nu(t_bar, b1, b2) ./ nu(t, b1, b2);
%%

% Find S for t > t_bar

H(:, :, n_bar + 1 : end) = - 1 ./ repmat(b_bar, [1 1 n - n_bar]);
%%

% A separate case for S when gamma = 1 because then d = 0, so can't have it
% in the denominator

if length(find(gamma == 1)) > 0
    H(:, find(gamma == 1), :) = - 1 ./ repmat(a(:, find(gamma == 1)), [1 1 n]);
end

%%

S = permute(repmat([C D C], [1, 1, length(gamma)]), [2 3 1]) .* H;
SC_ = C_' .* squeeze(H(1, :, :));



