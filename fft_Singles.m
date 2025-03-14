%%%%%%%fft单边谱
%%y is output after the fft of x
%%fs is sampling frequency
%%w is frequency
function [y,w]=fft_Singles(x,fs)

    [N,l]= size(x); 
    if N<=l
        N=l;
        x=x';
    end 
    X = fft(x);  

    N_unique = ceil(N/2)+1;  

    X_single_sided = X(1:N_unique,:);  

    f = fs*(0:(N_unique-1))/N;  
y=abs(X_single_sided);
w=f;
   
end