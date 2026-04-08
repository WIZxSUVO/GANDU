clc;
clear;
close all;

% Input sequences
x = [1 2 3 4 5 6 7 8];   % Long sequence
h = [1 1 1];             % Small sequence

L = 3;                   % Block length
M = length(h);
N = L + M - 1;           % FFT length

% Zero-pad input to make length multiple of L
x = [x zeros(1, mod(-length(x), L))];

% Output length
y = zeros(1, length(x) + M - 1);

index = 1;

for i = 1:L:length(x)
    x_block = x(i:i+L-1);                 % Block of input
    y_block = ifft(fft(x_block, N) .* fft(h, N));  % Block convolution

    % Overlap-add operation
    y(index:index+N-1) = y(index:index+N-1) + y_block;

    index = index + L;
end

disp('Overlap-Add Output:');
disp(real(y));