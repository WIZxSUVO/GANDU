clc;
clear;
close all;

alpha = 9;      % positive constant
N = 20;         % number of samples

y = zeros(1, N+1);   % extra space for index shift
x = alpha * ones(1, N+1);

% Initial condition
y(1) = 1;   % y[-1] = 1

% System implementation
for n = 2:N+1
    y(n) = 0.5 * ( y(n-1) + x(n)/y(n-1) );
end

% Correct time index
n_index = -1:N-1;

% Plot
stem(n_index, y, 'filled');
xlabel('n');
ylabel('y[n]');
title('Convergence of y[n] to sqrt(\alpha)');
grid on;

disp(['Theoretical value sqrt(alpha) = ', num2str(sqrt(alpha))]);