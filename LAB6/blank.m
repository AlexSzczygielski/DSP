%DIGITAL SIGNAL PROCESSING LAB 6
%EXERCISE 6.17 KONRAD WŁODARCZYK 417751

clc; clear; close all;

%Importing the impulse response
[impulse, ~] = audioread('cave_IR.mp3');
impulse = mean(impulse, 2);

%Importing the song
[onlyyou, fs] = audioread('direstraits.mp3');


if length(impulse) > length(onlyyou)
    onlyyou = [onlyyou; zeros(length(impulse) - length(onlyyou), 1)];
else
    impulse = [impulse; zeros(length(onlyyou) - length(impulse), 1)];
end

%Performing fast convolution algorithm
mixed = ifft(fft(impulse).*fft(onlyyou));
mixed = mixed/max(abs(mixed));

%Listening to the obtained sound
sound(mixed, fs);

%audiowrite('only_you_but_you_sit_in_a_cave.wav', mixed, fs);