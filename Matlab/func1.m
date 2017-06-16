function y = (x,a,b)
    a(1) = []; %izbacivanje prvog elemnta - nije potreban
    y = zeros(1,length(x));
    
    
    for n = 3:length(y)
        y(n) = b(0)*x(n)+b(1)*x(n-1)+b(2)*x(n-2)-a(1)*y(n-1)-a(2)*y(n-2);
    end
    y = y';
    y = y /max(y);
end