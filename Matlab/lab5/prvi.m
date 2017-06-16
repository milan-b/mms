function label = prvi(a,b,x)
%% vraca filtriran signal. a i b su povratne vrijednosti fje buutter
%%a y je signal koji treba filtrirati
    n = length(x);
    k =2;
    %[b a] = butter(n,1/2250);
    %y = zeros(1,n);
    y(1) = b(1)*x(1);
    y(2) = b(1)*x(2)+b(2)*x(1)-a(1)*x(1);
    
    for i = 3:n
        y(i) = b(1)*x(i);
        for j = 1:k
            y(i) = y(i)+ b(j+1)*x(i-j)-a(j)*x(i-j);
        end
    end
    label = y;
end
