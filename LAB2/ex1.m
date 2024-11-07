% dsp02_ex_deterministic.m
% 2.1 - signal variety
% AS

close all; clear all;
% one function plotter to plot the signals
%
% global function to adjust figures within function
global figure_number;
figure_number = 0;
%

%set params
fs=100; Nx=100; % sampling frequency, number of samples
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)

% list of signals x1 - x7
x1=sin(2*pi*10*t+pi/4); % sine 10 Hz as a first signal component
x2=sin(2*pi*1*t); % sine 1 Hz
x3=exp(-5*t); % exponent decaying in time
x4=exp(-25*(t-0.5).^2); % Gaussian hat
x5=sin(2*pi*(0*t+0.5*20*t.^2)); % linear frequency increase: start 0 Hz, +20Hz/s
x6=sin(2*pi*(10*t-(9/(2*pi*1)*cos(2*pi*1*t)))); % sinus. FM: 9Hz around 10Hz, 1 per sec
x7=sin(2*pi*(10*t+9*cumsum(x2)*dt)); % the same as x6; why?
%x = x1; % our choice: x1,x2,...,x7, 0.23*x1 + x2, x1.*x3, ...

% examine singals, as provided
X = plotter(t,[x1;x2;x3;x4;x5;x6;x7],"Examining provided signals");

% examine sum of signals
x=0.25*x1+2*x2;
x1 = x1 + x2;
x3 = x3 + x4;
x5 = x5 + x6;

plotter(t,[x1;x3;x5;x], "examine sum of signals");

% examine multiplication of signals

x_multiply_1=(1+0.5*x2).*x1; 
x_multiply_2=x2.*x1; x=x3.*x1; 
x_multiply_3=x4.*x1;
x_multiply_4=(1+0.5*x2).*x5; %AM and FM
x_multiply_5=(1+0.5*x2).*x6; %AM and FM

plotter(t,[x_multiply_1;x_multiply_2;x_multiply_3;x_multiply_4;x_multiply_5],"Multiplication of signals");

%END