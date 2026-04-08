clc;
clear;
close all;

wc = 0.45*pi;        % Cutoff frequency

a = exp(-wc);        % Filter coefficient

% Single stage transfer function
b1 = (1-a);
a1 = [1 -a];

% Frequency response of single stage
figure;
freqz(b1,a1);
title('Single Stage IIR Low Pass Filter');

% Cascade of four first order filters
b2 = conv(conv(conv(b1,b1),b1),b1);
a2 = conv(conv(conv(a1,a1),a1),a1);

% Frequency response of cascade filter
figure;
freqz(b2,a2);
title('Cascade of Four First Order IIR Filters');