function [cost]=J(Theta, est, Y, lambda)
  L=length(Theta);
  s=zeros(L, 1);
  for l=1:L
    t=Theta{l};
    t_new=t(:, 2:end);
    s(l)=sum(sum(t_new.^2));
  endfor
  m=length(est);
  R=1/m*sum(sum(-log(est).*Y-log(1-est).*(1-Y)));
  r=lambda/(2*m)*sum(s);
  cost = R + r;
end