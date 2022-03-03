clear;
clc;
%Huffman coding
%Defining probabilities
n=1:10;
p=[0.1 0.25 0.05 .1 .075 .15 .025 .05 .08 .12]; 
dict=huffmandict(n,p);
xh=huffmanenco(xq,dict);