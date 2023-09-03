clc
clear
%close all
addmypath

coord = [0 0 -7.5];
%coord = [0 0 0];
bc = BC_FAULT;
%bc = BC_FREE;
varnm = 'rate';
%varnm = 'Vz';

par = ReadYaml('parameters.yaml');
nproc = par.nproc;
data_dir = par.data_dir;

[ t, v, coord1 ] = extract_seismo( data_dir, nproc, coord, bc, varnm );

figure
plot(t,v,'x-')
title(varnm)
xlabel('Time (sec)')