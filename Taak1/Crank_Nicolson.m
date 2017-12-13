function [x,u] = Crank_Nicolson(tf,nx,nt,f1,f2,ic)
    %  with x in [0,1] and t in [0,tf] 
    %  ic is initial condition u(x,t=0)
    theta = 1/2;   
    dx = 1/nx;         
    dt = tf/nt;     
    x = linspace(0,1,nx+1);     % x-point coordinates
    mu = dt/(dx*dx); 
    j = 2:nx;                   % indices of interior points:2..nx
                              % leftmost point has index 1
                              % rightmost point has index nx+1
    a(1:nx-1) = 1+2*mu*theta;
    d(1:nx-2) = -mu*theta;
    A = diag(a) + diag(d,1) + diag(d,-1);
    u = ic;
    for n = 1:nt
        un = u;
        u(1) = f1(n*dt); u(nx+1) = f2(n*dt);
        b = (1-2*(1-theta)*mu)*un(j) +(1-theta)*mu*(un(j-1)+un(j+1));
        b(1) = b(1) + theta*mu*u(1);
        b(end) = b(end) + theta*mu*u(nx+1);
        u(j) = A\b';   
    end
  end