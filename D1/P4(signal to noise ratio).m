clc;
clear;
close all;

% Read speech file
[x, Fs] = audioread('SPEECH2.wav');
x = mean(x,2);   % convert to mono

% Time axis
t = (0:length(x)-1)/Fs;

% Plot input speech
figure;
plot(t, x);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Input Speech Signal');
grid on;

% Bit variation
bits = 2:8;
SNR = zeros(1,length(bits));

for i = 1:length(bits)
    B = bits(i);
    L = 2^B;

    xmax = max(abs(x));
    delta = 2*xmax/L;

    xq = delta * round(x/delta);
    e = x - xq;

    SNR(i) = 10*log10(sum(x.^2)/sum(e.^2));
end

% Plot SNR vs bits
figure;
plot(bits, SNR, '-o');
xlabel('Number of bits per sample');
ylabel('SNR_q (dB)');
title('SNR vs Number of Bits');
grid on;