function [] = listen(t,signal,fs,bits)
% t - time of signal,
% signal - calculated array
% fs - sampling freq
% bits - bits

sound(signal,fs,8)
% wait for the sound to end
pause(t(end) + 0.5)
end

