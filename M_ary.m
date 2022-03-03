clear;
const = cos(pi*[0:7]/4) + j*sin(pi*[0:7]/4);
const = const(1+[0 1 3 2 7 6 4 5]);
M = length(const);
k = log2(M);
figure(2)
plot(real(const),imag(const),'+')
for i = 1:M
    text(real(const(i))+0.05,imag(const(i)),dec2bin(i-1,k))
end
