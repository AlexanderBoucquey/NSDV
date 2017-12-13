function [x,u] = Implicit_Euler(tf,nx,nt,f1,f2,ic)
    %  with x in [0,1] and t in [0,tf]
    %  ic is initial condition u(x,t=0)
    dx = 1/nx;      
    dt = tf/nt;     
    x = linspace(0,1,nx+1);   % x-point coordinates
    mu = dt/(dx*dx); 
    j = 2:nx;                 % indices of interior points:2..nx
                              % leftmost point has index 1
                              % rightmost point has index nx+1
    a(1:nx-1) = 1+2*mu;
    d(1:nx-2) = -mu;
    A = diag(a) + diag(d,1) + diag(d,-1);
    u = ic;
    for n = 1:nt
        u(1) = f1(n*dt); u(nx+1) = f2(n*dt);
        b = u(j);
        b(1) = u(2) + mu*u(1);
        b(end) = u(nx) + mu*u(nx+1);
        u(j) = A\b';   
    end
end 