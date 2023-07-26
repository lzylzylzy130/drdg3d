clc
clear
% close all

addmypath;

par = ReadYaml('parameters.yaml');

nproc = par.nproc;
data_dir = par.data_dir;

x = gather_fault_var( data_dir, nproc, 'x' );
y = gather_fault_var( data_dir, nproc, 'y' );
z = gather_fault_var( data_dir, nproc, 'z' );
nx = gather_fault_var( data_dir, nproc, 'nx' );
t = gather_fault_var( data_dir, nproc, 'ruptime' );
fault_id = gather_fault_var1d( data_dir, nproc, 'fault_id' );

% idx = find(mean(nx(:,:))>0 & fault_id == 4);
% idx = find(mean(nx(:,:))>0 & (fault_id == 1 | fault_id == 2));
idx = find(mean(nx(:,:))>0 & (fault_id == 3 | fault_id == 4 | fault_id == 5));
x = x(:,idx);
y = y(:,idx);
z = z(:,idx);
t = t(:,idx);

% r = sqrt((y-6).^2+(z+8.5).^2);
% r = r/3.464;
% %t = r + 0.01*randn(size(t));

x = mean(x);
y = mean(y);
z = mean(z);
t = mean(t);

%tri = get_face_connect(x);

[zx,zy] = trigradient(y(:),z(:),t(:) );
v=sqrt(zx.^2+zy.^2);
%v = abs(zx);
v = 1./(v+1e-16);

v = v/3.464;

yy=linspace(min(y(:)),max(y(:)),200);
zz=linspace(min(z(:)),max(z(:)),100);
[yy,zz]=meshgrid(yy,zz);

F = scatteredInterpolant(y(:),z(:),v(:));
vv = F(yy,zz);
F = scatteredInterpolant(y(:),z(:),t(:));
tt = F(yy,zz);

% figure

%trisurf(tri,x(:),y(:),z(:),v(:) )
%scatter3(x,y,z,60,v,'filled')

h = imagesc(yy(1,:), zz(:,1), vv, 'Interpolation', 'bilinear');
%     set(h, linestyle, '-', 'edgecolor', [1, 1, 1], 'facecolor', 'interp');
axis equal
xlabel('x (km)')
ylabel('y (km)')
% clim([0, 50])
ylim([min(yy(1,:)), max(yy(1,:))])
xlim([min(zz(:,1)), max(zz(:,1))])


set(gca,'tickdir','out')
set(gca,'YDir','normal')
% set(gca,'linewidth',1.2)

g = colorbar;
g.Title.String = 'Rupture speed (m/s)';
% set(get(g, 'Title'), 'string', 'Rupture speed');
% g.Layout.Tile = 'east';

% pcolor(yy,zz,vv)
hold on
contour(yy,zz,tt,0:0.5:100,'color','k')
% hold off
% colorbar
axis image
shading interp
colormap(brewermap([], '*Spectral'))
% colormap jet
clim([0 2])
legend('Rupture front','Location','southeast')


% % 读取参考破裂前方
% refrup = load('ref_fault1_barall');
% % refrup = load('ref_fault2_barall');
% gap = 100;
% refx = -24900:gap:4900;
% refy = 0:gap:19500;
% % refx = -4900:gap:24900;
% % refy = 0:gap:19600;
% % refx = min(refrup(:,1)):gap:max(refrup(:,1));
% % refy = min(refrup(:,2)):gap:max(refrup(:,2));
% reffront = zeros(length(refy), length(refx));
% 
% for i = 1:length(refx)
%     for j = 1:length(refy)
%         idx = (abs(refrup(:,1)-refx(i))<10 & abs(refrup(:,2)-refy(j))<10);
%         reffront(j,i) = refrup(idx,3);
%     end
% end
% 
% 
% hold on
% [c2,h2] = contour(refx/1e3,-refy/1e3,reffront,0:0.5:100,'r');
% legend('drdg3d 200m o3', 'Ref Barall FE 100m')