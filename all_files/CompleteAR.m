load speechdata


p=20; % Chosen model order

xtotal=decimate(data,6); % The decimated data 
fsx=fs/6; % The reduced sampling frequency

ndata = length(xtotal);                 
t = (0:ndata-1)/fsx;

tsec= 20*10^(-3);               % Set length of time-windows (20 ms)
n = round(fsx*tsec);             % Sample length of each time-window (160 samples)
nosec = floor(ndata/n);          % Number of sections with length 20ms


arp_mat= zeros(nosec,p+1);
sigma2_v=zeros(nosec,1);

for i = 1:nosec                       % For each time frame:
    x = xtotal((i-1)*n+1:i*n);          % Pick out the i:th  20 ms section
    [arp,sigma2] = arcov(x,p);     % Estimate the AR-model
    arp_mat(i,:)=arp;  % Store the AR-parameters as row vectors
    sigma2_v(i)=sigma2;
end


% Reconstruct the whole sequence in each time frame using the AR parameters
datarec = zeros(ndata,1);
for i = 1:nosec
   datarec((i-1)*n+1:i*n)= filter(1,arp_mat(i,:),sqrt(sigma2_v(i))*randn(n,1));    
end

figure
subplot(211);
plot(t,xtotal);
title('Original sound')
xlabel('Time (s)')
subplot(212);
plot(t,datarec);
title('Reconstructed sound')
xlabel('Time (s)')

sound(datarec,fsx)
