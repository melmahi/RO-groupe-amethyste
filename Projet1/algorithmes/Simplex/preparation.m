% Premiere phase de la méthode du somplex, recherche de la solution de base
% initiale

% Preparation de la matrice
A = [2.5 7.5 0 ; 0.125 0.125 1 ; 17.5 10 0 ];
b= [2 3 5];
c = [ 1 2 3 ];
[m,n] = size(A); base = m+1:n; horsbase = 1:m; x = b;
E=eye(m)
[~,~,b]= intersect(A',E,'rows')
d = setdiff([1:m],b)
disp(A)
disp(E(:,d) )
A=[ A, E(:,d) ]
stock= c;
%Mise a jour de C
c(1:n)=0;
c( [n+1:n+size(d,2) ])=-1; % Selon choix utilisateur, +1 ou -1

Y = A(d(1,:),:);
for i = 1:size(Y,1)
   c= c+ Y(i,:); 
end
%Boucle
while (max(c) > 0)    
    %pas_simulation
end






