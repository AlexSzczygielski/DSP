% ex 5.13
clear all; close all; clc;

% signal length (must be power of 4)!!!
N = 64;

%generate random signal
x = rand(1,N);

% calculate built in fft
X1 = fft(x);

%calculate built recursive radix 4 function
X2 = radix_4_recurs(x);

%display error
err = max(abs(X1-X2))