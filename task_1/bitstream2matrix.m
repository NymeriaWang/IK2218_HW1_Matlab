function mat = bitstream2matrix(X,m,n)
% Converts a vector of bits into a matrix of ints (from 0 to 255)
% INPUT
% X     the vector of bits
% m     the number of rows in the resulting matrix
% n     the number of collumns in the resulting matrix
%
% OUTPUT
% mat   the resulting matrix
%
X_det_vec = reshape(X,8,m*n);
X_det_vec = sum(X_det_vec.*repmat([2.^(7:-1:0)]',1,m*n) );
mat = reshape(X_det_vec,m,n);
