clc; clear; close all;

% Define the notes and their corresponding frequencies for Chopin's Nocturne Op. 9 No. 2
notes = {'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', 'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', ...
         'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', 'F#4', 'C#4', 'B3', 'C#4', 'E4', 'C#4', 'B3', 'C#4', ...
         'G#4', 'E4', 'D#4', 'E4', 'G#4', 'E4', 'D#4', 'E4', 'A4', 'F#4', 'E4', 'F#4', 'A4', 'F#4', 'E4', 'F#4', ...
         'B4', 'G#4', 'F#4', 'G#4', 'B4', 'G#4', 'F#4', 'G#4', 'C#5', 'A4', 'G#4', 'A4', 'C#5', 'A4', 'G#4', 'A4', ...
         'B4', 'G#4', 'F#4', 'G#4', 'B4', 'G#4', 'F#4', 'G#4', 'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', ...
         'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', 'E4', 'B3', 'A#3', 'B3', 'D#4', 'B3', 'A#3', 'B3', ...
         'F#4', 'C#4', 'B3', 'C#4', 'E4', 'C#4', 'B3', 'C#4', 'G#4', 'E4', 'D#4', 'E4', 'G#4', 'E4', 'D#4', 'E4', ...
         'A4', 'F#4', 'E4', 'F#4', 'A4', 'F#4', 'E4', 'F#4', 'B4', 'G#4', 'F#4', 'G#4', 'B4', 'G#4', 'F#4', 'G#4'};

% Define the corresponding frequencies of the notes
frequencies = [329.63, 246.94, 233.08, 246.94, 311.13, 246.94, 233.08, 246.94, 329.63, 246.94, 233.08, 246.94, ...
               311.13, 246.94, 233.08, 246.94, 329.63, 246.94, 233.08, 246.94, 311.13, 246.94, 233.08, 246.94, ...
               370.00, 277.18, 246.94, 277.18, 329.63, 277.18, 246.94, 277.18, 415.30, 329.63, 311.13, 329.63, ...
               415.30, 329.63, 311.13, 329.63, 493.88, 370.00, 329.63, 370.00, 493.88, 370.00, 329.63, 370.00, ...
               493.88, 370.00, 329.63, 370.00, 493.88, 370.00, 329.63, 370.00, 329.63, 246.94, 233.08, 246.94, ...
               311.13, 246.94, 233.08, 246.94, 329.63, 246.94, 233.08, 246.94, 311.13, 246.94, 233.08, 246.94, ...
               329.63, 246.94, 233.08, 246.94, 311.13, 246.94, 233.08, 246.94, 370.00, 277.18, 246.94, 277.18, ...
               329.63, 277.18, 246.94, 277.18, 415.30, 329.63, 311.13, 329.63, 415.30, 329.63, 311.13, 329.63, ...
               493.88, 370.00, 329.63, 370.00, 493.88, 370.00, 329.63, 370.00, 493.88, 370.00, 329.63, 370.00, ...
               493.88, 370.00, 329.63, 370.00];



% Sampling frequency
fs = 44100;

x1 = sin(2*pi*frequencies('E4')*(0:1/fs:1.415));

% Play the audio
sound(audio, fs);