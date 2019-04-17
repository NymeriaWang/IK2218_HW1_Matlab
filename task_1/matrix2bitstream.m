function bits = matrix2bitstream(X)
% Converts a matrix  of ints (from 0 to 255) into a vector of bits 
% INPUT
% X     the matrix
%
% OUTPUT
% bits  the vector of bits
%
[m,n] = size(X);
X_vec = reshape(X,m*n,1);
X_bin_mat = dec2bin(X_vec)-48;
bits = reshape(X_bin_mat',1,m*n*8);
