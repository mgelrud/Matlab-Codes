%%
% ------------------------------------------------------------------------
%  SCC - special case for gamma = 1
% ------------------------------------------------------------------------

Y = zeros(n, 1);

Y(n_bar + 1 : end) = exp(- beta * timeline(n_bar + 1 : end)) / beta * lambda_max / beta;

Y(n_tilde : n_bar) = exp(- beta * t_bar) / beta * (0.5 * lambda_const * mu_T * (t_bar^2 + t_tilde^2) ...
    + 2 * lambda_const * log(T_0) * timeline(n_tilde : n_bar) - lambda_const * mu_T / beta^2 - 2 * lambda_max / beta) ...
    + exp(- beta * timeline(n_tilde : n_bar)) / beta .* (lambda_const * mu_T / beta^2 + lambda(n_tilde : n_bar) / beta);

Y(1 : n_tilde - 1) = exp(- beta * t_bar) / beta * (lambda_const * mu_T * (t_bar^2 + t_tilde^2) ...
    + 2 * lambda_const * log(T_0) * t_tilde - lambda_const * mu_T / beta^2 - 2 * lambda_max / beta) ...
    + exp(- beta * t_tilde) / beta .* (lambda_const * mu_T / beta^2 + lambda_min / beta);
%%

% Definition 1

SCC_D1 = 1 ./ C .* Z .* (exp(- beta * timeline) / beta .* dN_integral - Y);

plot(time_years, SCC_D1, 'LineWidth', 2, 'Color', [0.9500 0.5250 0.2980]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-13 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-13 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-13.5], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-13.5], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
ylim([-13 1]);
xlh = xlabel('Time'); 
xlh.Position(2) = xlh.Position(2) - 0.5;
ylabel('Social Cost of Carbon');
title('gamma = 1');
%%

% Definition 2

SCC_D2 = 1 ./ C .* Z .* (exp(- beta * timeline) / beta .* lambda ./ beta - Y);

plot(time_years, SCC_D2, 'LineWidth', 2, 'Color', [0.9500 0.5250 0.2980]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-13 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-13 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-13.5], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-13.5], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
ylim([-13 1]);
xlh = xlabel('Time'); 
xlh.Position(2) = xlh.Position(2) - 0.5;
ylabel('Social Cost of Carbon');
title('gamma = 1');



