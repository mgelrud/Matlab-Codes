%%
% ------------------------------------------------------------------------
%  Plot of Evolutions
% ------------------------------------------------------------------------

yyaxis left
plot(time_years, C, 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
hold on;
plot(time_years, D, ':', 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
ylabel('Consumption & Dividends');
yyaxis right
plot(time_years, T, 'LineWidth', 2, 'Color', [0.9500 0.5250 0.2980]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 8], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 8], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-0.3], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-0.3], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 4;
ylabel('Temperature Anomaly');
legend({'Consumption', 'Dividends', 'Temperature Anomaly'}, 'Location', 'NW', ...
    'EdgeColor', [0.3 0.3 0.3], 'FontSize', 12);
%title('Sample Paths', 'FontSize', 12);