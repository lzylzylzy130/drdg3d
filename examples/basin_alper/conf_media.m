%clc
%clear
%close all

fnm_out = 'mesh.nc';

node = ncread(fnm_out,'node');
elem = ncread(fnm_out,'elem');

x_tet = reshape(node(1,elem),size(elem));
xc = mean(x_tet); % center of tetrahedron

y_tet = reshape(node(2,elem),size(elem));
yc = mean(y_tet); % center of tetrahedron

z_tet = reshape(node(3,elem),size(elem));
zc = mean(z_tet); % center of tetrahedron

ncid = netcdf.open(fnm_out,'WRITE');

dimid_elem = netcdf.inqDimID(ncid,'Nelem');
[~,num_elem] = netcdf.inqDim(ncid,dimid_elem);

var1 = netcdf.inqVarID(ncid,'rho');
var2 = netcdf.inqVarID(ncid,'vp');
var3 = netcdf.inqVarID(ncid,'vs');

vp = zeros(num_elem,1);
vs = zeros(num_elem,1);
rho = zeros(num_elem,1);
vp(:) = 6;
vs(:) = 3.464;
rho(:) = 2.67;

if 0
% for tpv6, bimaterial fault
idx = find(xc<0);
vp(idx) = 6/1.6;
vs(idx) = 3.464/1.6;
rho(idx) = 2.67/1.2;
end

if 0 % g=10km
    idxx = find(abs(xc-4)<4);
    idxy = find(abs(yc)<5);
    idxz = find(abs(zc)<2);

    idx = intersect(idxx, intersect(idxy, idxz));
    vp(idx) = 6/1.6;
    vs(idx) = 3.464/1.6;
    rho(idx) = 2.67/1.2;
end

if 0 % g=5km
    idxall = NaN(size(xc));
    for i = 1:length(xc)
        if yc(i)>xc(i)-5 && yc(i)<xc(i)+5 ...
            && abs(xc(i)-2.5)<2.5 && abs(zc(i))<2
            idxall(i) = i;
        end
    end
    idx = idxall(~isnan(idxall));
    vp(idx) = 6/1.6;
    vs(idx) = 3.464/1.6;
    rho(idx) = 2.67/1.2;
end

if 0 % g=0km
    idxall = NaN(size(xc));
    for i = 1:length(xc)
        if yc(i)>2*xc(i)-5 && yc(i)<2*xc(i)+5 ...
            && abs(xc(i)-2.5)<2.5 && abs(zc(i))<2
            idxall(i) = i;
        end
    end
    idx = idxall(~isnan(idxall));
    vp(idx) = 6/1.6;
    vs(idx) = 3.464/1.6;
    rho(idx) = 2.67/1.2;
end

netcdf.putVar(ncid,var1,rho);
netcdf.putVar(ncid,var2,vp);
netcdf.putVar(ncid,var3,vs);

netcdf.close(ncid);

