%Pas de simulation
%Un pas dans l'algorithme de Gabasov

avancer_plan;
if beta>eps
    maj_support;
else
    %Le nouveau plan calculé est pris comme solution
    x=xbar;
end