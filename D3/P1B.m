fs = 8000;          % Sampling frequency (Hz)
fc_lp = 2000;       % Low-pass cutoff frequency (Hz)

N1 = 21;            % Filter length 21
N2 = 41;            % Filter length 41

b_ham_21 = fir1(N1-1, fc_lp/(fs/2), hamming(N1));
b_ham_41 = fir1(N2-1, fc_lp/(fs/2), hamming(N2));

figure;
freqz(b_ham_21,1,1024,fs);
title('LPF Hamming Window (N=21)');
figure;
freqz(b_ham_41,1,1024,fs);
title('LPF Hamming Window (N=41)');