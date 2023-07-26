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

if isempty(x)
    error('Var empty, Check data dir name.')
end

idx = find(mean(nx(:,:))>0);
%idx=find(mean(nx(:,:))>0 & mean(nz(:,:))>0);
x = x(:,idx);
y = y(:,idx);
z = z(:,idx);

tri1 = get_face_connect(x);

h=figure('color','w');
%set(h,'Position',[100 100 600 300])
set(gcf,'PaperPositionMode','auto')
%set(h,'Visible','off');
k=0;

writerObj=VideoWriter('test.mp4', 'MPEG-4');  %// 定义一个视频文件用来存动画
writerObj.FrameRate = 11.36;
open(writerObj);                    %// 打开该视频文件

step = 1;

for it =    1 : step : step*ceil(length(time)/step)

    disp(it)
    [v,t] = gather_fault_snap(data_dir,nproc,varnm,it);
    
    v = v(:,idx);
    trisurf(tri1,x(:),y(:),z(:),v(:));
  
    shading interp
    view([120 30])
    
    %caxis([0 3])
    %caxis([65 80])
    %axis image
    axis equal
%     daspect([1/15 1 1]) 
    %zlim([-16 0])
    
    xlabel('X (km)')
    ylabel('Y (km)')
    zlabel('Z (km)')
    colorbar
    %colormap coolwarm_ext
    %% 
    vm=max(abs(v(:)));
    %caxis([-1 1]*vm)
    
    %caxis([0 3])
    
    %colormap(flipud(colormap(jetwr)))
    colormap(brewermap([],'Spectral'))
    title([data_dir_c,' ',varnm,' T(',num2str(it),') = ',num2str(t),' sec'])
%     pause(0.005)
    
    frame = getframe(gcf);            %// 把图像存入视频文件中
    writeVideo(writerObj,frame); %// 将帧写入视频


    if k == 0
        pause(1)
    end
    %saveas(h,'fault_snap.png')
    
    
    
    if 0
        print('-dpng','-r300',...
            ['fault_',varnm,'_it_',num2str(it,'%06d'),'.png'])
    end
    
    if 0
        save(['fault_',varnm,'_it_',num2str(it),'_',data_dir,'.mat'],...)
            'tri1','x','y','z','v')
    end

    k=k+1;

    % if it>floor()

end

close(writerObj); %// 关闭视频文件句柄

