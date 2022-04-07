function [Theta]=initTheta(n)
  n1=n(1);
  nL=n(end);
  L=length(n);
  Theta=cell(L-1,1);
  for l=1:L-1
    Theta{l}=rand(n(l+1), n(l)+1);
    Theta{l}=Theta{l}*(2*0.1)-0.1;
  endfor
end