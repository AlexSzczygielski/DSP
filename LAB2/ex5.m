% dsp02_ex_deterministic.m
% 2.5 - playing sound of sum of sinuses
% AS

close all; clear all;
% one function plotter to plot the signals
%
% global function to adjust figures within function
global figure_number;
figure_number = 0;
%

%set sampling params
fs=8000; Nx=3*fs; % sampling frequency, number of samples
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)

x_sine = sin(2*pi*100*t);
plotter(t,x_sine,"sine, 100 Hz");
listen(t,x_sine,fs,8);

%set 3 sinuses
A1= 2; f1= fs - (fs*0.6); p1=0; % sine: amplitude, frequency and phase
A2= 2; f2=fs - (fs*0.7); p2=0; % second sinusoid params
A3= 2; f3=fs - (fs*0.8); p3=0; % second sinusoid params
x1 = A1 * sin(2*pi*f1*t+p1); % sine as a first signal component
x2 = A2 * sin(2*pi*f2*t+p2);
x3 = A3 * sin(2*pi*f2*t+p3);
x4 = x1+x2+x3;

%plot sinuses
plotter(t,[x1;x2;x3;x4],"x1,x2,x3 and x4 = sum");

% multiply sum by gaussian
x_exp= x4.*exp(-t);
x_gaussian = x4.*exp(-(t-1.5).^2);
plotter(t,[x_exp;x_gaussian],"Sum multiplied by Exponent and Gaussian");
listen(t,x_exp,fs,8);
listen(t,x_gaussian,fs,8);