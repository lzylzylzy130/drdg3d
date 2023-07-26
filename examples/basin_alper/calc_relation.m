clear;
clc;
close all;

%%
w = 0:1:10000;
w_sel = 4000;

%% w-l relation
c1 = 1;
c2 = 3/2; % 2.4~4.3 mean value of 3.2
l = 10.^(c1.*log10(w) + log10(c2)); % Aydın and Nur, 1982
l_sel = 10^(c1*log10(w_sel) + log10(c2));

figure;
tiledlayout(2,1,'TileSpacing','compact')

nexttile
plot(w, l, 'k', 'LineWidth', 2);
xlabel('w (m)')
ylabel('l (m)')
grid on
hold on
scatter(w_sel, l_sel, 'filled')

%% w-d relation
% d = 0.8*l + 0.26; % Hempton and Dunne, 1984
% d_sel = 0.8*l_sel + 0.26;

d = 0.1104*l - 8.7550e-2 *w; % 
d_sel = 0.1104*l_sel - 8.7550e-2 *w_sel; % Alper, 2010

nexttile
plot(w, d, 'k', 'LineWidth', 2);
xlabel('w (m)')
ylabel('d (m)')
grid on
hold on
scatter(w_sel, d_sel, 'filled')

fprintf('With w = %.4d m, predicted l = %.4d m, d = %.4d m\n', w_sel, l_sel, d_sel);