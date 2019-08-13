%%
% ------------------------------------------------------------------------
%  Plot of Insurance Claim
% ------------------------------------------------------------------------

I_S_percent = squeeze(S(2, :, :) ./ S(1, :, :) - 1) .* 100;

plot(time_years, I_S_percent(1, :), 'LineWidth', 2, 'Color', [0.4660 0.6740 0.1880]);
hold on;
plot(time_years, I_S_percent(2, :), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
xlim([1930, 1930 + t_max]);
ylim([-1 30]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 1;
ylabel('Relative Price of Insurance (%)');
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-1 30], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-1 30], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-2], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-2], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2))}, ...
    'Location', 'NW', 'EdgeColor', [0.3 0.3 0.3], 'FontSize', 12);
%legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2)), sprintf('gamma = %0.1f', gamma(3)), ...
%    sprintf('gamma = %0.1f', gamma(4)), sprintf('gamma = %0.1f', gamma(5)), sprintf('gamma = %0.1f', gamma(6)), ...
%    sprintf('gamma = %0.1f', gamma(7)), sprintf('gamma = %0.1f', gamma(8))}, 'Location', 'NE');
%title('Insurance (as % of Price of Consumption Claim)', 'FontSize', 14);
