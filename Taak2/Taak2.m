clear all
close all
% initializations
   %tf = 0.065; % time window length
    tf = 0.1;
    nx = 20;  
    ny = 20;
    nt = 10000;
    nf = 100;
    [x,y]=meshgrid((0:nx)/(nx),(0:ny)/(ny));    
%     ic_heat=ones(nx+1,ny+1,1);  % Begin voorwaarde warmtevgl
   %  ic_wave(1:nx+1,1:ny+1)=sin(pi*x')*sin(pi*y);    % Bvw Golfvgl
   ic_transp=15*(x-x.^2).*(y-y.^2).*exp(50*((x-0.5)^2+(y-0.5)^2)); 
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    f3= @(t)0;                  % uhs Dirichlet condition
    f4= @(t)0;                  % abhs Dirichlet condition
    figure('Renderer','zbuffer');
    [xe,ye, ue] = Explicit_Euler_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic_transp);
   % [xu,yu, uu] = Explicit_Euler_wave(tf,nx,ny,nt,f1,f2,f3,f4,ic_transp);
%    [xt,yt, ut] = Explicit_Euler_transp(tf,nx,ny,nt,f1,f2,f3,f4,ic_transp);
    for k = 1:nf        
        surf(xe,ye,ue(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
        zlim([0 1]);
        xlabel('x');
        ylabel('y','Rotation',0);
        zlabel('u','Rotation',0);
        M_e(k)=getframe;
%         surf(xu,yu,uu(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([-1 3]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_u(k)=getframe;
%         surf(xt,yt,ut(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([-1 2]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_t(k)=getframe;
        
    end
    movie(M_e);
    writerObj = VideoWriter('Explicit_euler_1.avi'); open(writerObj);
    writeVideo(writerObj,M_e); close(writerObj);
%     movie(M_u);
%     writerObj = VideoWriter('Upwind_1.avi'); open(writerObj);
%     writeVideo(writerObj,M_u); close(writerObj);
    %writerObj = VideoWriter(')