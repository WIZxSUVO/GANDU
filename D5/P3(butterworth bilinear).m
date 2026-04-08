clc;
clear;
close all;

Fs = 80000;      % Sampling frequency
Fp = 4000;       % Passband frequency
Fst = 20000;     % Stopband frequency

Rp = 0.5;        % Passband ripple
Rs = 45;         % Stopband attenuation

Wp = Fp/(Fs/2);     % Normalized passband
Ws = Fst/(Fs/2);    % Normalized stopband

% Find filter order
[N,Wn] = buttord(Wp,Ws,Rp,Rs);

% Digital Butterworth filter
[b,a] = butter(N,Wn);

% Frequency response
figure;
freqz(b,a);
title('Butterworth LPF using Bilinear Transformation');