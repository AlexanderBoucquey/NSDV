clear all
close all
% initializations
   %tf = 0.065; % time window length
    tf = 0.3183;
    nx = 40;  
    ny = 40;
    nt = 10000;
    nf = 100;
    [x,y]=meshgrid((0:nx)/(nx),(0:ny)/(ny));    
    ic_1=ones(nx+1,ny+1,1);  % Begin voorwaarde warmtevgl
    ic_2=sin(pi*x).*sin(pi*y);    % Bvw Golfvgl
   ic_3=15*(x-x.^2).*(y-y.^2).*exp(50*((x-0.5)^2+(y-0.5)^2)); 
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    f3= @(t)0;                  % uhs Dirichlet condition
    f4= @(t)0;                  % abhs Dirichlet condition
    figure('Renderer','zbuffer');
    %%
    [xe,ye, ue] = Explicit_Euler_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);
   

    for k = 1:nf        
        surf(xe,ye,ue(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
        zlim([0 1]);
        xlabel('x');
        ylabel('y','Rotation',0);
        zlabel('u','Rotation',0);
        M_e(k)=getframe;
       
    end
    movie(M_e);
    writerObj = VideoWriter('Explicit_euler_1.avi'); open(writerObj);
    writeVideo(writerObj,M_e); close(writerObj);
    
    
    %%
    [xu,yu, uu] = Explicit_Euler_wave(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);
    for k = 1:nf        
    
        surf(xu,yu,uu(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
        zlim([-1.5 1.5]);
        xlabel('x');
        ylabel('y','Rotation',0);
        zlabel('u','Rotation',0);
        M_u(k)=getframe;
       
    end
    
    
    movie(M_u);
    writerObj = VideoWriter('Explicit_euler_2.avi'); open(writerObj);
    writeVideo(writerObj,M_u); close(writerObj);
  %%  
%    [xt,yt, eut] = Explicit_Euler_transp(tf,nx,ny,nt,f1,f2,f3,f4,ic_transp);
%     
%     for k = 1:nf        
%        
%         surf(xt,yt,eut(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([-1 2]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_t(k)=getframe;
%       
%     end
%     
%     
%     
%     movie(M_t);
%     writerObj = VideoWriter('Explicit_euler_3.avi'); open(writerObj);
%     writeVideo(writerObj,M_t); close(writerObj);
%    
%     %%
%        [xuh,yuh, uh] = Upwind_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic_transp);
% 
%     for k = 1:nf        
%          surf(xuh,yuh, uh(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([0 1]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_uh(k)=getframe;
%     end
%     
%     movie(M_uh);
%     writerObj = VideoWriter('Upwind_1.avi'); open(writerObj);
%     writeVideo(writerObj,M_uh); close(writerObj);
%     
    %%
    
    
    
       [xut,yut, ut] = Upwind_transp(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);

    for k = 1:nf        
         surf(xut,yut,ut(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
        zlim([0 1]);
        xlabel('x');
        ylabel('y','Rotation',0);
        zlabel('u','Rotation',0);
        M_ut(k)=getframe;
    end
    
    movie(M_ut);
    writerObj = VideoWriter('Upwind_3.avi'); open(writerObj);
    writeVideo(writerObj,M_ut); close(writerObj);

    
    
    %     movie(M_u);
%     writerObj = VideoWriter('Upwind_1.avi'); open(writerObj);
%     writeVideo(writerObj,M_u); close(writerObj);
    %writerObj = VideoWriter(')