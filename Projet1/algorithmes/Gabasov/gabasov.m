% Résolution du problème du Brasseur en utilisant la méthode adaptée de
% Gabasov

% Preparations des données
[m,n] = size(A);
delta = zeros(m,1);
beta = 0;
d_min = zeros(n,1);
d_max = [34;34;240;5;595];
E=zeros(n,1);

x = [11;27;10;1/4;265/2];

[m,n] = size(A); base = m+1:n; horsbase = 1:m;
Y=eye(m);
[~,Jtemp,Ib]= intersect(A',Y,'rows');
Jsup(Ib) = Jtemp;
Jn  = setdiff([1:n],Jsup);

    gamma = A;
    Csup = c(Jsup);
    delta = transpose(c - Csup*gamma);
    beta = 0;
    
    %Calcul du beta initial
    for i=1:(n-m)
        if delta(Jn(i)) < 0
            beta = beta + delta(Jn(i))*(d_min(i) - x(i));
        end
        if delta(i) > 0
            beta = beta + delta(Jn(i))*(d_max(i) - x(i));
        end
    end
    
    %GABASOV
    compteur = 0;
    while beta>eps;
        pas_simulation;
        %affichage du nombre de passages dans la boucle
        compteur = compteur +1;
        %A DECOMMENTER POUR AVOIR DES DETAILS SUR LE DEROULEMENT DE
        %L'ALGORITHME :
        %disp('Pas de simulation numero :');
        %disp(compteur);
        %disp('Direction de recherche :');
        %disp(L);
        %disp('Pas primal');
        %disp(theta);
        %disp('Valeur de x a cette iteration: );
        %disp(x);
    end

% Affichage de la solution
disp('******************');
disp('Solution x trouvée:');
disp(x);
if beta == 0
    disp('La solution est optimale !');
else
    disp('La solution est sous-optimale');
end
disp('******************');

