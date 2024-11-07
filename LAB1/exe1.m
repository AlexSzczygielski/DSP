
% dsp01_ex_sine.m
clear all; close all;
fs=100; Nx=100; % sampling frequency, number of samples
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)
A1=0.5; f1=1; p1=pi/4; % sine: amplitude, frequency and phase
x1 = A1 * sin(2*pi*f1*t+p1); % sine as a first signal component
x = x1; % our choice: x = x1, x1 + 0.123*x2 + 0.456*x3
plot(t,x,"o-"); grid; title("Signal x(t)"); xlabel("time [s]"); ylabel("Amplitude")