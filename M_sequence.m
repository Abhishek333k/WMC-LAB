clc;            %Clears the command window
clear all;      %clears all the varibles used in previous program
close all;      %closes all pop up windows like graphs opened in previous window 
r=input('enter the length of shiftregister r= '); %reads the shift register length and stores in variable r
N=2^r-1;                                          %calculate PN_sequence length
tp=input('enter the valid tap array :');
in=input('enter the sequence of input data array of length r : ');
if r~=length(in)
    fprintf('\n \n error : length of input data array must be equal to the length  of shift registers: \n \n');
else
    out=in;
for k=1:N
    t_out=out(tp(1));
    for i=1:length(tp)-1
    t_out=xor(t_out,out(tp(i+1)));
    end;
    tr1=r;
    M_seq(k)=out(r);
 for j=1:r-1
    out(tr1)=d_ff(out(tr1-1));
    tr1=tr1-1;
   end;
   out(1)=t_out;
   if k~=N
   if out==in
       fprintf('\n \n error : given tap input array is not valid : \n \n');
       break;
   end;
   end;
   if k==N
      if out==in
      fprintf('lenth of the m_sequence N = %d \n',N);
      fprintf('M_sequence is : \n');
      disp(M_seq);
      corre=correlation(M_seq,N);
      t=-2*N:1:2*N;
      grid on;
      plot(t,corre);
      grid on;axis([-2*N-1 2*N+1 -1 1.5]);
      title('autocorrelation of M-sequence : ');
      xlabel('timeperiod');
      ylabel('amplitude');
  else
      fprintf(' \n \n error : given tap input array is not valid :\n \n');
  end; 
  end;
end;
end;
