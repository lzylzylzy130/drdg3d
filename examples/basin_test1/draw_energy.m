clc
clear
%close all

addmypath;

par = ReadYaml('parameters.yaml');
nproc = par.nproc;
data_dir = par.data_dir;
data_dir_c = strrep(data_dir, '_', '-');

% varnm = 'rate';
%varnm = 'slip';
% varnm = 'sigma';
varnm = 'tau';


x = gather_fault_var( data_dir, nproc, 'x' );
y = gather_fault_var( data_dir, nproc, 'y' );
z = gather_fault_var( data_dir, nproc, 'z' );
nx = gather_fault_var( data_dir, nproc, 'nx' );
nz = gather_fault_var( data_dir, nproc, 'nz' );
time = gather_fault_var( data_dir, nproc, 'time' );