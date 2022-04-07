function [A]=forwardPropagate(Theta, X)
  L=length(Theta)+1;
  A=cell(L,1);
  A{1}=X';
  for l=1:L-1
    z=[ones(1,columns(A{l})); A{l}];
    A{l+1}=g(Theta{l}*z);
  endfor
end