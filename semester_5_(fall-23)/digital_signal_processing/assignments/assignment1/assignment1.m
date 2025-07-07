clc;
clear all;
close all;

% Define parameters
A = 1.5;
n = -10:10;

% Real exponential sequences
alpha1 = -0.5;
x1 = A * alpha1.^n;

alpha2 = 0.7;
x2 = A * alpha2.^n;

alpha3 = 1.1;
x3 = A * alpha3.^n;


% Plot real exponential sequences
subplot(2, 3, 1);
stem(n, x1, 'r');
title('Real Sequence (\alpha = -0.5)');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2, 3, 2);
stem(n, x2, 'g');
title('Real Sequence (\alpha = 0.7)');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2, 3, 3);
stem(n, x3, 'b');
title('Real Sequence (\alpha = 1.1)');
xlabel('n');
ylabel('x[n]');
grid on;


% Complex exponential sequences
A_complex = 2;
alpha_complex1 = -0.5;
x_complex1 = A_complex * exp(1j * 0.4 * n) .* alpha_complex1.^n;

alpha_complex2 = 0.7;
x_complex2 = A_complex * exp(1j * 0.4 * n) .* alpha_complex2.^n;

alpha_complex3 = 1.1;
x_complex3 = A_complex * exp(1j * 0.4 * n) .* alpha_complex3.^n;

% Plot complex exponential sequences
subplot(2, 3, 4);
stem(n, x_complex1, 'r');
title('Complex Signal (\alpha = -0.5)');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2, 3, 5);
stem(n, x_complex2, 'g');
title('Complex Signal (\alpha = 0.7)');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2, 3, 6);
stem(n, x_complex3, 'b');
title('Complex Signal (\alpha = 1.1)');
xlabel('n');
ylabel('x[n]');
grid on;


% Display imaginary parts of complex sequences
figure;
subplot(2, 3, 1);
stem(n, imag(x_complex1), 'r');
title('Imaginary Part (|\alpha| < 1)');
xlabel('n');
ylabel('Im\{x[n]\}');
grid on;

subplot(2, 3, 2);
stem(n, imag(x_complex2), 'g');
title('Imaginary Part (|\alpha| < 1)');
xlabel('n');
ylabel('Im\{x[n]\}');
grid on;

subplot(2, 3, 3);
stem(n, imag(x_complex3), 'b');
title('Imaginary Part (|\alpha| > 1)');
xlabel('n');
ylabel('Im\{x[n]\}');
grid on;

% Plot real parts of complex exponential sequences
subplot(2, 3, 4);
stem(n, real(x_complex1), 'r');
title('Real Part (|\alpha| < 1)');
xlabel('n');
ylabel('Re\{x[n]\}');
grid on;

subplot(2, 3, 5);
stem(n, real(x_complex2), 'g');
title('Real Part (|\alpha| < 1)');
xlabel('n');
ylabel('Re\{x[n]\}');
grid on;

subplot(2, 3, 6);
stem(n, real(x_complex3), 'b');
title('Real Part (|\alpha| > 1)');
xlabel('n');
ylabel('Re\{x[n]\}');
grid on;