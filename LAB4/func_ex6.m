function [w1,w2,x,X1,X2,error1,error2] = func_ex6(N,w_which_window,x,A,S,fk)
%rest from listing
% Window
w1 = boxcar(N)'; % rectangular window
w2 = chebwin(N,100)'; % Chebyshev window
w = w_which_window; scale = 1/sum(w); % choice: w1, w2 or some other window


% Windowing
x = x.*w; % signal windowing
% DFT of the signal
X1 = A*x.'; % our code
X2 = fft(x.'); % Matlab function
error1 = max(abs(X1-X2)), % error versus Matlab, should be very small

%
% Error small, so spectras identical
%

X = X2; % choice
% DFT spectrum interpretation with appropriate scaling
X = scale*X; % amplitude scaling

figure;
subplot(211); plot(fk,real(X),'o-'); title('real(X(f))');
subplot(212); plot(fk,imag(X),'o-'); title('imag(X(f))');

figure;
subplot(211); plot(fk,20*log10(abs(X)),'o-'); title('abs(X(f)) [dB]');
subplot(212); plot(fk,angle(X),'o-'); title('angle(X(f))')
% DFT spectrum modification
% X(1+10)=0; X(N-10+1)=0; % removing signal x1 with freq. 10*f0
% Inverse DFT - signal synthesis
y = S*X; % signal reconstruction

figure; % output
subplot(211); plot(real(y),'bo-'); title('real(y(n))'); grid;
subplot(212); plot(imag(y),'bo-'); title('imag(y(n))'); grid;
error2 = max(abs(x-real(y))), % signal reconstruction error;
end

