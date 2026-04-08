fs = 8000;          % Sampling frequency (Hz)
fc_lp = 2000;       % Low-pass cutoff frequency (Hz)


N1 = 21;            % Filter length 21
N2 = 41;            % Filter length 41

b_rect_21 = fir1(N1-1, fc_lp/(fs/2), rectwin(N1));
b_rect_41 = fir1(N2-1, fc_lp/(fs/2), rectwin(N2));

figure;
freqz(b_rect_21,1,1024,fs);
title('LPF Rectangular Window (N=21)');
figure;
freqz(b_rect_41,1,1024,fs);
title('LPF Rectangular Window (N=41)');