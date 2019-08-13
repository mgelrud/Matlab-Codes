%%
% ------------------------------------------------------------------------
%  Plot of P/D Ratios
% ------------------------------------------------------------------------

S_C_ratio = S ./ reshape(C, [1, 1, n]);

subplot(1, 2, 1);
plot(time_years, squeeze(S_C_ratio(1, :, :)));
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 140], 'Color', 'r');
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-10], str, 'Interpreter', 'latex', 'FontSize', 14);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 140], 'Color', 'r');
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-10], str, 'Interpreter', 'latex', 'FontSize', 14);
xlim([1930, 1930 + t_max]);
title('Consumption', 'FontSize', 12);
xlabel('t');
ylabel('P/C Ratio');

subplot(1, 2, 2);
plot(time_years, squeeze(S_C_ratio(2, :, :)));
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 140], 'Color', 'r');
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-10], str, 'Interpreter', 'latex', 'FontSize', 14);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 140], 'Color', 'r');
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-10], str, 'Interpreter', 'latex', 'FontSize', 14);
xlim([1930, 1930 + t_max]);
title('Alternative Consumption', 'FontSize', 12);
xlabel('t');
ylabel('P/C Ratio');
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2)), sprintf('gamma = %0.1f', gamma(3)), ...
    sprintf('gamma = %0.1f', gamma(4)), sprintf('gamma = %0.1f', gamma(5)), sprintf('gamma = %0.1f', gamma(6)), ...
    sprintf('gamma = %0.1f', gamma(7)), sprintf('gamma = %0.1f', gamma(8))}, 'Location', 'NW');