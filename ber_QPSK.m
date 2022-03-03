N = 1000000;
dd = []; % Clear demodulated data array in advance
for i = 1:10
    ebn0(i) = i;
    EsN0 = 2*10.^(ebn0(i)/10);  % Multiplied by 2 because there are 2 
  % bits/symbol
    sigma = sqrt(2/(2*EsN0)); % Signal power S = 2
    d = randi(2,2,N)-1;
    b = 2*d(1,:)-1 + j*(2*d(2,:)-1);
    r = b + sigma*randn(1,N) + j*sigma*randn(1,N);
    dd(1,:) = (real(r)>0);  % Apply threshold to real part for 1st
    dd(2,:) = (imag(r)>0);  % bit, and to imaginary part for 2nd 
    e = (dd ~= d);
    ber(i) = sum(sum(e))/(2*N); % sum(sum(e)) because e is a 2D 
  % matrix, and there are 2N bits
end
semilogy(ebn0,ber,'*')
hold on
EbN0 = 10.^(ebn0/10);
semilogy(ebn0,qfunc(sqrt(2*EbN0)),'r')
axis([0 10 10^-6 10^-1])
