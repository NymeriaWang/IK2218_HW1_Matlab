



function []= task1(snr,mode)
[X,map] = imread('benBW','bmp'); %load a picture
[m,n] = size(X);
a = sqrt(1/(2*snr)); % this is the amplitude of the noise

% convert the image (matrix of bytes) to a stream of bits
X_bin_vec = matrix2bitstream(X); % convert the picture to 1 and 0
X_bin_vec_modulated = 2*X_bin_vec-1; % convert 1 and 0 to 1 and -1

% Channel
X_rec1 = channel(X_bin_vec_modulated,a,mode);

% detection
X_det_bin1 = (sign(X_rec1)+1)/2; % this vector contains ones and zeros

% convert the bits back to a matrix
X_det1 = bitstream2matrix(X_det_bin1,m,n);

colormap(repmat([0:.01:1]',1,3))
subplot(1,2,1)
imagesc(X)
title('Original Picture','FontSize',14)
axis equal
axis off

subplot(1,2,2)
imagesc(X_det1)
title('After Transmission','FontSize',14)
axis equal
axis off


%----------------calculate the bit-error-rate by using fraction of bits---------
result=abs(X_bin_vec-X_det_bin1);
error=length(find(result==1));
bit_error_rate_Fraction = error/length(X_bin_vec)

%----------------calculate the bit-error-rate by using SNR---------
%bit_error_rate_Calculated_AWGN = BER_Calculated(snr)

bit_error_rate_Calculated_RAY = BER_Calculated_ray(snr)

end



