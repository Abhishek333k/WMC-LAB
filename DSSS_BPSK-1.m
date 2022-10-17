M_sequence;
D=input('Enter the input data sequence: ');
D(find(D==0))= 0;
M_seq(find(M_seq==0))=0;
td=D;
ld=length(D);
td(1:N)=D(1)*M_seq;
for i=2:ld
    td(1,length(td)+1:length(td)+N)=D(i)*M_seq;
end;
Tb=1;
Tpn=Tb/N;
fc=2*N;
fs=150*fc;
ts=1/fs;
k=0;
for i=1:N
    if M_seq(i)==1
        M_seq1(1,k+1:k+fs/N)=1;
        k=length(M_seq1);
    else
        M_seq1(1,k+1:k+fs/N)=-1;
        k=length(M_seq1);
    end;
end;
k=0;
for i=1:ld
    if D(i)==1
        D1(1,k+1:k+fs)=1;
        k=length(D1);
    else
        D1(1,k+1:k+fs)=-1;
        k=length(D1);
    end;
end;
k=0;
for i=1:ld*N
    if td(i)==1
        td1(1,k+1:k+fs/N)=1;
        k=length(td1);
    else
        td1(1,k+1:k+fs/N)=-1;
        k=length(td1);
    end;
end;
t=(0:1:fs*ld-1)*ts;
tm=(0:1:fs-1)*ts;
c=cos(2*pi*fc*t);
BPSK=c.*td1;
figure();
subplot(4,1,1);
plot(t,D1,'b','linewidth',1);
grid on;            %Shows grid lines in the graph
legend('NRZ coded Data signal ');    %Shows graph names given

subplot(4,1,2);
plot(tm,M_seq1,'b','linewidth',1);
grid on;            %Shows grid lines in the graph
legend('NRZ coded M_sequence ');    %Shows graph names given

subplot(4,1,3);
plot(t,td1,'b','linewidth',1);
grid on;            %Shows grid lines in the graph
legend('NRZ coded spread spectrum modulated signal');    %Shows graph names given
subplot(4,1,4);
plot(t,BPSK,'b','linewidth',1);
grid on;            %Shows grid lines in the graph
legend('DSSS_BPSK Modulated Signal');    %Shows graph names given