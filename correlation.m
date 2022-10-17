function out=correlation(in,in1)
reg=in;
N=in1;
ln=length(reg);
reg(find(reg==0))=-1;
treg=reg;
for i=1:2*ln
    x=treg.*reg;
    summation(i)=sum(x);
    reg=circshift(reg,[1,1]);
end;
for i=2*ln+1:4*ln+1
    x=treg.*reg;
    summation(i)=sum(x);
    reg=circshift(reg,[1,-1]);
end;
out=(1/N)*summation;