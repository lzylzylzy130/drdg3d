clear
clc
close all

addmypath;

%% Scatter data
par = ReadYaml('parameters.yaml');

figure('Color','w')
tiledlayout(2,1,'TileSpacing','compact')

nexttile
[x1, y1, z1, t1] = draw_ruptime_function(par,1);
[x2, y2, z2, t2] = draw_ruptime_function(par,2);
axis equal
title('Sub fault')
% x_sf1 = [x1,x2];
% y_sf1 = [y1,y2];
% z_sf1 = [z1,z2];

nexttile
[x3, y3, z3, t3] = draw_ruptime_function(par,3);
[x4, y4, z4, t4] = draw_ruptime_function(par,4);
[x5, y5, z5, t5] = draw_ruptime_function(par,5);
axis equal
title('Main fault')
% x_sf2 = [x3,x4,x5];
% y_sf2 = [y3,y4,y5];
% z_sf2 = [z3,z4,z5];
