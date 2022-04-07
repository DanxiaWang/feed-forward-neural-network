function [D] = backPropagate(Theta, A, Y, lambda)
  L=length(Theta)+1;
  m=columns(A{1});
  %Initialize a cell array for theta without bias
  theta=cell(L-1,1);
  for l=1:L-1
    t=Theta{l};
    theta{l}=t(:, 2:end);
  endfor
  
  %Initialize a cell array for d
  d=cell(L,1);
  d{L}=A{end}-Y;
  c=flip(2:L-1);
  for l=c
    d{l}=theta{l}'*d{l+1}.*(A{l}.*(1-A{l}));
  end
  
  %Initialize a cell array for D
  D=cell(L-1,1);
  for l=1:L-1
    z=[ones(1,columns(A{l})); A{l}];
    D_new=d{l+1}*z';
    D_new(:,2:end)=D_new(:,2:end)+lambda*theta{l};
    
    D{l}=D_new./m;
  end
end
