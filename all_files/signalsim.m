close all 
clear all

% Parameter values
N=500; % Number of samples in the realization
f1=10; f2=20; % Frequencies of the harmonic process
sigma1=2; sigma2=2; % Parameters for Rayleigh distributed amplitudes 
fs=256; % Sample frequency



% Create data
n=[0:N-1]'; % Time sample vector
A1=raylrnd(sigma1) 
A2=raylrnd(sigma2) % Rayleigh distributed amplitudes
fi1=2*pi*rand; fi2=2*pi*rand; % Uniformly distributed phases 0 to 2pi

% Simulated data sequence 
x=A1*cos(2*pi*f1/fs*n+fi1)+A2*cos(2*pi*f2/fs*n+fi2);

% Time vector relating the sample vector to a time scale corresponding to the sampling frequency
t=n/fs; 

% Visualize the realization
plot(t,x)
xlabel('Time (s)')
title('Realization')