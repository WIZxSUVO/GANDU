% 1. Load a clean audio file (replace with your file name)
[y_clean, Fs] = audioread('your_audio_file.wav'); 
y_mono = y_clean(:, 1); % Convert to mono if it is stereo

% 2. Create a time vector for the noise
t = (0:length(y_mono)-1)' / Fs; 

% 3. Generate a high-frequency noise tone
% Let's use 8000 Hz, which should be well into the stopband of your filter
f_noise = 8000; 
amplitude = 0.1; % Adjust this to make the noise louder or quieter
high_freq_noise = amplitude * sin(2 * pi * f_noise * t);

% 4. Add the noise to the clean audio
y_noisy = y_mono + high_freq_noise;

% 5. Normalize to prevent audio clipping (keep values between -1 and 1)
y_noisy = y_noisy / max(abs(y_noisy));

% Listen to your creation (Warning: might be annoying!)
sound(y_noisy, Fs);

% Save it as a new file so you can use it for Question 3
audiowrite('noisy_test_file.wav', y_noisy, Fs);