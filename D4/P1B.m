clc; clear; close all;

fs = 8000;
fc = 2000;
N = 41;

k = 0:N-1;
H = zeros(1,N);

for i = 1:N
    f = (i-1)*fs/N;
    if f <= fc || f >= (fs-fc)
        H(i) = 1;
    else
        H(i) = 0;
    end
end

h = real(ifft(H));

disp('FIR Coefficients (N=41):');
disp(h.');

[Hf,w] = freqz(h,1,1024,fs);
figure;
plot(w,abs(Hf));
title('Low Pass FIR (N=41)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;