% Nouvelle base
entrant_base = base(indice_entrant);
base(indice_entrant) = horsbase(indice_sortant);
horsbase(indice_sortant) = entrant_base;

% Inclusion de x et c dans la matrice A
A(:,2:n+1) = A(:,1:n);
A(:,1) = x;
A(m+1,2:n+1) = c;
vecteur_sortant = A(indice_sortant,:);
vecteur_entrant = A(:,indice_entrant+1);

% Application du pivot sur A
vecteur_sortant = vecteur_sortant / pivot;
A = A - vecteur_entrant * vecteur_sortant;
A(indice_sortant,:) = vecteur_sortant;

% Exclusion de x et c de la matrice A
cout = A(m+1,1);
x(:,1) = A(1:m,1);
c(1,:) = A(m+1,2:n+1);
A = A(1:m, 2:n+1);