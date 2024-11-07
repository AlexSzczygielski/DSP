% dsp01_ex_sine.m
%summing 3 sinusoids, with different values
clear all; close all;
fs=100; Nx=100; % sampling frequency, number of samples
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)

A1=0.5; f1=1; p1=pi/4; % sine: amplitude, frequency and phase
A2= 2; f2=2; p2=pi; % second sinusoid params
x1 = A1 * sin(2*pi*f1*t+p1); % sine as a first signal component
x2 = A2 * sin(2*pi*f2*t+p2);
%x = x1; % our choice: x = x1, x1 + 0.123*x2 + 0.456*x3


figure(1)
plot(t,x1,"o-"); grid; title("Signal x(t) and x2(t)"); xlabel("time [s]"); ylabel("Amplitude");
hold on;
plot(t,x2,"o-");
hold off;

A3 = 3; f3 = 3; p3 = -pi/2; %3rd sinusoid params
x3 = A3 * sin(2*pi*f3*t+p3);

x_sum = x1 + x2+ x3;

figure(2)
plot(t,x_sum,"o-");





