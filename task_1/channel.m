function out = channel(in,a,type,h)

if nargin==3
h=1;
end

switch type
 case 'awgn'
  out=in+a*randn(size(in));
 case 'ray'
  out=in.*1/sqrt(2).*sqrt(randn(size(in)).^2+randn(size(in)).^2) +a*randn(size(in));
 case 'isi'
  temp = filter(h,[1],in);
  out = temp+a*randn(size(in));
end
