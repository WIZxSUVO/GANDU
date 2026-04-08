clc;
clear;
close all;

Fs = 80000;      % Sampling frequency
Fp = 4000;       % Passband frequency
Fst = 20000;     % Stopband frequency

Rp = 0.5;        % Passband ripple
Rs = 45;         % Stopband attenuation

Wp = 2*pi*Fp;    % Analog passband
Ws = 2*pi*Fst;   % Analog stopband

% Find filter order
[N,Wn] = buttord(Wp,Ws,Rp,Rs,'s');

% Analog Butterworth filter
[b,a] = butter(N,Wn,'s');

% Convert to digital using impulse invariance
[num,den] = impinvar(b,a,Fs);

% Frequency response
figure;
freqz(num,den);
title('Butterworth LPF using Impulse Invariance');