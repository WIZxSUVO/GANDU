fs = 8000;          % Sampling frequency (Hz)
fc_lp = 2000;       % Low-pass cutoff frequency (Hz)

N1 = 21;            % Filter length 21
N2 = 41;            % Filter length 41

b_hann_21 = fir1(N1-1, fc_lp/(fs/2), hann(N1));
b_hann_41 = fir1(N2-1, fc_lp/(fs/2), hann(N2));

figure;
freqz(b_hann_21,1,1024,fs);
title('LPF Hanning Window (N=21)');
figure;
freqz(b_hann_41,1,1024,fs);
title('LPF Hanning Window (N=41)');