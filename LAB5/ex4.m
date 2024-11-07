% ex 5.4
% dsp05_ex_partition1.m
% One-level FFT : first FFT sample re-ordering

%3 sections contain 3 different p values
%run by sections
clear all; close all; clc;

%generate random signal
p=8
N=2^p; 
x=randn(N,1);
x = x';

X1 = fft(x);
X2 = myRecFFT(x);

err=max(abs(X1-X2))

%%
clear all; close all; clc;
p = 16
N=2^p; 
x=randn(N,1);
x = x';

X1 = fft(x);
X2 = myRecFFT(x);

err=max(abs(X1-X2))

%%

clear all; close all; clc;
p = 4
N=2^p; 
x=randn(N,1);
x = x';

X1 = fft(x);
X2 = myRecFFT(x);

err=max(abs(X1-X2))