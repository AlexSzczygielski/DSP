% Ex5 Szczygielski 410110
% Digital Signal Processing, AGH

clc; clear; close all; 

[x0, fs2] = audioread("speech.wav");
x1 = x0(1:end/2); x2 = x0(end/2+1:end); % divide x0 into x1 and x2
%pause(1); soundsc(x0, fs2)
fc = 48e3; %carrier frequency
fs1 = 192e3; %sampling frequency

%upsampling
x1up = interp(x1, fs1/fs2);
x2up = interp(x2, fs1/fs2);
Nx = length(x2up);

%modulation
x=(1+0.5*x1up).*cos(2*pi*((fc*(0:Nx-1)/fs1).'+10e3*cumsum(x2up)/fs1));
figure; plot(x); title("AM + FM upsampled")

%analytic
xA = hilbert(x);
figure; plot(abs(xA)); title("AM upsampled")
% pause(1); soundsc(abs(xA), fs1);

ang = unwrap(angle( xA ));
xF = (1/(2*pi)) * (ang(3:end)-ang(1:end-2)) / (2/fs1) - fc;
figure; plot(xF); title("FM upsampled")
% pause(1); soundsc(xF, fs1);

%downsample back to 8khz
xAdown = decimate(abs(xA), fs1/fs2);
figure; plot(xAdown); title("AM downsampled")
% pause(1); soundsc(xAdown, fs2)

errA = mean(abs(x1-(2*(xAdown-1))))

xFdown = decimate(xF, fs1/fs2);
figure; plot(xFdown); title("FM downsampled")
% pause(1); soundsc(xFdown, fs2)
errF = mean(abs(x2-(xFdown/10e3)))

y = [2*(xAdown-1); xFdown/10e3];
figure; hold on;
plot(x0), plot(y)
% pause(1); soundsc(y, fs2)
err = mean(abs(x0 - y))