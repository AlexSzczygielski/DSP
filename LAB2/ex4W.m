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

fs=1000; Nx=10*fs; % sampling frequency, number of samples
df = 200;
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)

base_signal =sin(2*pi*1*t); % sine 1 Hz
FM_sin=sin(2*pi*(10*t-(9/(2*pi*1)*cos(2*pi*1*t)))); % sinus. FM: 9Hz around 10Hz, 1 per sec
x1 =(1+0.5*base_signal).*FM_sin; % first signal - AM