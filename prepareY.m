function [Y]=prepareY(y)
  y_size=length(y);
  K=max(y);
  Y=zeros(K, y_size);
  for i=1:y_size
    Y(y(i), i)=1;
  endfor
end