
function pdex11
clear all
close all
    tf = 0.065; % time window length
    nx = 200;       
    nt = 10000;
    y = linspace(0,1,nx+1);
    ic(1:nx/2) = y(1:nx/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    ic(nx/2+1:nx+1) = 1-y(nx/2+1:nx+1); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
    f1= @(t)0;                  % lhs Dirichlet condition
    f2= @(t)0;                  % rhs Dirichlet condition
    m = 0;
x = linspace(0,1,201);
t = linspace(0,0.065,6);

sol = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);
% Extract the first solution component as u.
u = sol(:,:,1);
    figure
    for i = 0:0.2:1        
        [xe,ue] = Explicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5); 
       semilogy(x,abs(u(i*5+1,:)-ue)),title(sprintf('t=%4.3f',i*tf)),xlabel('x'),ylabel('verschil');

       %plot(xe,ue),title(sprintf('t=%4.3f',i*tf));
    end
   
    figure
    for i = 0:0.2:1        
        [xi,ui] = Implicit_Euler(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5),xlabel('x'),ylabel('verschil'); 
       semilogy(x,abs(u(i*5+1,:)-ui)),title(sprintf('t=%4.3f',i*tf)),xlabel('x'),ylabel('verschil');
      %  subplot(3,2,1+i*5); 
       % plot(xi,ui),title(sprintf('t=%4.3f',i*tf));
    end
    figure
    for i = 0:0.2:1        
        [xcn,ucn] = Crank_Nicolson(i*tf,nx,i*nt,f1,f2,ic);
        subplot(3,2,1+i*5),xlabel('x'),ylabel('verschil'); 
       semilogy(x,abs(u(i*5+1,:)-ucn)),title(sprintf('t=%4.3f',i*tf)),xlabel('x'),ylabel('verschil');
      %  subplot(3,2,1+i*5); 
        %plot(xcn,ucn),title(sprintf('t=%4.3f',i*tf));
    end

 
 

% A surface plot is often a good way to study a solution.
figure
surf(x,t,u) 
title('Numerical solution computed with 20 mesh points.')
xlabel('Distance x')
ylabel('Time t')

% A solution profile can also be illuminating.
figure
plot(x,u(end,:))
title('Solution at t = 2')
xlabel('Distance x')
ylabel('u(x,2)')

% --------------------------------------------------------------
function [c,f,s] = pdex1pde(x,t,u,DuDx)
c = 1;
f = DuDx;
s = 0;
% --------------------------------------------------------------
function u0 = pdex1ic(x)
u0 = -abs(x-0.5)+0.5;
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdex1bc(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur;
qr = 0;