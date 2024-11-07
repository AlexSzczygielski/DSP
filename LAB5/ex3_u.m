% ex 5.3
% dsp05_ex_partition1.m
% One-level FFT : first FFT sample re-ordering
clear all; close all; clc;


N = 8
x = rand(1,N); % analyzed signal, N=2^p
    Xm = fft(x); % its DFT (FFT)
    Xe = fft(x(1:2:N)); % DFT of "even" samples
    Xo = fft(x(2:2:N)); % DFT of "odd" samples
    X = [ Xe, Xe ] + exp(-j*2*pi/N*(0:1:N-1)) .* [Xo, Xo ]; % combining two DFT spectra

% DFT matrix
k = (0:N-1); 
n = (0:N-1); 
A = exp(-1j*2*pi/N*k'*n); 

% Even and Odd components
Ae = A(:, 1:2:N); % Even component
Ao = A(:, 2:2:N); % Odd component

% Extract even and odd samples
xe = x(1:2:end).'; 
xo = x(2:2:end).'; 

 xee=xe(1:2:end); xeo=xe(2:2:end); xoe=xo(1:2:end);
xoo=xo(2:2:end); 

% Calculate spectra using matrix-vector multiplication
Xe_calc = Ae * xe;
Xo_calc = Ao * xo;

% Calculate spectra using MATLAB's fft function
Xe_fft = fft(xe, N);
Xo_fft = fft(xo, N);

%reconstruct DFT spectrum