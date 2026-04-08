clc; clear; close all;

fs = 8000;        % Sampling frequency
fc = 2000;        % Cutoff frequency
N = 21;           % Filter length

k = 0:N-1;
H = zeros(1,N);

% Ideal frequency samples
for i = 1:N
    f = (i-1)*fs/N;
    if f <= fc || f >= (fs-fc)
        H(i) = 1;
    else
        H(i) = 0;
    end
end

% Impulse response using IFFT
h = real(ifft(H));

disp('FIR Coefficients (N=21):');
disp(h.');

% Frequency response
[Hf,w] = freqz(h,1,1024,fs);
figure;
plot(w,abs(Hf));
title('Low Pass FIR (N=21)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;