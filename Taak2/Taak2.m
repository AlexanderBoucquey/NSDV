clear all
close all
% initializations
   %tf = 0.065; % time window length
    tf = 0.1;
    nx = 20;  
    ny = 20;
    nt = 1000;
    nf = 30;
    y = linspace(0,1,nx+1);
%     ic(1:nx/2) = y(1:nx/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
%     ic(nx/2+1:nx+1) = 1-y(nx/2+1:nx+1); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    ic=ones(nx+1,ny+1,1);% linspace(1,1, nx+1)*linspace(1,1, ny+1);
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    f3= @(t)0;                  % uhs Dirichlet condition
    f4= @(t)0;                  % abhs Dirichlet condition
    figure('Renderer','zbuffer');
    for k = 1:nf        
        [xe,xy, ue] = Explicit_Euler(tf,nx,ny,nt,f1,f2,f3,f4,ic);
        surf(xe,xy,ue(:,:,k*floor(nt/nf))),title(sprintf('t=%4.3f',tf*k/nf));
        zlim([0 1]);
        xlabel('x');
        ylabel('y','Rotation',0);
        zlabel('u','Rotation',0);
        M(k)=getframe;
    end
    movie(M);
    %writerObj = VideoWriter(')