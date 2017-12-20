% clear all
% close all
% % initializations
%    %tf = 0.065; % time window length
%     tf = 0.1;
%     nx = 40;  
%     ny = 40;
%     nt = 626;
%     nf = 100;
%     [x,y]=meshgrid((0:nx)/(nx),(0:ny)/(ny));    
%     ic_1=ones(nx+1,ny+1,1);  % Begin voorwaarde warmtevgl
%     ic_2=sin(pi*x).*sin(pi*y);    % Bvw Golfvgl
%    ic_3=15*(x-x.^2).*(y-y.^2).*exp(50*((x-0.5)^2+(y-0.5)^2)); 
%    ic_4=exp(-((x-0.5).^2 + (y-0.5).^2)/(1/4));
%     f1= @(t)0;                  % lhs Dirichlet condition
%     f2= @(t)0;                  % rhs Dirichlet condition
%     f3= @(t)0;                  % uhs Dirichlet condition
%     f4= @(t)0;                  % abhs Dirichlet condition
%     figure('Renderer','zbuffer');
    %%
%   
%     [xe,ye, ue] = Explicit_Euler_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic_3);
%    
% 
%     for k = 1:nf        
%         surf(xe,ye,ue(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([0 1]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_e(k)=getframe;
%        
%     end
%     movie(M_e);
%     writerObj = VideoWriter('Explicit_euler_1.avi'); open(writerObj);
%     writeVideo(writerObj,M_e); close(writerObj);
    
    
    %%
      
%     [xu,yu, uu] = Explicit_Euler_wave(tf,nx,ny,nt,f1,f2,f3,f4,ic_3);
%     for k = 1:nf        
%     
%         surf(xu,yu,uu(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([-1.5 1.5]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_u(k)=getframe;
%        
%     end
%     
%     
%     movie(M_u);
%     writerObj = VideoWriter('Explicit_euler_2.avi'); open(writerObj);
%     writeVideo(writerObj,M_u); close(writerObj);
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
    
    
%     
%        [xut,yut, ut] = Upwind_transp(tf,nx,ny,nt,f1,f2,f3,f4,ic_3);
% 
%     for k = 1:nf        
%          surf(xut,yut,ut(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
%         zlim([0 1]);
%         xlabel('x');
%         ylabel('y','Rotation',0);
%         zlabel('u','Rotation',0);
%         M_ut(k)=getframe;
%     end
%     
%     movie(M_ut);
%     writerObj = VideoWriter('Upwind_3.avi'); open(writerObj);
%     writeVideo(writerObj,M_ut); close(writerObj);

    
    
    %     movie(M_u);
%     writerObj = VideoWriter('Upwind_1.avi'); open(writerObj);
%     writeVideo(writerObj,M_u); close(writerObj);
    %writerObj = VideoWriter(')
%% Oef3
clear variables;
close all;

tf = 0.1;
% nx = 40;  
% ny = 40;
% nt = 626;
% nf = 100;
f1= @(t)0;                  % lhs Dirichlet condition
f2= @(t)0;                  % rhs Dirichlet condition
f3= @(t)0;                  % uhs Dirichlet condition
f4= @(t)0;                  % abhs Dirichlet condition

i = 1;
max_err = zeros(50/5-1,1);
for nx = 10:5:50
    t = tf;
    ny = nx;
    nt = ((nx/10)^2*500);
    [x,y]=meshgrid((0:nx)/(nx),(0:ny)/(ny));    
    ic_2=sin(pi*x).*sin(pi*y);  % Bvw 
    u_exact_heat = sin(pi*x).*sin(pi*y)*exp(-2*pi^2*t); 
    [xe,ye, ue] = Explicit_Euler_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);
    max_err(i) = max(max(u_exact_heat-ue(:,:,nt+1)));
    i = i+1;
end
semilogy(linspace(10,50,9),max_err);

i = 1;
max_errw = zeros(100/5-1,1);
max_errt = zeros(100/5-1,1);
for nx = 10:5:100
    t = tf;
    ny = nx;
    nt = (nx/10)*500;
    [x,y]=meshgrid((0:nx)/(nx),(0:ny)/(ny));    
    ic_2=sin(pi*x).*sin(pi*y);  % Bvw 
    u_exact_wave = sin(pi*x).*sin(pi*y)*cos(sqrt(2)*pi*t);
    u_exact_transport = sin(pi*(x+t)).*sin(pi*(y+t));
    [xw,yw, uw] = Explicit_Euler_wave(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);
    [xut,yut, ut] = Upwind_transp(tf,nx,ny,nt,f1,f2,f3,f4,ic_2);
    max_errw(i) = max(max(u_exact_wave-uw(:,:,nt+2)));
    max_errt(i) = max(max(u_exact_transport-ut(:,:,nt+1)));
    i = i+1;
end
figure();
semilogy(linspace(10,100,19),max_errw);
figure();
semilogy(linspace(10,100,19),max_errt);