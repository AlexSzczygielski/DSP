% Ex 6 - DSP, AGH
%Aleksander Szczygielski

clc; clear; close all;

%Importing audio files
[speech, fs] = audioread('DSP.mp3');
speech = mean(speech, 2);
[birds, ~] = audioread('birds.mp3');
birds = mean(birds, 2);

% mixing sounds
%x = speech;
x = speech.*3; %increase amplitude
y = birds;

%Appending zeros to the shorter signal
if length(x) > length(y) 
    y = [y; zeros(length(x) - length(y), 1)];
else
    x = [x; zeros(length(y) - length(x), 1)];
end

%combining 2 signals
combined = x + y;

sound(combined, fs);

%plotting vector
omega = linspace(-fs/2, fs/2, length(combined));

%fft
X = fft(x);
Y = fft(y);
COMB = fft(combined);

%Parameters for the spectogram (window)
window_length = 256; 
window_shift = window_length/2; 
fft_length = window_length*2;

%Plotting

%DSP
figure(1);
    subplot(2, 1, 1)
        plot(omega, fftshift(abs(X)), "Linewidth", 2); xlabel('Frequency'); ylabel('|X|'); grid on; hold on; title('FFT spectrum of speech');
    subplot(2, 1, 2)
        spectrogram(X, hann(window_length), window_shift, fft_length, fs, 'yaxis');  title('Spectogram of first audio'); 

%Birds chirping
figure(2);
    subplot(2, 1, 1)
        plot(omega, fftshift(abs(Y)), "Linewidth", 2); xlabel('Frequency'); ylabel('|Y|'); grid on; hold on; title('FFT spectrum of birds chirping');
    subplot(2, 1, 2)
    spectrogram(birds, hann(window_length), window_shift, fft_length, fs, 'yaxis');  title('Spectogram of birds'); 
    
%mixed 
figure(3);
    subplot(2, 1, 1)
        plot(omega, fftshift(abs(COMB)), "Linewidth", 2); xlabel('Frequency'); ylabel('|X|'); grid on; hold on; title('FFT spectrum of mixed audio');
    subplot(2, 1, 2)
        spectrogram(combined, hann(window_length), window_shift, fft_length, fs, 'yaxis');  title('Spectogram of mixed audio');

%DESIGNING THE FILTER IN TWO METHODS

%Cutoff frequencies
fc1 = 1200;
fc2 = 5200;


        fc = [fc1 fc2]/(fs/2);
        order = 80;

        %Using the function to create the filter
        b = fir1(order, fc, 'stop', hamming(order+1)); %window based matlab function

%Plotting the filter frequency responses
figure(4);
    freqz(b, 1, 1024, fs); title("Frequency response of the created Band-Stop filter");
 
%Plotting the zeros of the transfer function
z = roots(b); % roots of nominator polynomial
figure;
var = 0 : pi/1000 : 2*pi; c=cos(var); s=sin(var);
plot(real(z),imag(z),'bo', c,s,'k-'); grid; axis([-5 5 -5 5]);
title('TF Zeros'); xlabel('Real()'); ylabel('Imag()'); 

%Filtering the bird sound out of the combined audio
filtered = filter(b, 1, combined);
FILTERED = fft(filtered);

%Listening to the obtained audio (filtered out)
pause(6);
sound(filtered, fs);

%Plots of sound after filtration
figure(6);
    subplot(2, 1, 1)
        plot(omega, fftshift(abs(FILTERED)), "Linewidth", 2); xlabel('Frequency'); ylabel('|X|'); grid on; hold on; title('FFT spectrum of the filtered audio');
    subplot(2, 1, 2)
        spectrogram(filtered, hann(window_length), window_shift, fft_length, fs, 'yaxis');  title('Spectogram of filtered audio'); 


