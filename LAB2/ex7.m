% dsp02_ex_deterministic.m
% 2.7 - singing a song
% AS

close all; clear all;
% Define the chord progression and their corresponding frequencies
chords = {'A(1)', 'Bm(2)', 'Cm(3)', 'D(4)', 'E(5)', 'Fm(6)'};
frequencies = [440, 246.94, 277.18, 293.66, 329.63, 220];

fs = 44100;

% frequencies(chord), fs:duration of the sound
A = sin(2*pi*frequencies(1)*(0:1/fs:1.1)); 
Bm = sin(2*pi*frequencies(2)*(0:1/fs:1.1));
Cm = sin(2*pi*frequencies(3)*(0:1/fs:1.1));
D = sin(2*pi*frequencies(4)*(0:1/fs:1.1));
E= sin(2*pi*frequencies(5)*(0:1/fs:1.1));
Fm = sin(2*pi*frequencies(6)*(0:1/fs:1.1));

song = [A,Bm,Cm,D,E,Fm];
sound(song,fs);

dire_straits = [];