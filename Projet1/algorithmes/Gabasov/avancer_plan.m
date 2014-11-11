%Avancer le plan : 1ere partie de la méthode

for i=1:(n-m)
    if delta(Jn(i)) < 0
        E(Jn(i))=d_min(Jn(i));
    else
        E(Jn(i)) = d_max(Jn(i));
    end
end
%E(Jsup,1) = A(1:m,Jsup)\(b-A(1:m,Jn)*E(Jn,1));

%Etape 3 : calcul de direction
L=zeros(n,1);
L(Jn) = E(Jn,1) - x(Jn,1);
L(Jsup) = -gamma(:,Jn)*L(Jn);


%Etape 4 : calcul du pas
theta = zeros (n,1);
for i=1:n
    if L(i,1)>0
        theta(i) = (d_max(i)-x(i))/L(i);
    else if L(i,1)<0
            theta(i) = (d_min(i)-x(i))/L(i);
        else
            theta(i) = Inf;
        end
    end
end

%Etape 5 : avancer le point
[thetaj0,j0] = min(theta);
theta0 = min([thetaj0 1]);
% xbar est le nouveau plan calculé
xbar = x+theta0*L;

%Etape 7/8 : maj du critère d'arret
beta = (1-theta0)*beta;
