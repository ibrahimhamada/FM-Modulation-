clc;
clear;
fs = 1000000;
kf=5000;
t = 0:1/fs:0.002;
Time=t;
signal = @(tt) -sawtooth(pi*2000*tt+pi);
sig= -sawtooth(2000*pi*t+pi);
simin=[t' sig'];
%Plotting the message signal m(t)
figure("Name","The message signal [m(t)]");
plot(t,sig); xlabel('Time(sec)');ylabel('m(t)');  
title('The message signal [m(t)]'); grid on;

m=zeros(size(t));
for i = 1:numel(t)
    m(i)=integral(signal,0,t(i));
end
theta=2*pi*kf*m;

%Plotting the phase deviation signal
figure("Name",['The phase deviation signal [Theta(t)] K_f = ', num2str(kf), ' Hz']);
plot(t,theta); xlabel('Time(sec)');ylabel('m(t)');  
title(['The phase deviation signal [Theta(t)] K_f = ', num2str(kf), ' Hz']); grid on;

fc=10000;
freq=2*pi*fc*t;
simfreq=[t' freq'];
FM= cos(2*pi*fc*t +theta);

%Plotting the FM signal
figure("Name",['The FM signal [S_F(t)] K_f = ', num2str(kf), ' Hz']);
plot(t,FM); xlabel('Time(sec)');ylabel('S_F(t)');  
title(['The FM signal [S_FM(t)] K_f = ', num2str(kf), ' Hz']); grid on;

  
