function [X,Xc,Xs,XP]=RealImagFFT(x,X,Xc,Xs,XP)
    X = fft(x);
    Xc = real(X);
    Xs = imag(X);
    XP = abs(X);
end