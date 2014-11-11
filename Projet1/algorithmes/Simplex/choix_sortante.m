% La variable sortante est la première à s’annuler: c’est celle pour 
% laquelle le bi/air est le plus petit possible.
colonne_sortante = x ./ vecteur_entrant;
if max(colonne_sortante) < 0
    disp('Le problème n''est pas borné.');
    break;
else
    [~, indice_sortant] = min(colonne_sortante);
    pivot = A(indice_sortant,indice_entrant);
end
vecteur_sortant = A(indice_sortant,:);