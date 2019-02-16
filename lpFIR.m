% Assignment 3 Question 4.4
% Design a linear-phase lowpass FIR filter of length N = 25 with cutoff
% frequency at 12.5 MHz, assuming a sampling rate of 100 MHz. Use the 
% Hamming window. Plot the amplitude response in terms of dB vs frequency
% in MHz 

N = 25;              % filter length
wc = 0.25;           % cutoff frequency 12.5MHz=0.25pi if pi=fs/2= 50MHz                     
M = (N-1)/2;         % 
n = 0:1:N-1;         %

% Generate impulse response of the ideal filter
hd = wc*sinc((n-M)*wc); 

% Generate a hamming window function
w = hamming(N);
w = reshape(w,[1 25]);

% Obtain impulse response
h = w.*hd;

mx = 1.25*max(max(h));
mn = 1.25*min(min(h));

figure(1)
subplot(121)
plot(h)
axis([1 N mn mx])
axis('square')
grid
title('Impulse response of the FIR filter')

% Evaluate frequency response of the filter and plot
[H,w] = freqz(h,1,1024);
w = w*50/pi;
figure(2)
plot(w,20*log10(abs(H)))
axis([0 50 -100 10])
axis('square')
grid
title('Amplitude response of the FIR filter')
xlabel('Frequency [Mhz]')


