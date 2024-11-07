clc; clear; close all;  

% params
experiment_name = "Code for ex14";
rec_time = 2;
bits = 8;
fs = 8000;
channels = 1;
listen = 1;

recording = get_audio(fs, bits, channels, listen, rec_time);

% plots & calculations
% init params for plots
    Nx = length(recording);
    n= 0:Nx-1;
    dt = 1/fs;
    t = dt*n;

figure(1); 
        plot(recording,'bo-'); 
        xlabel('sample number n'); 
        title('x(n)'); grid;

figure(2)
        plot(t,recording,'b-'); 
        xlabel('t (s)'); 
        title('x(t)'); grid;



sound(recording,fs);
