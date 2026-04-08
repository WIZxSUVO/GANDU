fs = 8000;          % Sampling frequency (Hz)
fc_lp = 2000;       % Low-pass cutoff frequency (Hz)
fc1_bp = 2500;      % Band-pass lower cutoff (Hz)
fc2_bp = 3000;      % Band-pass upper cutoff (Hz)

N1 = 21;            % Filter length 21
N2 = 41;            % Filter length 41

b21 = fir1(N1-1, [fc1 fc2]/(fs/2), hamming(N1));
b41 = fir1(N2-1, [fc1 fc2]/(fs/2), hamming(N2));

figure;
freqz(b21,1,1024,fs);
title('BPF Hamming Window (N=21)');

figure;
freqz(b41,1,1024,fs);
title('BPF Hamming Window (N=41)');