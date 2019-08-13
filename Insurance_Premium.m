%%
% ------------------------------------------------------------------------
%  Insurance Premium & Plot
% ------------------------------------------------------------------------

r_insurance = zeros(length(gamma), n);

% Find r_insurance for t < t_tilde
r_insurance(:, 1 : n_tilde - 1) = exp_mZ .* lambda(1 : n_tilde - 1)' .* ones(length(gamma), n_tilde - 1) ...
    + r_consumption(:, 1 : n_tilde - 1);

% Find r_insurance for t_tilde < t < t_bar
chi = (exp_mZ + exp_gammaZ)' .* fraction - exp_gammam1Z' .* (fraction - 1);
r_insurance(:, n_tilde : n_bar) = (exp_mZ - chi(:, n_tilde : n_bar)) .* lambda(n_tilde : n_bar)' ...
        + r_consumption(:, n_tilde : n_bar);

% Find r_insurance for t_bar < t
r_insurance(:, n_bar + 1 : end) = (a(1, :)' + exp_mZ .* lambda(n_bar + 1 : end)') ...
    + (D(n_bar + 1 : end)' - C_(n_bar + 1 : end)') ...
    ./ (squeeze(S(2, :, n_bar + 1 : end)) - SC_(:, n_bar + 1 : end)) ...
    + r_consumption(:, n_bar + 1 : end);
%%

% A separate case when gamma = 1 where r_insurance = - r_f

if length(find(gamma == 1)) > 0
    r_insurance(find(gamma == 1), :) = - r_f(find(gamma == 1), :);
end
%%

subplot(2, 1, 1);
plot(time_years, r_insurance(1, :), 'LineWidth', 2, 'Color', [0.4660 0.6740 0.1880]);
hold on;
plot(time_years, r_insurance(2, :), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-0.21, 0.01], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-0.21, 0.01], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
ylim([-0.13, 0.01]);
ylabel('Insurance Premium');
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2))}, ...
    'Location', 'SW', 'EdgeColor', [0.3 0.3 0.3], 'FontSize', 12);

subplot(2, 1, 2);
plot(time_years, r_insurance(1, :) + r_f(1, :), 'LineWidth', 2, 'Color', [0.4660 0.6740 0.1880]);
hold on;
plot(time_years, r_insurance(2, :) + r_f(2, :), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-0.1 0.15], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-0.1 0.15], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-0.085], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-0.085], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
ylim([-0.07, 0.1]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 0.015;
ylabel('Insurance Rate');








