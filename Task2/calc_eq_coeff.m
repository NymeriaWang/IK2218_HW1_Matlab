function eq_coeff = calc_eq_coeff(h,noise,taps)

[dummy pos_of_h0]=max(abs(h));

%h_ind = 1:length(h);
Gamma = zeros(taps);
for m=1:taps
  for n=1:taps
    g_temp = zeros(1,taps+1);
    for l=0:taps
      ind1 = l+pos_of_h0;
      ind2 = l+m-n+pos_of_h0;
      if  ind1>0 & ind2>0 & ind1<length(h)+1 & ind2<length(h)+1
	g_temp(l+1)=h(ind1)*h(ind2);
      end
    end
    if m==n
      Gamma(m,n) = sum(g_temp)+noise/2;
    else
      Gamma(m,n) = sum(g_temp);
    end
  end
end

h_temp = zeros(taps,1);
for gg=1:taps
  midle = ceil(taps/2);
  if (midle-gg+pos_of_h0)>0 & gg<length(h)+1 & (midle-gg+pos_of_h0)<taps+1
    h_temp(midle-gg+pos_of_h0)=h(gg);
  end
end

h_temp;
Gamma;

eq_coeff = Gamma\h_temp;
