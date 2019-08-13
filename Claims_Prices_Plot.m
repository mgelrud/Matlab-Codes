%%
% ------------------------------------------------------------------------
%  Plot of Dividend & Consumption Claims
% ------------------------------------------------------------------------

subplot(1, 3, 1);
plot(time_years, squeeze(S(1, :, :)));
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 8000], 'Color', 'r');
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 8000], 'Color', 'r');
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
xlim([1930, 1930 + t_max]);
title('Consumption Claim', 'FontSize', 12);
xlabel('t');
ylabel('Price');

subplot(1, 3, 2);
plot(time_years, squeeze(S(2, :, :)));
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 7000], 'Color', 'r');
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 7000], 'Color', 'r');
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
xlim([1930, 1930 + t_max]);
title('Alternative Consumption Claim', 'FontSize', 12);
xlabel('t');
ylabel('Price');
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2)), sprintf('gamma = %0.1f', gamma(3)), ...
    sprintf('gamma = %0.1f', gamma(4)), sprintf('gamma = %0.1f', gamma(5)), sprintf('gamma = %0.1f', gamma(6)), ...
    sprintf('gamma = %0.1f', gamma(7)), sprintf('gamma = %0.1f', gamma(8))}, 'Location', 'NW');

subplot(1, 3, 3);
plot(time_years, squeeze(S(3, :, :)));
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0 8000], 'Color', 'r');
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0 8000], 'Color', 'r');
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-100], str, 'Interpreter', 'latex', 'FontSize', 14);
xlim([1930, 1930 + t_max]);
title('Dividend Claim', 'FontSize', 12);
xlabel('t');
ylabel('Price');

