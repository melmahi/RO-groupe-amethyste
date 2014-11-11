%MAJ du support : 2e partie de la méthode

%Etape 10 :
E(j0) = x(j0) + L(j0);
alpha0 = E(j0) - xbar(j0);

%Etape 11 : direction duale
t = zeros(n,1);
t(j0) = -sign(alpha0);
temp = transpose((t(Jsup))' *gamma(:,Jn));
t(Jn) = temp;

%Etape 12 : calcul de sigma
sigma = zeros(n,1);

for j=1:n
    %cf poly, 1ere condition
    if (delta(j)*t(j)>0)
        sigma(j) = delta(j)/t(j);
    % initialisation a 0 du vecteur, reste a changer en l'infini pour "dans
    % les autres cas"
    else if not(delta(j)==0 && ((t(j)<0 && E(j)==d_min(j))||((t(j)>0 && E(j)==d_max(j)))))
            sigma(j)=Inf;
        end
    end
end
%Reordonner les valeurs pas ordre croissant
[sigma0,jetoile] = min(sigma);
sigma = sort(sigma);

%Etape 13 : changement du support
pas_court;

%Etape 14 : maj de gamma
%On met a jour la ligne j00
for j=1:n
    if j~=jetoile
        gamma(j00,j) = gamma(j00,j)/gamma(j00,jetoile);
    end
end
%gammabar(j00,jetoile)=1, mais il faut le mettre a jour en dernier pour ne
%pas fausser le calcul des j>jetoile
gamma(j00,jetoile) = 1;

%on met a jour le reste de la matrice, en évitant la ligne j00
for i=1:m
    if i~=j00
        stock = gamma (i,jetoile);
        for j=1:n
            gamma(i,j) = gamma(i,j) - stock*gamma(j00,j);
        end
    end
end

%Etape 15 : maj de delta selon la direction duale
delta = delta - sigma0*t;

%Etape 16 : maj de x, on est prêt a ré-itérer
x = xbar;
