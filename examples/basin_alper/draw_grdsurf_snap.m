% clc
clear
% close all

addmypath;

par = ReadYaml('parameters.yaml');
nproc = par.nproc;
data_dir = par.data_dir;

varnm = 'Vy';

x = gather_grdsurf_var( data_dir, nproc, 'x' );
y = gather_grdsurf_var( data_dir, nproc, 'y' );
z = gather_grdsurf_var( data_dir, nproc, 'z' );
time = gather_fault_var( data_dir, nproc, 'time' );

if isempty(x)
    error('Var empty, Check data dir name.')
end

tri1 = get_face_connect(x);

writerObj=VideoWriter('ground.mp4', 'MPEG-4');  %// 定义一个视频文件用来存动画
writerObj.FrameRate = 11.36;
open(writerObj);                    %// 打开该视频文件

h=figure('Color','w');
%set(h,'Visible','off')
%for it = 10:10:100
step = 10;
for it =    1 : step : step*ceil(length(time)/step)
    [v,t] = gather_grdsurf_snap(data_dir,nproc,varnm,it);
    trisurf(tri1,x(:),y(:),z(:),v(:))
    view(2)
    shading interp
%     axis image
    xlabel('X (km)')
    ylabel('Y (km)')
    colorbar
    vmax=max(abs(v(:)));
    vmax=max(vmax,1e-16);
    %vmax=.1;
%     caxis([-1 1]*vmax/1)
    colormap jetwr
    colormap coolwarm
    %caxis([-1 1]*1)
    title([varnm, ' T(',num2str(it),') = ',num2str(t),' s'])
    %     pause(0.002)
    % clim([-0.3,0.3])
    clim([-2,2])

    axis equal
    xlim([-40,40])
    ylim([-60,60])
    hold on
    % rectangle('Position', [-9, -5, 8, 10])
    line([5,5],[5,45],'Color','k','LineStyle','-')
    line([0,0],[-35,5],'Color','k','LineStyle','-')
    line([0,5],[-5,5],'Color','k','LineStyle',':')
    line([0,5],[5,15],'Color','k','LineStyle',':')



    frame = getframe(gcf);            %// 把图像存入视频文件中
    writeVideo(writerObj,frame); %// 将帧写入视频
    
    
    if 0
        print('-dpng','-r300',...
            ['grd_',varnm,'_it_',num2str(it,'%06d'),'.png'])
    end
    
    %saveas(h,'grdsurf_snap.png')
end

close(writerObj); %// 关闭视频文件句柄
