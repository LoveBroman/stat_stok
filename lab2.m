%{
C=1;
a1 = 1/0.5;
A = [1, a1];
subplot(221);
zplane(C, A)
%%
%Q2
subplot(222)
sigma = 1;
[H, w] = freqz(C*sigma, A,1024, 'whole');
R = abs(H).^2;
plot(w(1:513)/2/pi,R(1:513))
subplot(223)
r=ifft(R);
plot([0:39], r(1:40))
%%
%Q3
sigma2 = 1;
n = 150;
e = sqrt(sigma2)*randn(n, 1);
x = filter(C, A, e);
xstat = x(51:150);
subplot(224)
plot(xstat)
%}
%% Q4
%{
rhoa= 0.001;
freqa = 0.45;
p = [rhoa*exp(1i*2*pi*freqa), rhoa*exp(-1i*2*pi*freqa)]
A = poly(p)
subplot(221);
zplane(C, A)
subplot(222)
sigma = 1;
[H, w] = freqz(C*sigma, A,1024, 'whole');
R = abs(H).^2;
plot(w(1:513)/2/pi,R(1:513))
subplot(223)
r=ifft(R);
plot([0:39], r(1:40))
sigma2 = 1;
n = 150;
e = sqrt(sigma2)*randn(n, 1);
x = filter(C, A, e);
xstat = x(51:150);
subplot(224)
plot(xstat)
%}
%% Q5
%{
rhoc= 0.99;
freqc = 0.3;
p = [rhoc*exp(1i*2*pi*freqc), rhoc*exp(-1i*2*pi*freqc) .1]
C = poly(p)
A = 1;
subplot(221);
zplane(C, A)
subplot(222)
sigma = 1;
[H, w] = freqz(C*sigma, A,1024, 'whole');
R = abs(H).^2;
plot(w(1:513)/2/pi,R(1:513))
subplot(223)
r=ifft(R);
plot([0:39], r(1:40))
sigma2 = 1;
n = 150;
e = sqrt(sigma2)*randn(n, 1);
x = filter(C, A, e);
xstat = x(51:150);
subplot(224)
plot(xstat)
%}
%%Q8
%{

rhoa= 0.5;
freqa = 0.45;
p = [rhoa*exp(1i*2*pi*freqa), rhoa*exp(-1i*2*pi*freqa)]
A = poly(p)
rhoc= 0.99;
freqc = 0.3;
p1 = [rhoc*exp(1i*2*pi*freqc), rhoc*exp(-1i*2*pi*freqc) .1]
C = poly(p1)
subplot(221);
zplane(C, A)
subplot(222)
sigma = 1;
[H, w] = freqz(C*sigma, A,1024, 'whole');
R = abs(H).^2;
plot(w(1:513)/2/pi,R(1:513))
subplot(223)
r=ifft(R);
plot([0:39], r(1:40))
sigma2 = 1;
n = 150;
e = sqrt(sigma2)*randn(n, 1);
x = filter(C, A, e);
subplot(224);
plot(w(1:513)/2/pi,10 * log10(R(1:513)))
%}
%% Q9)
load speechdata
%sound(data, 48000)
b = fir1(100, 2000/fs*2)
h = freqz(b);
%plot(w/2/pi*fs, abs(H).^2)
datafilter = filter(b,1, data)
%sound(datafilter, fs)
%plot(datafilter)
subs =datafilter(13321:14280)
x = decimate(subs, 6);
fsdec = fs/6;
[arp, sigma2] = arcov(x, 22)
%% Q11
nfft = 1024;
Rx = abs(fft(x, nfft).^2/n);
[H, w] = freqz(1, arp, nfft, 'whole');
Rxar = sigma2*abs(H).^2;
f=w/2/pi*fs;
subplot(221)
%%plot(f, 10*log10(Rx),'b', f, 10*log10(Rxar), 'r');
legend('Periodgram' , 'AR-model');
subplot(222)
%plot(x, 10)

for ptest=1:80
    [arp, sigma2p(ptest)] = arcov(x, ptest)
end
n = length(x);
ptvect =[1:80];
FPE = sigma2p.*(n+ptvect+1)./(n-ptvect-1)
%%plot([1:80], FPE)
CompleteAR
    


