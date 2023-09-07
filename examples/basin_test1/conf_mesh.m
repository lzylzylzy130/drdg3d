clc
clear
close all

addmypath;

fnm_in = 'tpv5_cir.exo';
fnm_out = 'mesh.nc';

%% check the tet_id, surf_id
% use: check_surface_id(fnm_in,surf_id);
% tet_id = 29;
% faultsurf_id = [22,21];
% freesurf_id = 25;
tet_id = 26;
faultsurf_id = [19,18];
freesurf_id = 22;
% tet_id = 24;
% faultsurf_id = [17];
% freesurf_id = 25;
msh = build_mesh(fnm_in,tet_id,faultsurf_id,freesurf_id);

%% write mesh.nc
disp('writing mesh ...')
write_mesh_nc(fnm_out,msh);

%% checking
% check fault connectivity
fault_tri = get_fault_connectivity(msh.elem',msh.fault2wave,msh.bctype);
figure
trisurf(fault_tri,...
    msh.node(1,:),...
    msh.node(2,:),...
    msh.node(3,:))
axis equal