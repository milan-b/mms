function y = vedranPrvi()
    [x,Fs] = wavread('acoustic');
    F = [32 125 500 1000 2000 5000];

    for i = 1:length(F)
        [b a] = butter(2,2*F(i)/Fs,'low');
        
        figure;
        freqz(b,a);
        pause;
        y = prvi(a,b,x);
    end

end