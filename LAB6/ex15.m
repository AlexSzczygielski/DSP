% ex 5.13
clear all; close all; clc;

Fs = 44100; 
wow_sound1 = audioread('Ekscyt.m4a'); 
wow_sound2 = audioread('Astonish.m4a'); 
wow_sound3 = audioread('Fear.m4a'); 

figure(1);
subplot(3,1,1);
spectrogram(wow_sound1, 1024, 512, 2048, Fs, 'yaxis'); %window legth - duration of each 
title('Excited');                                      % segment of the signal 
                                                       %Longer - better freq resolution but
                                                       % poorer time resolution
                                                       %shorter - ----
                                                       %overlap -
                                                       %winlength/2, number
                                                       %of windows by which
                                                       % they overlap
                                                       % fft - frequency of
                                                       % resolutions


subplot(3,1,2);
spectrogram(wow_sound2, 1024, 512, 2048, Fs, 'yaxis');
title('Astonished');

subplot(3,1,3);
spectrogram(wow_sound3, 1024, 512, 2048, Fs, 'yaxis');
title('Fear');

sound(wow_sound1, Fs); pause(3);
sound(wow_sound2, Fs); pause(3);
sound(wow_sound3, Fs);