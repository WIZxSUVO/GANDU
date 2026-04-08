clc;
clear;
close all;

% Signal length
N = 50;
n = 0:N-1;

% Original signal
s = 2*(0.9).^n;

% Noise (uniformly distributed between -0.5 and 0.5)
d = -0.5 + (0.5+0.5)*rand(1, N);

% Noisy signal
x = s + d;

% Filter lengths
M_values = [5 7 9];

% Plot original and noisy signal
figure;
subplot(5,1,1);
stem(n, s, 'filled');
title('Original Signal s[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(5,1,2);
stem(n, x, 'filled');
title('Noisy Signal x[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

% Apply moving average filters
for i = 1:length(M_values)
    M = M_values(i);
    h = (1/M)*ones(1, M);     % Moving average filter
    y = filter(h, 1, x);     % Filtered output
    
    subplot(5,1,i+2);
    stem(n, y, 'filled');
    title(['Filtered Output y[n] with M = ', num2str(M)]);
    xlabel('n'); ylabel('Amplitude');
    grid on;
end