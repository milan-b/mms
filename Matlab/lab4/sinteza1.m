function label = sinteza1()
    [y Fs nbits] = wavread('piano_A4');
    Y = fft(y);
    n = length(Y);

    %t = [0:n-1]/Fs;
    t = 0:1/Fs:1;

    x = zeros(1,length(t));
    for i = 1:n/2
    x = x+ abs(Y(i))/n*cos(2*pi*t*i/n);
    end
    label = x;
end