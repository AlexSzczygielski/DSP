% dsp04_ex8_dft.m
clear all; close all

%%%
% uncomment required plots! (PPM)
%%%
%Time discretization settings
N = 2000;
fs = 2000;
dt = 1/fs; t = dt*(0:N-1);
omega = linspace(-fs/2, fs/2, N);

% Signal generation (from table):
%%

%Rectangular 
T = 0.1;    
rT = @(t) double(abs(t) <= T);
x1 = rT(t);

%Sign signal
x2 = sign(t);

%Gaussian 
a = 10;
x3 = exp(-a*t.^2);

%One - sided exponential 
x4 = exp(-a*t).*(t>=0);

%Damped sine
A = 1;
omega0 = 2*pi*50;
x5 = A*exp(-a*t) .* sin(omega0*t).*(t>=0);

%Damped cosine
x6 = A*exp(-a*t).*cos(omega0*t).*(t>=0);

%Cosine part
x7 = cos(omega0*t).*rT(t);

%%
% calcualting fft:
% using fftshift to shift zero-frequency component to center of spectrum

X1 = fft(x1);
X2 = fft(x2);
X3 = fft(x3);
X4 = fft(x4);
X5 = fft(x5);
X6 = fft(x6);
X7 = fft(x7);

X1 = fftshift(X1);
X2= fftshift(X2);
X3= fftshift(X3);
X4= fftshift(X4);
X5= fftshift(X5);
X6= fftshift(X6);
X7= fftshift(X7);

%%
%plot
% plot_8(X1,omega);
% plot_8(X2,omega);
% plot_8(X3,omega);
% plot_8(X4,omega);
% plot_8(X5,omega);
% plot_8(X6,omega);
% plot_8(X7,omega);

%%
% calc spectra using eq from table:
X1_2 = (2*sin(omega*T)./omega);                                                         
X2_2 = 2./(1i*omega);                                                                   
X3_2 = sqrt(pi/a) * exp((-omega.^2)/(4*a));                                             
X4_2 = 1./((a+1i*omega));                                                                
X5_2 = (A*omega0)./((a + 1i*omega).^2 + omega0.^2);                                     
X6_2 = A*((a + 1i*omega)./((a + 1i*omega).^2 + omega0.^2));                             
X7_2 = (sin((omega-omega0)*T)./(omega-omega0) + sin((omega+omega0)*T)./(omega+omega0));

%%
% plot 2
% compare with matlab fft on graphs
% plot_8_2(X1,X1_2,omega);
% plot_8_2(X2,X2_2,omega);
% plot_8_2(X3,X3_2,omega);
% plot_8_2(X4,X4_2,omega);
% plot_8_2(X5,X5_2,omega);
% plot_8_2(X6,X6_2,omega);
% plot_8_2(X7,X7_2,omega);
