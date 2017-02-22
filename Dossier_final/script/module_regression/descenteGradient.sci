function  [beta, J_historique] = descenteGradient(F, Z, beta, taux, nb_iter)
// DESCENTE GRADIENT : applique l'algorithme de descente de gradient
//				 
// input :
//		- F : variables intervenant dans la régression
//		- Z : valeur de la fonction aux points des données
//		- beta : coefficients initiaux à la descente
//		- taux : taux d'apprentissage dans la descente
//		- nb_iter : nombre d'itérations max si non convergence
// output :
//		- beta : coefficients de régression à la fin de l'algorithme
//		- J_historique : évolution du coup au cours des itérations
//			(utile si on veut faire une courbe)

J_historique = ones(nb_iter,1); // vecteur colonne de 0
m = length(Z); // nombre d'exemples

for iter = 1:nb_iter
	grad_J = (1/m)*F'*(F*beta - Z);
	beta = beta - taux*grad_J;
	J_historique(iter) = cout(F, Z, beta);
end

endfunction