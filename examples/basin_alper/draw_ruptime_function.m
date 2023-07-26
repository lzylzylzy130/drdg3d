function [x, y, z, t] = draw_ruptime_function(par, faultid)
%DRAW_RUPTIME_FUNCTION 此处显示有关此函数的摘要
%   此处显示详细说明
nproc = par.nproc;
data_dir = par.data_dir;

x = gather_fault_var( data_dir, nproc, 'x' );
y = gather_fault_var( data_dir, nproc, 'y' );
z = gather_fault_var( data_dir, nproc, 'z' );
nx = gather_fault_var( data_dir, nproc, 'nx' );
t = gather_fault_var( data_dir, nproc, 'ruptime' );
fault_id = gather_fault_var1d( data_dir, nproc, 'fault_id' );

if isempty(x)
    error('Check data dir.')
end

idx = find(mean(nx(:,:))>0 & fault_id == faultid);
x = x(:,idx);
y = y(:,idx);
z = z(:,idx);
t = t(:,idx);

tri = get_face_connect(x);
tricontour(tri,y(:),z(:),t(:),0:0.5:100,'r');
hold on;
end

