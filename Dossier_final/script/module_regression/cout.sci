function  J = cout(F, Z, beta)
// COUT : calcul du "cout" soit de l'erreur produite par les coefficients beta
//		  par rapport aux valeurs de Z
//				 
// input :
//		- F : variables intervenant dans la régression
//		- Z : valeur de la fonction aux points des données
//		- beta : coefficients de la régression linéaire
// output :
//		- J : cout ou erreur, calculé comme la somme des carrés des erreurs 
// 				 J(beta) = (1/2*nb_ex)*somme_sur_i((ÿ(x_i)-y(x_i))^2)
//						avec ÿ(x) = F*beta;
//				 ou matriciellement : J(beta) = (1/2*nb_ex)*(F*beta - Z).^2

m = length(Z); // nombre d'exemples

J = (1/2/m)*sum((F*beta - Z).^2);

endfunction