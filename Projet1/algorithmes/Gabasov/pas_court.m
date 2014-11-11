%Changement du support par regle du pas court

%Remplacer j0 par jetoile dans Jsup et inversement dans Jn
j00=find(Jsup==j0,1);
Jsup(j00) = jetoile;
Jn(find(Jn==jetoile,1)) = j0;
beta = beta + sigma0*alpha0;