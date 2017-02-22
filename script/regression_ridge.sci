function [f,df]=regression_ridge(S,Y,valeurs)
// Fonction de regression ridge
//Y la réponse
//valeurs ou on va calculer
//df c'est n'importe quoi va falloir le recalculer
[nargout,nargin] = argn();
[n,p]=size(S);
SY=S'*Y;
SS=S'*S;
m=length(valeurs);
f=ones(p,m);

for k=1:m
    f(:,k)=(SS+diag(valeurs(k)))\SY;
end

if  nargout > 1 then
  df = zeros(p,m);
end

endfunction
