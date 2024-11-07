% Ex11
% AGH, Wiet, DSP 2024
% Szczygielski

% design a bandpass filter using Matlab function filterBuilder
clear all; close all;
%filterBuilder
% 3 filters built:

%theses lines load filters into workspace and open their edit view
load ex11_1_bandpass.mat
filterBuilder(ex11_1_bandpass)

load ex11_2_bandpass.mat
filterBuilder(ex11_2_bandpass)

load ex11_3_bandpass.mat
filterBuilder(ex11_3_bandpass)


%additionally each of them has generated matlab code
