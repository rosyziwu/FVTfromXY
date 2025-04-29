function [X,Xc,Xs,XP,Y,Yc,Ys,YP,FaiAi,Ai,Rx,RX,RP,RL,RS,GP]=FullVectorEntropy(x,y)
    [~,col] = size(x);
    [X,Xc,Xs,XP]=RealImagFFT(x);
    [Y,Yc,Ys,YP]=RealImagFFT(y);
    Zr = Xc-Ys;
    Zi = Xs+Yc;
    Zrn = Xc+Ys;
    Zin = Yc-Xs;
    %%%%%%%%%%%%%X
    Xp = sqrt(Zr.^2+Zi.^2)/2;
    Xr = sqrt(Zrn.^2+Zin.^2)/2;
    tanFaip = Zi./Zr;
    tanFair = -Zin./Zrn;
    Faip(tanFaip>0) = 1;
    Fair(tanFair<0) = -1;
    RL = Xp+Xr;
    RS = Xp-Xr;
    FaiAi = atan(tanFaip);
    Fai(FaiAi>=0)=1;
    Fai(FaiAi<0)=-1;
    Ai = (atan(tanFaip)+atan(tanFair))/2;
    GP = col/2*(RL.^2+RS.^2);
    R = RL+1i*RS;
    Rx = ifft(R);%%FVTsignal
    RX = fft(Rx);
    RP = abs(RX);    
end