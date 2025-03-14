clc,clear
% [yy, Fs] = audioread('road\11.m4a');
%%%% You should change the road
road='road\12k_Drive_End_B007_0_118.mat';
file=load(road);
yy(:,1)=file.X118_DE_time(1:2004*4,1);
yy(:,2)=file.X118_FE_time(1:2004*4,1);
Fs=12000;
 t=(0:length(yy(:,1))-1)/Fs;
% sound(y(:,2), Fs);
% Y=awgn(y,0,'measured');
SNG=10;
% rx=awgn(yy(:,1),SNG,'measured');
% ry=awgn(yy(:,2),SNG,'measured');
rx=yy(:,1);
ry=yy(:,2);
 [X,Xc,Xs,XP,Y,Yc,Ys,YP,FaiAi,Ai,Rx,RX,RP,RL,RS,GP]=FullVectorEntropy(rx,ry);
% sound(Rx, Fs);
% pause(1)
% sound(yy,Fs)
% 
% pause(1)
% sound(RS,Fs)
% 
% pause(1)
% sound([rx,ry],Fs)
fs=Fs;

figure
subplot(3,1,1)
plot(t,rx);
subplot(3,1,2)
plot(t,ry);
subplot(3,1,3)
plot(t,Rx)
ylim([-1.1,1.1])


for i = 1:length(yy(:,1))
    rx=yy(1:i,1);
    ry=yy(1:i,2);
     [X,Xc,Xs,XP,Y,Yc,Ys,YP,FaiAi,Ai,Rx,RX,RP,RL,RS,GP]=FullVectorEntropy(rx,ry);
     startA(1,i)=Rx(1,1);
     if i==10000   
         break;
     end
end
j=1;
for i = -10:30
    rx=awgn(yy(:,1),i,'measured');
    ry=awgn(yy(:,2),i,'measured');
     [X,Xc,Xs,XP,Y,Yc,Ys,YP,FaiAi,Ai,Rx,RX,RP,RL,RS,GP]=FullVectorEntropy(rx,ry);
    r=Rx(1,1);
     startB(1,j)=r;
    j=j+1;
end

figure
plot(startA)
figure
plot(startB)