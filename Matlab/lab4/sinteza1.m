function label = sinteza1()
    [y Fs nbits] = wavread('piano_A4');
    Y = fft(y);
    n = length(Y);
    for i = 1:n/2
    x = x+ abs(Y(i))*cos(2*pi*t*i);
    end
    label = x;
end