% 1. Load the audio file (Question 3 requirement)
[y, Fs] = audioread('noisy_test_file.wav'); 

% 2. Extract one channel if it's stereo 
y_mono = y(:, 1); 

% 3. THIS IS THE CONNECTION: 
% Use the variable from Question 1 (h_black_41) as the first input.
% The '1' is the denominator (FIR filters always use 1 here).
% 'y_mono' is the audio you just loaded.



% Applying the Length 21 filters from Question 2
audio_rect_21  = filter(h_rect_21, 1, y_mono);
audio_hamm_21  = filter(h_hamm_21, 1, y_mono);
audio_hann_21  = filter(h_hann_21, 1, y_mono);
audio_black_21 = filter(h_black_21, 1, y_mono);

% Applying the Length 41 filters from Question 2
audio_rect_41  = filter(h_rect_41, 1, y_mono);
audio_hamm_41  = filter(h_hamm_41, 1, y_mono);
audio_hann_41  = filter(h_hann_41, 1, y_mono);
audio_black_41 = filter(h_black_41, 1, y_mono);

% Calculate the duration of one of the clips (they should all be the same length)
duration = length(audio_rect_21) / Fs;
gap = 1; % 1 second of silence between tracks

disp('Playing Rectangular 21...');
sound(audio_rect_21, Fs);
pause(duration + gap);

disp('Playing Rectangular 41...');
sound(audio_rect_41, Fs);
pause(duration + gap);

disp('Playing Hamming 21...');
sound(audio_hamm_21, Fs);
pause(duration + gap);

disp('Playing Hamming 41...');
sound(audio_hamm_41, Fs);
pause(duration + gap);

disp('Playing Hanning 21...');
sound(audio_hann_21, Fs);
pause(duration + gap);

disp('Playing Hanning 41...');
sound(audio_hann_41, Fs);
pause(duration + gap);

disp('Playing Blackman 21...');
sound(audio_black_21, Fs);
pause(duration + gap);

disp('Playing Blackman 41...');
sound(audio_black_41, Fs);
pause(duration + gap);
