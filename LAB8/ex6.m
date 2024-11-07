clc; clear all; close all;

[song, fs] = audioread('direstraits.mp3');

t = (0:length(song)-1) / fs; 
noise = 10 * sin(2*pi*1500*t); %noise
disturbed = song + noise'; % add disturbed
 

% Get frequency
freq = (0:length(song)-1) * fs / length(song);

Rp = 3; Rs = 80; freq = 1400; 
[b, a] = ellip(10, Rp, Rs, freq/(fs/2), 'low');

filtered = filter(b, a, disturbed);

%sound(disturbed, fs);
%pause(5)
sound(filtered, fs);
%%
clc; clear all; close all;

[song, fs] = audioread('direstraits.mp3');

t = (0:length(song)-1) / fs; 
f0 = 1500; 
df = 250;  
fm = 0.25; 

noise = cos(2*pi*f0*t + 2*pi*df*sin(2*pi*fm*t)); %base frequency and frequency 
                                                 % modulation components

disturbed = song + noise';


Rp = 3; Rs = 80; freq = 1000; 
[b, a] = ellip(10, Rp, Rs, freq/(fs/2), 'low');

filtered = filter(b, a, disturbed);

%sound(disturbed, fs); %siren from frequency modulation
%pause(5)
sound(filtered, fs);

