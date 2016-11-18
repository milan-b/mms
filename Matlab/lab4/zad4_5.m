t= [0:0.5:3];
x1 = cos(2*pi*t);
t= [0:0.05:3];
x1 = cos(2*pi*t);
plot(t,x1)
hold on
stem(t,x1)
xlabel('t')
ylabel('x(t)')
t1 = 0:0.1:3;
x2 = cos(2*pi*t);
stem(t1,x2,'r');
 
x2 = cos(2*pi*t1);
stem(t1,x2,'r');
t3 = 0:0.5:3;
x3 = cos(2*pi*t3);
stem(t3,x3,'g');