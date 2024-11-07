% ex 7.7
% A Szczygielski
clc; clear; close all;

% Requirements
N = 5;              % poles in analog prototype
fc = 1;             % for LowPass and HighPass
f1 = 10; f2=100;    % for BandPass and BandStop
Rp = 3;             % allowed oscillation in the pass-band (dB)
Rs = 20;            % allowed oscillation in the stop-band (dB)

% Value of N increases - the filter becomes sharper (better)

% Design of analog LowPass prototype filters for w0 = 1
w = 0 : 0.01 : 10;        % radial frequencies of interest

[z,p,gain] = buttap(N);          % analog Butterwoth prototype
%[z,p,gain] = cheb1ap(N,Rp);      % analog Chebyshev 1 prototype
%[z,p,gain] = cheb2ap(N,Rs);      % analog Chebyshev 2 prototype
%[z,p,gain] = ellipap(N,Rp,Rs);   % analog elliptic prototype

b = gain*poly(z);                  % [z,gain] --> b      
a = poly(p);                       % p --> a
H = freqs(b,a,w);                  % filter frequency response using Matlab  

%Plot of the amplitude response before the transformation
figure; semilogx(w, abs(H), "Linewidth", 2); grid on; hold on; xlabel('w [rad/s]'); title('H(s) before transformation');
      
% Frequency transformation: Normalized (w0=1) LowPass --> DifferentPass
% Functions xx2yy from Signal Processing Toolbox
%[b,a] = lp2lp(b,a,2*pi*fc);                         % LowPass to LowPass
%[b,a] = lp2hp(b,a,2*pi*fc);                         % LowPass to HighPass
%[b,a] = lp2bp(b,a,2*pi*sqrt(f1*f2),2*pi*(f2-f1));   % LowPass to BandPass
[b,a] = lp2bs(b,a,2*pi*sqrt(f1*f2),2*pi*(f2-f1));   % LowPass to BandStop

z=roots(b); p=roots(a);

% Verification of filter responses(FRs): amplitude, phase, impulse, step                        
f = 0:0.1:1000;
w =2*pi*f;
s =1i*w;                          

H = polyval(b,s) ./ polyval(a,s);  % FR=TF for s=j*w: ratio of two polynomials

%Plot of the amplitude response after the transformation
figure; semilogx(f, abs(H), "Linewidth", 2); grid on; hold on; xlabel('f [hz]'); title('H(s) after transformation');
