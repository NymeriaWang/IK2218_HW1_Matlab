h=zeros(5,1);
y=zeros(5,1);
m=1000;
for i=1:5 %calculate h
    for j=1:(m-i)
    h(i)=h(i)+training_in(j)*training_out(i+j-1);
    end
    h(i)=h(i)/(m-i);
end