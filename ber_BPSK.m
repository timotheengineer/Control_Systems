%Calculating ber communication
N=1000;
for i=1:10
    ebn0(i)=i;
    EsN0=10.^(ebn0(i)/10);
    sigma=sqrt(1/(2*EsN0));
    d=randi(2,1,N)-1;
    b=2*d-1;
    r=b+sigma*randn(1,N)+j*sigma*randn(1,N);
    dd=(r>0);
    e=(dd~=d);
    ber(i)=sum(e)/N;
end
semilogy(ebn0,ber,'*')
hold on
EbN0=10.^(ebn0/10);
semilogy(ebn0,qfunc(sqrt(2*EbN0)),'r')
axis([0 10 10^-6 10^-1])
grid on