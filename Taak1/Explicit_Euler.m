function [x,u] = Explicit_Euler(tf,nx,nt,f1,f2,ic)
  %  with x in [0,1] and t in [0,tf]
  %  ic is initial condition u(x,t=0)
  dx = 1/nx;       
  dt = tf/nt;     
  x = linspace(0,1,nx+1);     % x-point coordinates
  mu = dt/(dx*dx); 
  j = 2:nx;                   % indices of interior points:2..nx
                              % leftmost point has index 1
                              % rightmost point has index nx+1
  u = ic;
  for n = 1:nt
    u(j) = mu*u(j-1) + (1-2*mu)*u(j) + mu*u(j+1);
    u(1) = f1(n*dt); u(nx+1) = f2(n*dt);
  end  
end


