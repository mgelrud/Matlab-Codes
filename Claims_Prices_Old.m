%%
% ------------------------------------------------------------------------
%  Dividend & Consumption Claims
% ------------------------------------------------------------------------

B = zeros(n, length(gamma));
A = zeros(n, length(gamma));
F = zeros(n, length(gamma));
S = zeros(n, length(gamma));

% Parameters

exp_D = exp_Z + exp_mgammaZ;
a = - gamma .* mu - beta + 0.5 .* gamma .* (gamma + 1) .* sigma^2 + mu - gamma .* sigma^2;
a_bar = a + exp_D .* lambda_const .* log(T_0);
a_barbar = a_bar + exp_D .* lambda_const .* mu_T .* t_bar;
b = - lambda_const .* mu_T .* exp_D;

exp_C = exp_1mgammaZ;
c = a + exp_C .* lambda_const .* log(T_0);
c_bar = c + exp_C .* lambda_const .* mu_T .* t_bar;
d = - lambda_const .* mu_T .* exp_C;

if a == 0
    display('ERROR: a = 0');
end      
if a_barbar >= 0
    display('ERROR: a_barbar >= 0');
end    
%%

% Find F and S for t_0 < t_tilde

t_0 = timeline(1 : n_tilde - 1);
    
n_steps = 100000; % approximating the integral
limit_min = t_tilde;
limit_max = t_bar;
du = (limit_max - limit_min) ./ n_steps;
    
F_integral1 = 0;
x = limit_min;
for i = 1 : n_steps
    func = exp(- 0.5 .* b .* (x - a_bar ./ b) .^ 2);
    F_integral1 = F_integral1 + func .* du;
    x = x + du;
end
    
S_integral1 = 0;
x = limit_min;
for i = 1 : n_steps
    func = exp(- 0.5 .* d .* (x - c ./ d) .^ 2);
    S_integral1 = S_integral1 + func .* du;
    x = x + du;
end
    
zeta_F = 1 ./ a + exp(0.5 .* b .* t_tilde .^ 2 + 0.5 .* a_bar .^ 2 ./ b - a_bar .* t_tilde) ...
    .* F_integral1 - 1 ./ a_barbar .* exp(a_bar .* (t_bar - t_tilde) - 0.5 .* b .* (t_bar .^ 2 - t_tilde .^ 2));
B(1 : n_tilde - 1, :) = exp(a .* (t_tilde - t_0)) .* zeta_F - 1 ./ a;
    
zeta_S = 1 ./ a + exp(0.5 .* d .* t_tilde .^ 2 + 0.5 .* c .^ 2 ./ d - c .* t_tilde) ...
    .* S_integral1 - 1 ./ c_bar .* exp(c .* (t_bar - t_tilde) - 0.5 .* d .* (t_bar .^ 2 - t_tilde .^ 2));
A(1 : n_tilde - 1, :) = exp(a .* (t_tilde - t_0)) .* zeta_S - 1 ./ a;
%%

% Find F and S for t_tilde < t_0 < t_bar

t_0 = timeline(n_tilde : n_bar);
    
n_steps = 100000; % approximating the integral
limit_min = t_0;
limit_max = t_bar;
du = (limit_max - limit_min) ./ n_steps;
    
F_integral2 = zeros(length(t_0), 1);
x = limit_min;
for i = 1 : n_steps
    func = exp(- 0.5 .* b .* (x - a_bar ./ b).^2);
    F_integral2 = F_integral2 + func .* du;
    x = x + du;
end
    
S_integral2 = zeros(length(t_0), 1);
x = limit_min;
for i = 1 : n_steps
    func = exp(- 0.5 .* d .* (x - c ./ d) .^ 2);
    S_integral2 = S_integral2 + func .* du;
    x = x + du;
end
    
F_part_1 = exp(0.5 .* a_bar .^ 2 ./ b) .* F_integral2;
F_part_2 = - 1 ./ a_barbar .* exp(a_bar .* t_bar - 0.5 .* b .* t_bar .^ 2);
B(n_tilde : n_bar, :) = exp(0.5 .* b .* t_0 .^ 2 - a_bar .* t_0) .* (F_part_1 + F_part_2);
    
S_part_1 = exp(0.5 .* c .^ 2 ./ d) .* S_integral2;
S_part_2 = - 1 ./ c_bar .* exp(c .* t_bar - 0.5 .* d .* t_bar .^ 2);
A(n_tilde : n_bar, :) = exp(0.5 .* d .* t_0 .^ 2 - c .* t_0) .* (S_part_1 + S_part_2);
%%

% Find F and S for t_bar < t_0

t_0 = timeline(n_bar + 1 : end);

B(n_bar + 1 : end, :) = - 1 ./ repmat(a_barbar, [n - n_bar, 1]);
A(n_bar + 1 : end, :) = - 1 ./ repmat(c_bar, [n - n_bar, 1]); 
%%

% A separate case for S when gamma = 1 because then d = 0, so can't have it
% in the denominator

if length(find(gamma == 1)) > 0
    A(:, find(gamma == 1)) = - 1 ./ a(find(gamma == 1));
    B(:, find(gamma == 1)) = - 1 ./ a(find(gamma == 1));
end

F = repmat(C, [1, length(gamma)]) .* B;
S = repmat(C, [1, length(gamma)]) .* A;





