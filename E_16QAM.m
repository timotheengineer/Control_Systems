M=16;
L=sqrt(M);
k=log2(M);
p=[1 3 -1 -3];
const=ones(L,1)*p + j*p.'*ones(1,L);
const=reshape(const,1,16);
figure(2); clf
plot(real(const),imag(const),'+')
hold on
for i=1:M
    text(real(const(i))+0.05,imag(const(i)),dec2bin(i-1,k))
end
