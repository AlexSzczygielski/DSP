% DIGITAL SIGNAL PROCESSING LAB 11
% EXERCISE 11.6 KONRAD WŁODARCZYK 417751

clc; clear; close all; 


%Calculation of differentiation filter weights using the window method and their comparison with
%weights taken from numerical signal differentiation

%CHOICE OF M VALUE
M = 100;

N=2*M+1; n=-M:M; h=cos(pi*n)./n; h(M+1)=0;

%CHOICE OF WINDOW
beta = 1;
window = kaiser(N, beta); 
%window = rectwin(N);
%window = hann(N);
%window = blackman(N);

h = h .* window';

%h = 1/12 * [-1, 8, 0, -8, 1]; M=2; N=2*M+1; n = -M:M; % 1/2*[-1 0 1]
stem(n,h); title('h(n)'); grid; 

%Verification of filter frequency response (FR), amplitude vs
%frequency and phase vs frequency

fs = 2000; f = 0:1:fs/2; % sampling frequency [Hz], frequencies of interest
z = exp(-1i*2*pi*f/fs); % Z transform variable z^(-1)
H = polyval(h(end:-1:1),z); % FR=TF for z: polynomial value

% H = freqz(h,1,f,fs); % all-in-one Matlab function
figure; plot(f,abs(H)); xlabel('f [Hz]'); title('|H(f)|'); grid;
figure; plot(f,unwrap(angle(H))); xlabel('f [Hz]'); title('angle(H(f)) [rad]'); grid;
figure; plot(f,angle(exp(1i*2*pi*f/fs*M).*H)); xlabel('f [Hz]'); title('angle(H(f)) [rad]'); grid;

%FILTERING - SIGNAL DIFFERENTIATION
Nx=400; n=0:Nx-1; dt=1/fs; t=dt*n;
fx=50; x=sin(2*pi*fx*t);
y=filter(h,1,x);

%COMPARING INPUT AND OUTPUT SIGNALS
nx=M+1:Nx-M; ny=2*M+1:Nx;
figure; plot(nx,x(nx),'ro-',nx,y(ny),'bo-'); title('x(n), y(n)'); grid; 