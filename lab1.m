load data;

%1.
%%
plot([data1 data2 data3]);

%Q1
%it looks like data1 and data2 is from the same stochastic process but not
%data3 but to the deviation isnt to big so it could. since all three got mean mean values larger than 0 it seems like the
%mean value is larger and not equal to zero which you can also see with the
%con interval.

m1 = mean(data1);
m2 = mean(data2);
m3 = mean(data3);
cm1 = [m1 - 1.96/2, m1 + 1.96/2];

cm2 = [m2 - 1.96/2, m2 + 1.96/2];

cm3 = [m3 - 1.96/2, m3 + 1.96/2];

%Q2
%none of them should have zero mean, reeal mean
%Q3 mean of means = 0.2001
% confint middle points
%%
%1.2 
load data2;


%[r, lags] = xcov(y, 20, 'biased');
%plot(lags, r);

%[rho, lags] = xcov(y, 20, 'coeff');
%plot(lags, rho)
clrs = ['.b', '.r', '.y'];
k=1;
%plot(y(1:end-k), y(k+1:end),clrs(1))
%%figure;
k=2;
%plot(y(1:end-k), y(k+1:end),clrs(2))
%%figure;
k=3;
%plot(y(1:end-k), y(k+1:end),clrs(3))
%Q4 rho r /v(y(s))*y(y(t))
% Q5 the view in the scatterplot relate to the correlation function is
%Something that can be seen since there is negative correlation for k=1
%positive for k=2 and almost none for k=3 which can be seen in corrplot
%%
%1.3
%signalsim
%figure;
%[r, lags] = xcov(x);
%plot(lags, r)
%Q7 Yes
%NFFT = 2048;
%[R, F] = periodogram(x, [], NFFT, fs);
%figure;
%plot(F);
%Q8 The periodicity of the realization and cov func relates to the 
% Frequency peaks since we can see that function consists of two different
% periodicities
%Q9 the differnce in height for different frequncies means that different 
% frequencies has different amplitude
%signalsim
NFFT=2048;
%[R, F] = periodogram(x, [], NFFT, fs);
%plot(F, R);
%figure;
%plot(F, 10*log10(R));
%Q10 A benefit with using logscale is that you can see that the function
%consists of many more frequencies, normal scale the outliers takes over
%therefor you can get more info by using a logscale

%% 2.1
load cellodiffA;
fs = 44100;
%sound( celloA4, 44100)
%sound( celloA2, 44100)
%sound( celloA3, 44100)

%[R, F] = periodogram(celloA4, [], NFFT, fs);
%plot(F, 10*log10(R));
%figure;
%[R, F] = periodogram(celloA2, [], NFFT, fs);
%plot(F, 10*log10(R));
%figure;
%[R, F] = periodogram(celloA3, [], NFFT, fs);
%plot(F, 10*log10(R));
%Q11
%A4 has a bigger spread in it's tone which gives it a larger breadth
%A2 and A3 are quiet common to each other as you can hear  on the sound
%%
%2.2
%{
load celloandflute;
%sound( fluteA41, 44100)
%[R, F] = periodogram(celloA41, [], NFFT, fs);
%plot(F, 10*log10(R));
%plot(F, 10*log10(R));
%figure;
%[R, F] = periodogram(fluteA41, [], NFFT, fs);
plot(F, 10*log10(R));
[R, F] = periodogram(celloA42, [], NFFT, fs);
%plot(F, 10*log10(R));
plot(F, 10*log10(R));
figure;
[R, F] = periodogram(fluteA42, [], NFFT, fs);
plot(F, 10*log10(R));
%}
%The flute has more variation in the difference in its amplitude, 
%Deeper valleys larger peaks
%2.3
load cellomelody;
%sound(melody2, 44100);
%{
NFFT = 8192;
window = 2048;
noverlap = 1024;
spectrogram(melody1, window, noverlap, NFFT, 'yaxis')
figure;
spectrogram(melody2, window, noverlap, NFFT, 'yaxis')
%}
%% 2.4
melody2dec = decimate(melody2, 8);
NFFT = 8192;
window = 512;
noverlap = 256;
%{
%sound(melody2dec, 44100)
spectrogram(melody2, window, noverlap, NFFT, 'yaxis')
figure;
spectrogram(melody2dec, window, noverlap, NFFT, 'yaxis')
%}
%% 2.5
melSpectrogram(melody2, fs);

