% This script creates a discrete time signal, and then quantizes it to a specified number
% of bits.  It then calculates the quantization error.
% see if you run the script.

clear;
clc;
b=3;                            % Number of bits.
M=6;                          % Number of samples in final signal.
n=0:(M-1);                      %range of sampling/symbols


% Creating a discrete time signal.
        x=sin(2*pi*n/M);
    

% Restricting the signal amplitude to 1
x(x>=1)=(1-eps);            % Make  signal from -1 to just less than 1.
x(x<-1)=-1;

% Quantize a signal to "b" bits.  
xq=floor((x+1)*2^(b-1));    % Signal is one of 2^n int values (0 to 2^n-1)
xq=xq/(2^(b-1));            % Signal is from 0 to 2 (quantized)
xq=xq-(2^(b)-1)/2^(b);      % Shift signal down (rounding)

xe=x-xq;                    % Quantization error


stem(x,'b');
hold on;
stem(xq,'r');
hold on;
stem(xe,'g');
legend('exact','quantized','error','Location','Southeast')
title(sprintf('Signal, Quantized signal and Error for %g bits, %g quantization levels',b,2^b));
hold off

% %Huffman coding
% %Defining probabilities
% n=1:6;
% p=[0.1 0.25 0.35 .1 .15 .05]; 
% dict=huffmandict(n,p);
% xh=huffmanenco(xq,dict);
