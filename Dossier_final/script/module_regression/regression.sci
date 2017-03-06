function  [beta] = regression(X, Y, Z)
// REGRESSION module de régression sur des données en 3 dimensions
//
// on cherche à trouver l'équation d'une surface de la forme 
// 			Z = aX^2 + bY^2 + cX + dY + eXY + f
//
// input :
//		- X, Y, Z: coordonnées des données
// output :
//		- beta = [a b c d e f] coefficient de la regression linéaire
//		- err 	= erreur (?) --> à implementer

getd(get_function_path('regression.sci'));


// ****************************************************************
// 		Normalisation des données
// ****************************************************************

if length(X)~=length(Y) | length(X)~=length(Z) | length(Z)~=length(Y) then
	error(disp("Les tailles des coordonnées de correspondent pas"));
end



// Scalling -> facultatif mais mieux pour la toolbox
nb_points = length(Z);

[X2, mu_X2, sigma_X2] = normalisation(X.*X);
[Y2, mu_Y2, sigma_Y2] = normalisation(Y.*Y);
[XY, mu_XY, sigma_XY] = normalisation(X.*Y); 
[X, mu_X, sigma_X] = normalisation(X);
[Y, mu_Y, sigma_Y] = normalisation(Y);

// F = matrice contenant toutes les variables
F = [X2 Y2 X Y XY ones(nb_points,1)];
mu = [mu_X2 mu_Y2 mu_X mu_Y mu_XY 0];
sigma = [sigma_X2 sigma_Y2 sigma_X sigma_Y sigma_XY 1];

x = matrix(X, sqrt(length(X)), sqrt(length(X)));
y = matrix(Y, sqrt(length(Y)), sqrt(length(Y)));
x = x(:,1);
y = y(1,:);

z = matrix(Z, sqrt(length(Z)), sqrt(length(Z)));
subplot(2,2,2)
plot3d(x,y,z);
title("Surface centrée réduite");



// Remarque = on aurait pu faire la normalisation ici..

// ****************************************************************
// 		Descente de gradient
// ****************************************************************
// On cherche à minismer la fonction de cout suivante :
//		J(beta) = (1/2*(nb_points)) * somme((ÿ(x_i) - y(x_i))^2) ( erreur )
//		où ÿ(x) = beta*F 
// Pour miniser cette fonction cout, on fait une descente de gradient

// **** Paramètres de descente ****
alpha = 0.01;
nb_iter = 400;

// **** Initialisation de beta ****
beta = zeros(6, 1);
[beta, J_historique] = descenteGradient(F, Z, beta, alpha, nb_iter);

// Affichage de la surface approximées
Z_tilde = F * beta;

z_tilde = matrix(Z_tilde, sqrt(length(Z_tilde)), sqrt(length(Z_tilde)));

disp(size(Z_tilde))

subplot(2,2,3);
plot3d(x, y, z_tilde);
title("Surface après regression");


// Affichage de la fonction cout:
subplot(2,2,4);
plot(1:nb_iter, J_historique);
title("Evolution du cout pendant la descente");
J_opt = cout(F, Z, beta);
beta = beta'.*sigma + mu;

endfunction