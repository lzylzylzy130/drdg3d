clc
clear
close all

addmypath;

par = ReadYaml('parameters.yaml');
nproc = par.nproc;
data_dir = par.data_dir;

% data_dir = 'data';

% varnm = 'rate';
%varnm = 'slip';
varnm = 'stress';
%varnm = 'sigma';

x0 = 5; % on the fault surface
y0 = 6;
z0 = -0.8;
%z0 = 0;

%y0 = 1.9;
%z0 = 1.9;
% y0 = 5.6+0.0;
% z0 = 2.3-0.0;

[v,t] = extract_seismo_from_snap(data_dir,nproc,[x0,y0,z0],varnm);

nt = length(v);
 
h=figure;
yyaxis left
%set(h,'Visible','off');
plot(t,v,'k','linewidth',1)
xlabel('T (sec)')
%saveas(h,'seismo.png')

hold on

mu_s = 0.75;
varnm = 'sigma';
[v,t] = extract_seismo_from_snap(data_dir,nproc,[x0,y0,z0],varnm);
plot(t,-mu_s*v,'--b','linewidth',1)
ylabel('MPa')

yyaxis right
varnm = 'rate';
[v,t] = extract_seismo_from_snap(data_dir,nproc,[x0,y0,z0],varnm);
plot(t,v,'r','linewidth',1)
ylabel('m/s')

hold on
idx = find(v~=0);
if ~isnan(idx)
    xline(t(idx(1)), ':k', 'LineWidth', 1, 'Label', 'Nucleation')
end

legend('\sigma_s','\sigma_n\mu_s','rate')
grid on
title(['x = ', num2str(x0), ', y = ', num2str(y0), ', z = ', num2str(z0)])