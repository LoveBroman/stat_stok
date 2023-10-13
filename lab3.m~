NFFT = 4096;

%%Q1)
%{
e = randn(500, 1);
A = [1 -2.39 3.35 -2.34 0.96];
C = [1 0 1];
x = filter(C, A, e);
%%plot(x);
fs = 100;

tvect = 0:499;
%plot(tvect, x)
subplot(221);
periodogram(x, [], NFFT, fs);
%%
%Q2
subplot(222);
periodogram(x, hanning(500), NFFT, fs);
%%Q4
L = 91;
subplot(223);
pwelch(x, hanning(L), L/2, NFFT, fs)
%%
%1.3)
Rhate=periodogram(e, hanning(500), NFFT);
Rhatew = pwelch(e, hanning(L), L/2, NFFT);
var(Rhate)/var(Rhatew)
%}
%%
%2.1
%{
load sunspotdata
timenew
datanew = datanew - mean(datanew);
plot(timenew, datanew)
subplot(221);
periodogram(datanew, [], NFFT, 12);
subplot(222);
periodogram(dataold, [], NFFT, 12);
x = fft(datanew);
N = length(datanew);
Rhat = (x.*conj(x))/N;
f = [0:N-1]/N;
subplot(223)
plot(f, Rhat);
%}
%%
%2.2
%{
x = fft(datanew,NFFT);
Rhat = (x.*conj(x))/N;

f = [0:NFFT-1]/NFFT;
subplot(224);
plot(f, Rhat);
%}
%% 3. 1
load eegsingle
time(3) - time(2)
time(16) - time(15)
data = data - mean(data);
N = length(data);
x = fft(data,NFFT);
Rhat = (x.*conj(x))/N;

f = [0:NFFT-1]/NFFT;
%subplot(224);
%plot(f, Rhat);

%spectrogram(Rhat);

%% 3.2
load eegmulti
d = data(5)
N = length(d);
%data = data- mean(data)
x = fft(d,NFFT);
Rhat = (x.*conj(x))/N;
fs = 1/ (time(3) - time(2));
L = 256;
f = [0:NFFT-1]/NFFT;
%plot(f, Rhat);
%pwelch(x, hanning(L), L/2, NFFT, fs)
%ctrogram(Rhat);
pmtm(Rhat, 5, NFFT, fs);

[kappa2, f] = mscohere(data(:, 10), data(:,8), hanning(L), L/2,NFFT, fs);
plot(f, kappa2)

v = [];
for i = 1: 12
    
    [kappa2, f] = mscohere(data(:, 10), data(:,i), hanning(L), L/2,NFFT, fs);
    v(end+1) = mean(kappa2(1:500));
end
%%0.2795    0.2442    0.2619    0.2362    0.4661    0.4677    0.6092    0.8455    0.7012    1.0000

%%  Columns 11 through 12

%%    0.3575    0.2775







