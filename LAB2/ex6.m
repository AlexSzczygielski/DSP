% dsp01_ex_sine.m
% 2.4 - sampling theorem part 2
% AS

close all; clear all;
% one function plotter to plot the signals
%
% global function to adjust figures within function
global figure_number;
figure_number = 0;
%

fs=8000; Nx=5*fs; % sampling frequency, number of samples
df = 200;
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)

%generate signals - AM 6 and FM 7
x6=A*(1+kA*mA).*sin(2*pi*f0*t);
x7=A*sin(2*pi*(f0*t+kF*cumsum(mF)*dt));