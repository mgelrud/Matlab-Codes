%%
% ------------------------------------------------------------------------
%  Risk-Free Rate & Plot
% ------------------------------------------------------------------------

r_f = - mu_pi' - exp_gammaZ' .* lambda';

plot(time_years, r_f(1, :), 'LineWidth', 2, 'Color', [0.4660 0.6740 0.1880]);
hold on;
plot(time_years, r_f(2, :), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 0.12], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 0.12], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-0.004], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-0.004], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 0.004;
ylabel('Risk-Free Rate');
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2))}, ...
    'Location', 'NW', 'EdgeColor', [0.3 0.3 0.3], 'FontSize', 12);