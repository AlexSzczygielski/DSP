% ex 5.13
clear all; close all; clc;

% Load the audio file
Fs = 44100;
y = audioread('piano.mp3');
y = mean(y,2); %reduce the mono

% Parameters for spectrogram analysis

window_length = 512; 
window_shift = 206;
fft_length = 1024;

% Calculate the spectrogram
spectrogram(y, window_length, window_shift, fft_length, Fs, 'yaxis');
title('Spectrogram of Piano Recording');

%% synthesized sound
Fs = 44100;

% code from 2.7

synthes = [notes(1,1.2),notes(2,1),notes(3,0.7),notes(4,0.6),notes(5,0.6),notes(6,1.2),notes(7,1),notes(8,1.2)];

figure()
spectrogram(synthes, window_length, window_shift, fft_length, Fs, 'yaxis');
title('Spectrogram of synthes');

sound(y,Fs);
% Play the synthesized sound
pause(5);
sound(synthes, Fs);