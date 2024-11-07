% ex 5.2
% dsp05_ex_partition1.m
% One-level FFT : first FFT sample re-ordering
clear all; close all; clc;

% check error for N = 4,8,16
N = 4; 
for i = 1:3
    x = rand(1,N); % analyzed signal, N=2^p
    Xm = fft(x); % its DFT (FFT)
    Xe = fft(x(1:2:N)); % DFT of "even" samples
    Xo = fft(x(2:2:N)); % DFT of "odd" samples
    X = [ Xe, Xe ] + exp(-j*2*pi/N*(0:1:N-1)) .* [Xo, Xo ]; % combining two DFT spectra
    disp(['error for N = ' num2str(N)])
    error = max( abs( X - Xm ) ), % error
    if(i<3)
        N = N*2;
    end
end

% all errors - e-17 or e-16 - such differences can be ignored


%%
% DFT transformation matrices

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

% Calculate spectra (own method)
Xe_calc = Ae * xe;
Xo_calc = Ao * xo;

% Calculate spectra using fft function (matlab)
Xe_fft = fft(xe, N);
Xo_fft = fft(xo, N);

% Compare calculated signal with fft results
error_Xe = max(abs(Xe_calc - Xe_fft));
error_Xo = max(abs(Xo_calc - Xo_fft));

disp(['Maximum error in Xe: ', num2str(error_Xe)]);
disp(['Maximum error in Xo: ', num2str(error_Xo)]);