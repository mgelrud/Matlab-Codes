%%
% ------------------------------------------------------------------------
%  Evolutions
% ------------------------------------------------------------------------

T = zeros(n, 1);
T(1) = T_0 * exp(mu_T * timeline(1));
for t = 2 : n_bar - 1
    T(t) = T(t - 1) + T(t - 1) * mu_T * dt;
end
T(n_bar : end) = T(n_bar - 1);

lambda = zeros(n, 1);
for t = 1 : n
    if (t >= n_tilde) & (t <= n_bar)
        lambda(t) = lambda_const * mu_T * timeline(t) + lambda_const * log(T_0);
    elseif t > n_bar
        lambda(t) = lambda_const * mu_T * t_bar + lambda_const * log(T_0);
    end    
end 

C = zeros(n, 1);
C_ = zeros(n, 1);
D = zeros(n, 1);
dN = zeros(n, 1);
dN_integral = zeros(n, 1);
dB = zeros(n, 1);
dB_integral = zeros(n, 1);
C(1) = C_0;
C_(1) = C_0;
D(1) = C_0;
for t = 2 : n
    dB(t) = randn * dt^0.5;
    dB_integral(t) = dB_integral(t - 1) + dB(t);
    dN(t) = poissrnd(lambda(t) * dt);
    dN_integral(t) = dN_integral(t - 1) + dN(t);
    C_(t) = C(t - 1) + C(t - 1) * (mu * dt + sigma * dB(t));
    C(t) = C(t - 1) + C(t - 1) * (mu * dt + sigma * dB(t) + (exp(- Z) - 1) * dN(t));
    D(t) = D(t - 1) + D(t - 1) * ((mu + exp_mZ * lambda(t)) * dt + sigma * dB(t));
end 