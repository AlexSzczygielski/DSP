% dsp04_ex_dft.m
clear all; close all

% DFT transformation matrices
N = 100; % matrix dimension
k = (0:N-1); n=(0:N-1); % rows=functions, columns=samples

A = exp(-j*2*pi/N*k'*n); % analysis matrix with different scaling
S = A'; % synthesis matrix: conjugation + transposition
% S = exp(j*2*pi/N*n'*k); A = S'; % from the lab on orthogonal transforms
diag(S*A)
pause(1) % checking matrix orthogonality, N on the diagonal


% Signal - generating signal
fs=1000; dt=1/fs; t=dt*(0:N-1); % time scaling
T=N*dt; f0=1/T; fk = f0*(0:N-1); % frequency scaling
x1 = 1*cos(2*pi*(10*f0)*t); % signal 1
x2 = 1*cos(2*pi*(10.5*f0)*t); % signal 2
x3 = 0.001*cos(2*pi*(20*f0)*t); % signal 3
x = x1; % choice: x1, x2, x3, x1+x2, x2+x3

window = 1;
%window 1,x1
x=x1;
%[w1,w2,x,X1,X2,error1,error2] = func_ex6(N,window,x,A,S,fk);

%window 1,x2
x=x2;
%[w1,w2,x,X1,X2,error1,error2] = func_ex6(N,window,x,A,S,fk);

%window 1,x3
x=x3;
%[w1,w2,x,X1,X2,error1,error2] = func_ex6(N,window,x,A,S,fk);

%window 1,x1 + x3
x=x1 + x3;
%[w1,w2,x,X1,X2,error1,error2] = func_ex6(N,window,x,A,S,fk);

%window 1,x2+x3
x=x2+x3;
%[w1,w2,x,X1,X2,error1,error2] = func_ex6(N,window,x,A,S,fk);
