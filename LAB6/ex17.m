%ex 17
clc; clear; close all;

%Import impulse response
[impulse_response,fs] = audioread('cave_IR.mp3');
impulse_response = mean(impulse_response, 2); %reduce to mono

%get audio
[song, fs] = audioread('direstraits.mp3');

% add zeros if song too short
if length(impulse_response) > length(song)
    song = [song; zeros(length(impulse_response) - length(song), 1)];
else
    impulse_response = [impulse_response; zeros(length(song) - length(impulse_response), 1)];
end

%fast convolution
together = ifft(fft(impulse_response).*fft(song));
together = together/max(abs(together)); %normalization

%Listening to the obtained sound
sound(together, fs);