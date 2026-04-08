clc;
clear;
close all;

x = [1 2 3 4];
h = [1 1 1];

% Direct linear convolution
y_direct = conv(x, h);

% DFT-based convolution
N = length(x) + length(h) - 1;
Y = ifft(fft(x, N) .* fft(h, N));

disp('Direct Convolution Result:');
disp(y_direct);

disp('DFT-based Convolution Result:');
disp(real(Y));