clc;
clear;
close all;

recObj = audiorecorder(8000,16,1);
disp('Start speaking...');
recordblocking(recObj, 3);
disp('Recording stopped.');

x = getaudiodata(recObj);
N = length(x);

X = fft(x);
f = (0:N-1)*(8000/N);

figure;
plot(f, abs(X));
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
title('Magnitude Spectrum of Voice Signal');