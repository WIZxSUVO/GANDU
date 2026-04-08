clc;
clear;
close all;

n = -8:7;
h = zeros(size(n));

for k = 1:length(n)
    if n(k) == 0
        h(k) = 0.5;
    else
        h(k) = sin(0.5*pi*n(k))/(pi*n(k));
    end
end

N = 512;
H = fft(h, N);
w = linspace(-pi, pi, N);

figure;
subplot(2,1,1);
plot(w/pi, fftshift(abs(H)));
xlabel('\omega/\pi');
ylabel('|H|');
title('Magnitude Response');

subplot(2,1,2);
plot(w/pi, fftshift(angle(H)));
xlabel('\omega/\pi');
ylabel('Phase');
title('Phase Response');