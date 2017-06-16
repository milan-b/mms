%% Vektori pomjeraja

clear all;

v = aviread('mobile.avi');

f155 = v(155).cdata;
f160 = v(160).cdata;

f155 = rgb2gray(f155);
f160 = rgb2gray(f160);

f155 = im2double(f155);
f160 = im2double(f160);

sirina = length(f155(1, :));
visina = length(f155(:, 1));

N1 = 16;
N2 = 16;
x = [];
y = [];
d1 = [];
d2 = [];

for n1 = N1:N1:sirina - 2*N1
    for n2 = N2:N2:visina - 2*N2
       S1 = f155(n2:n2+N2-1,n1:n1+N1-1);
       x = [x (n1+N1/2)];
       y = [y (n2+N2/2)];
       
       dd1 = [];
       dd2 = [];
       D = [];
       for i = -N1+1:N1
           for j = -N2+1:N2
               k1 = n1+j;
               k2 = n2+i;
               S2 = f160(k2:k2+N2-1, k1:N1-1+k1);
               D =[D sum(sum(abs(S1-S2)))];
               dd1 = [dd1 i];
               dd2 = [dd2 j];
           end
       end
       [~,ind] = min(D);
       d1 = [d1 dd1(ind)];
       d2 = [d2 dd2(ind)];
    end
end
hold off
imshow(f155);
hold on
quiver(x, y, d2, d1);
%%axis ij;
%% 
