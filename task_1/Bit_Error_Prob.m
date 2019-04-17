function out = Bit_Error_Prob(before,after)
result=abs(before-after);
error=length(find(result==1));
bit_error_rate = error/length(before)
out = bit_error_rate;
end

