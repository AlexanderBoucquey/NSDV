
function [x,u] = Explicit_Euler(tf,nx,nt,f1,f2,ic)
    %  with x in [0,1] and t in [0,tf]

    %clear all; clf

    % initializations
     % tf = 0.065;                  % time window length
     % nx = 20; 
      dx = 1/nx;         % number of points in x
     % nt = 50; 
      dt = tf/nt;      % number of timesteps

      x = linspace(0,1,nx+1);     % x-point coordinates
%       u(1:nx/2) = x(1:nx/2); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)
%       u(nx/2+1:nx+1) = 1-x(nx/2+1:nx+1); %sin(20*pi*x.^2.*(1-x)); % initial condition (MATLAB syntax!)

      %f1= @(t)0;                  % lhs Dirichlet condition
      %f2= @(t)0;                  % rhs Dirichlet condition
      mu = dt/(dx*dx); 
      j = 2:nx;                   % indices of interior points:2..nx
                                  % leftmost point has index 1
                                  % rightmost point has index nx+1

    % plot the initial condition

    %  subplot(3,2,1); plot(x,u); title(sprintf('t=%4.3f',0))
    u = ic;
    % integrate in time and plot 5 solutions
  for n = 1:nt
    u(j) = mu*u(j-1) + (1-2*mu)*u(j) + mu*u(j+1);
    u(1) = f1(n*dt); u(nx+1) = f2(n*dt);

%     if mod(n,nt/5)==0
%           subplot(3,2,5*n/nt+1); plot(x,u); title(sprintf('t=%4.3f',n*dt))
%     end
  end
  
end


