clear all
close all
% initializations
   %tf = 0.065; % time window length
    tf = 1/pi^2;
    nx = 20;       
    nt = 100;
    y = linspace(0,1,nx+1);
%     ic(1:nx/2) = y(1:nx/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
%     ic(nx/2+1:nx+1) = 1-y(nx/2+1:nx+1); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    ic(:)= linspace(1,1, nx+1);
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    figure
    for i = 0:0.2:1        
        [xe,ue] = Explicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Explicit Euler');
    figure
    for i = 0:0.2:1        
        [xi,ui] = Implicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xi,ui),title(sprintf('t=%4.3f',i*tf));
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Implicit Euler');
    figure
    for i = 0:0.2:1        
        [xcn,ucn] = Crank_Nicolson(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xcn,ucn),title(sprintf('t=%4.3f',i*tf));
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Crank Nicolson');
    
    %relatieve fouten
    figure
    subplot(3,1,1);
    semilogy(xe,abs(ue-ui)),title('Explicit vs Implicit');
    xlabel('x');
    ylabel('difference');
    subplot(3,1,2);
    semilogy(xe,abs(ue-ucn)),title('Explicit vs CN');
    xlabel('x');
    ylabel('difference');
    subplot(3,1,3);
    semilogy(xi,abs(ui-ucn)),title('Implicit vs CN');
    xlabel('x');
    ylabel('difference');
    
 %---------------------------------------------------------------------------%
 %vraag 2
 % initializations
    tf = 0.5; % time window length
    nx = 20;       
    nt = 401;
    y = linspace(0,1,nx+1);
    ic(1:nx+1) = sin(5*pi*y/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    figure
    k = 1;
    for i = [0,0.1,1]        
        [xe,ue] = Explicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
        k = k+1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Explicit Euler');
    figure
    k = 1;
    for i = [0,0.1,1]        
        [xi,ui] = Implicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xi,ui),title(sprintf('t=%4.3f',i*tf));
        k =k + 1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Implicit Euler');
    figure
    k= 1;
    for i = [0,0.1,1]   
        [xcn,ucn] = Crank_Nicolson(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xcn,ucn),title(sprintf('t=%4.3f',i*tf));
        k = k + 1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Crank Nicolson');
    
    % initializations
    tf = 0.5; % time window length
    nx = 20;       
    nt = 399;
    y = linspace(0,1,nx+1);
    ic(1:nx+1) = sin(5*pi*y/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    figure
    k = 1;
    for i = [0,0.1,1]        
        [xe,ue] = Explicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
        k = k+1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Explicit Euler');
    figure
    k = 1;
    for i = [0,0.1,1]        
        [xi,ui] = Implicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xi,ui),title(sprintf('t=%4.3f',i*tf));
        k =k + 1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Implicit Euler');
    figure
    k= 1;
    for i = [0,0.1,1]   
        [xcn,ucn] = Crank_Nicolson(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,1,k); 
        plot(xcn,ucn),title(sprintf('t=%4.3f',i*tf));
        k = k + 1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
   % suptitle('Crank Nicolson');
%-------------------------------------------------------------%
clear all
%Vraag3
% initializations
    tf = 0.5; % time window length
    %nx = 20;       
    %nt = 500;
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
i = 1;
for nx=10*2.^[0:3]
    j = 1;
    y = linspace(0,1,nx+1);
    ic(1:nx+1) = sin(pi*y);
    for nt = 10*2.^[0:5]
        
        [xi,ui] = Implicit_Euler(tf,nx,nt,f1,f2,ic);
        u_exact = exp(-pi^2*tf)*sin(pi*y);
        A(i,j) = norm(ui-u_exact)/norm(u_exact);
        j = j+1;
    end
    i = i+1;
end
A

i = 1;
for nx=10*2.^[0:3]
    j = 1;
    y = linspace(0,1,nx+1);
    ic = sin(pi*y);
    for nt = 10*2.^[0:5]
        
        [xe,ue] = Explicit_Euler(tf,nx,nt,f1,f2,ic);
        u_exact = exp(-pi^2*tf)*sin(pi*y);
        B(i,j) = norm(ue-u_exact)/norm(u_exact);
        j = j+1;
    end
    i = i+1;
end
B

i = 1;
for nx=10*2.^[0:3]
    j = 1;
    y = linspace(0,1,nx+1);
    ic = sin(pi*y);
    for nt = 10*2.^[0:5]
        
        [xcn,ucn] = Crank_Nicolson(tf,nx,nt,f1,f2,ic);
        u_exact = exp(-pi^2*tf)*sin(pi*y);
        C(i,j) = norm(ucn-u_exact)/norm(u_exact);
        j = j+1;
    end
    i = i+1;
end
C
%---------------------------------------------------------------------------%
 %vraag 4
 % initializations
 clear all
    tf = 1; % time window length
    nx = 80;       
    nt = 1500;
    y = linspace(0,1,nx+1);
    ic(1:nx+1) = abs(sin(2*pi*y)); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    b(1:nx+1) = 0.005;          % Materiaal constante 
    figure
    k = 1;
    for i = [0,0.2,0.4,0.6,0.8,1.0]        
        [xe,ue] = Explicit_Euler_4(i*tf,nx,i*nt,f1,f2,ic,b);
        subplot(3,2,k); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
        k = k+1;
        xlabel('x');
        ylabel('u','Rotation',0);
        
    end
    %suptitle('Explicit Euler oef 4');
      k = 1;
      
 %---------------------------------------------------------------------------%
 %vraag 5
 % initializations
 clear all
    tf = 5; % time window length
    nx = 80;       
    nt = 1500;
    y = linspace(0,1,nx+1);
    ic(1:nx+1) = sin(3*pi*y.^2)/(3*pi*y.^2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
     %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    b(1:nx+1) = 10^(-4);          % Materiaal constante 
    figure
    k = 1;
    for i = [0,0.2,0.4,0.6,0.8,1.0]        
        [xe,ue] = Explicit_Euler_5(i*tf,nx,i*nt,f1,f2,ic,b);
        subplot(3,2,k); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
        k = k+1;
        xlabel('x');
        ylabel('u','Rotation',0);
    end
    %suptitle('Explicit Euler oef 5');
      k = 1;
