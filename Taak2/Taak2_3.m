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