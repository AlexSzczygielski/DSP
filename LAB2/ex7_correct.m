% dsp02_ex_deterministic.m
% 2.7 - singing a song
% AS

close all; clear all;
% Define the chord progression and their corresponding frequencies
chords = {'A(1)', 'Bm(2)', 'Cm(3)', 'D(4)', 'E(5)', 'Fm(6)','G(7)','Silence(8)'};

fs = 44100;
song = [notes(1,1),notes(2,1),notes(3,1),notes(4,1),notes(5,1),notes(6,1)];
sound(song,fs);
pause(8);

dire_straits = [notes(4,1),notes(8,0.4),notes(4,1.2),notes(4,0.7),notes(3,0.5), notes(4,0.5),notes(6,1.5),notes(4,0.5),notes(3,0.8),notes(2,0.6),notes(8,0.4),notes(7,0.4),notes(8,0.4),notes(7,0.6),notes(8,0.5),notes(7,2),notes(8,0.4),notes(2,0.6),notes(8,0.4),notes(4,0.6),notes(8,0.4),notes(4,0.6)];
sound(dire_straits,fs);