%%
% ------------------------------------------------------------------------
%  Betas
% ------------------------------------------------------------------------

% Finding beta of dividends

beta_D = sigma^2 ./ (sigma^2 + exp_mZ_sqrt .* lambda');

plot(time_years, beta_D, 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [0.4 1.1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [0.4 1.1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [0.375], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [0.375], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 0.02;
ylabel('Beta of Dividends');
%%

% Finding beta of insurance (climate beta)

fraction = squeeze(S(2, :, :)) ./ (squeeze(S(2, :, :)) - SC_);

beta_I = repmat(beta_D, [length(gamma), 1]) .* fraction - (fraction - 1);
beta_I(:, 1 : n_tilde - 1) = 0;
%beta_I(3, :) = 0;

plot(time_years, beta_I(1, :), 'LineWidth', 2, 'Color', [0.4660 0.6740 0.1880]);
hold on;
plot(time_years, beta_I(2, :), 'LineWidth', 2, 'Color', [0 0.4470 0.7410]);
set(gca, 'xtick', [], 'LineWidth', 1, 'XColor', [0.3 0.3 0.3], 'YColor', [0.3 0.3 0.3], 'FontSize', 12);
line([time_years(1) + round(t_tilde) time_years(1) + round(t_tilde)], [-35 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
line([time_years(1) + round(t_bar) time_years(1) + round(t_bar)], [-35 1], ...
    'LineWidth', 1, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \tilde t $$';
text([time_years(1) + round(t_tilde) - 1], [-36.2], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
str = '$$ \bar t $$';
text([time_years(1) + round(t_bar) - 1], [-36.2], str, 'Interpreter', 'latex', ...
    'FontSize', 14, 'Color', [0.8350 0.0780 0.1840]);
xlim([1930, 1930 + t_max]);
%ylim([-35 1]);
xlh = xlabel('Time');
xlh.Position(2) = xlh.Position(2) - 1;
ylabel('Beta of Insurance');
legend({sprintf('gamma = %0.1f', gamma(1)), sprintf('gamma = %0.1f', gamma(2))}, ...
    'Location', 'SW', 'EdgeColor', [0.3 0.3 0.3], 'FontSize', 12);






