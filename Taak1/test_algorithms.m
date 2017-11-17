clear all
close all
% initializations
    tf = 0.065; % time window length
    nx = 20;       
    nt = 100;
    y = linspace(0,1,nx+1);
    ic(1:nx/2) = y(1:nx/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    ic(nx/2+1:nx+1) = 1-y(nx/2+1:nx+1); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    figure
    for i = 0:0.2:1        
        [xe,ue] = Explicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
    end
    suptitle('Explicit Euler');
    figure
    for i = 0:0.2:1        
        [xi,ui] = Implicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xi,ui),title(sprintf('t=%4.3f',i*tf));
    end
    suptitle('Implicit Euler');
    figure
    for i = 0:0.2:1        
        [xcn,ucn] = Crank_Nicolson(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
        plot(xcn,ucn),title(sprintf('t=%4.3f',i*tf));
    end
    suptitle('Crank Nicolson');
    
    %relatieve fouten
    figure
    subplot(3,1,1);
    semilogy(xe,abs(xe-xi)),title('Explicit vs Implicit');
    subplot(3,1,2);
    semilogy(xe,abs(xe-xcn)),title('Explicit vs CN');
    subplot(3,1,3);
    semilogy(xi,abs(xi-xcn)),title('Implicit vs CN');
    