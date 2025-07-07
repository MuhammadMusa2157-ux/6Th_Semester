clc;
clear;
close all;

time = 0: 1/1000 : 1;
frequency = 5;
amplitude = 5;
signal = amplitude .* sin(2 * pi * frequency * time);

figure;
subplot(3, 1, 1);
plot(time, signal);
xlabel('Time');
ylabel('Amplitude');
title('Sin wave of 5 Hz');
grid on;

%% Gaussian Noise WIth Standard Deviation and Mean.

mean = 1;
std = 10;
[rows, cols] = size(time);
gaussian = mean + std * randn(cols, 1);
subplot(3, 1, 2);
plot(time, gaussian, 'k');
xlabel('Time');
ylabel('Amplitude');
title('Random Gaussian wave having \mu and \sigma');
grid on;

%% Add Gaussian with The Signal.

noisySignal = transpose(gaussian) + signal;
subplot(3, 1, 3);
plot(time, noisySignal);
xlabel('Time');
ylabel('Amplitude');
title('Random Gaussian + Sin Signal');
grid on;

%% Smoothing the noisy signal
figure;

smooth3 = smooth(noisySignal, 3);
subplot(3, 1, 1);
plot(time, smooth3, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Smoothing Noisy Signal with window 3');
grid on;

smooth5 = smooth(noisySignal, 5);
subplot(3, 1, 2);
plot(time, smooth5, 'm');
xlabel('Time');
ylabel('Amplitude');
title('Smoothing Noisy Signal with window 5');
grid on;

smooth7 = smooth(noisySignal, 7);
subplot(3, 1, 3);
plot(time, smooth7, 'b');
xlabel('Time');
ylabel('Amplitude');
title('Smoothing Noisy Signal with window 7');
grid on;