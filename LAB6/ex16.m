% ex 16
clear all; close all; clc;

[heart, Fs] = audioread('EKG.mp3');
heart = mean(heart,2); %reduce to the mono

[empty,peaks] = findpeaks(heart,'MinPeakHeight',0.001*max(heart)); % peaks 
                                                                   % with highest amplitude
                                                                   % 0.001
                                                                   % to
                                                                   % filter
                                                                   % noise
interbit_intervals = diff(peaks); %time between peaks
x = abs(fft(heart)); x = x(1:length(heart)/2);

figure;
subplot(2,1,1);
plot(x); title('FFT of EKG'); xlabel('Frequency [Hz].'); ylabel('Magnitude.');

autocorrelation = xcorr(interbit_intervals); %using cross corelation to calculate autocorrelation

subplot(2,1,2);
plot(autocorrelation); title('Autocorrelation of interbit intervals.'); xlabel('Lag'); ylabel('Autocorrelation');

[peaks, peak_locs] = findpeaks(autocorrelation);

periodicity = mean(diff(peak_locs));

estimated_periodicity_seconds = (periodicity/2)
sound(heart, Fs);