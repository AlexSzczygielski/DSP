% dsp04_ex14_dft.m
clear all; close all

%Reading the audio file into the script
[x, fs] = audioread('engine.mp3');
x = mean(x, 2);
t = (0:length(x)-1) / fs;

%DFT of the signal 
X = fftshift(fft(x));
N = length(x);
frequency = (0:length(X)-1) * fs / length(X);

%plot in time and in freq
figure(1)
    subplot(2, 1, 1)
        plot(t, x); xlabel('seconds'); title('sound in time domain');
    subplot(2, 1, 2)
        plot(frequency, abs(X)); xlabel('Freq'); title('DFT of the sound');
    sgtitle('sound in time and frequency domain');

% listen
sound(x, fs);
pause(5);

%%
% chosen operations on sound:

%time reverse
reverse = flip(x);

fft_reverse = fftshift(fft(reverse));

figure
        subplot(2, 2, 1)
            plot(t,x); xlabel('time'); title('original in time domain');
        subplot(2, 2, 2)
            plot(t,reverse); xlabel('time'); title('reversed in time domain');
        subplot(2,2,3)
            plot(t,abs(X)); xlabel('freq'); title('original in freq domain');
        subplot(2,2,4)
            plot(t,abs(fft_reverse)); xlabel('freq'); title('reversed in freq domain');
            sgtitle('reverse')
sound(reverse,fs);
pause(5);

%conjugate
conjugate1 = conj(x);

fft_conj1 = (fft(conjugate1));


% plot
figure
        subplot(2, 2, 1)
            plot(t,x); xlabel('time'); title('original in time domain');
        subplot(2, 2, 2)
            plot(t,conjugate1); xlabel('time'); title('conjugate in time domain');
        subplot(2,2,3)
            plot(t,abs(X)); xlabel('freq'); title('original in freq domain');
        subplot(2,2,4)
            plot(t,abs(fftshift(fft_conj1))); xlabel('freq'); title('conjugate in freq domain');
            sgtitle('conjugate')

sound(conjugate1,fs);
pause(5);

% convolution
% window function y
y = hanning(N);

convolution1 = conv(x,y);
fft_convolution1 = fftshift(fft(convolution1));

%plot 



