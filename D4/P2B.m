clc; clear; close all;

fs = 8000;
f1 = 2500;
f2 = 3000;
N = 41;

H = zeros(1,N);

for i = 1:N
    f = (i-1)*fs/N;
    if (f >= f1 && f <= f2) || (f >= fs-f2 && f <= fs-f1)
        H(i) = 1;
    else
        H(i) = 0;
    end
end

h = real(ifft(H));

disp('Band Pass FIR Coefficients (N=41):');
disp(h.');

[Hf,w] = freqz(h,1,1024,fs);
figure;
plot(w,abs(Hf));
title('Band Pass FIR (N=41)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;