function [x, y, u] = Upwind_heat(tf,nx,ny,nt,f1,f2,f3,f4,ic)
  %  with x in [0,1] and t in [0,tf]
  %  ic is initial condition u(x,t=0)
  dx = 1/nx; 
  dy = 1/ny;
  dt = tf/nt;     
  x = linspace(0,1,nx+1);     % x-point coordinates
  y = linspace(0,1,ny+1);     % y_point coordinates
  mux = dt/(dx*dx); 
  muy = dt/(dy*dy);
  jx = 1:nx-1;    % indices of interior points:2..nx
  jy = 1:ny-1;    % indices of interior points:2..ny
                              % leftmost point has index 1
                              % rightmost point has index nx+1
  u(:,:,1) = ic;
  k = 1;
  for n = 1:nt
       u(jx+1,jy+1,k+1) = mux*u(jx,jy+1,k) + (1-2*mux-2*muy)*u(jx+1,jy+1,k) + ...
        mux*u(jx+2,jy+1,k)+ muy*u(jx+1,jy,k) + muy*u(jx+1,jy+2,k);
    u(1,:,k+1) = f1(n*dt);
    u(nx+1,:,k+1) = f2(n*dt); 
    u(:,1,k+1) = f3(n*dt);
    u(:,ny+1,k+1) = f4(n*dt) ; 
    k = k +1;
  end  
end



