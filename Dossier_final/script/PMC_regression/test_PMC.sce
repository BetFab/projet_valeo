// Betty FABRE - Chyrine TAHRI
// Fonction principale de test des réseaux de neurones pour régression
// d'une surface

// Expliquer ici le plan
// et les différentes fonctions à utiliser

// Clear and allocate up to 2 GB memory (Scilab 5 limitation -> should be solved in Scilab 6)
clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
//lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)

// charge les fonctions .sci du module
getd(get_absolute_file_path('test_PMC.sce'));

donnees = [];
donnees.dim = 2 ; // surface dans R^3
donnees.nb_exemples = 2500;
donnees.nb_classe = 1; // f(x,y)
donnees.coordonnees = zeros (donnees.nb_exemples, donnees.dim);
donnees.sorties = zeros(donnees.nb_exemples,1);


// Création d'une grille:
nx = 50; ny = 50;
x = linspace(0,1,nx);
y = linspace(0,1,ny);
[X,Y] = ndgrid(x,y);
donnees.coordonnees = [X(:),Y(:)];
// Calcul d'une fonction sur la grille 
// Fonction de degré 2 :z = x.^2 + 5*y.^2
deff("z=f(x,y)","z=3*x.^2 + 5*y.^2+x*y -6 -2*x")
Z = f(X,Y);
[donnees.sorties max_z] = scaling(Z(:));
// Affichage de la surface
clf()

subplot(2,2,1)
param3d1(X(:), Y(:), list(Z(:),-1));
title("Données initiales");

disp(size(donnees.sorties))
subplot(2,2,2)
param3d1(X(:), Y(:), list(donnees.sorties(:),-1));
title("Données initiales entre -1 et 1");


// Définition du réseau de neurones: 
// Réseau de neurones avec 1 couche cachée

reseau = [];
reseau.dim_entree = donnees.dim;
reseau.dim_cachees = 3;
reseau.dim_sortie = donnees.nb_classe;

// Apprentissage:
nb_iter = 100;
mse = 0.00000001;
taux_apprentissage = 1;

disp("Apprentissage : ");

[reseau stats sorties] = PMCLearning(reseau, donnees, taux_apprentissage, mse, nb_iter);

// Affichage des statistiques d'apprentissage
subplot(2,2,3)
plot(stats);
title("Statistiques d apprentissage");
subplot(2,2,4)
disp(size(sorties))
param3d1(X(:), Y(:), list(sorties,-1));
disp(reseau)

// Interpolation:
// Création d'une grille:
nx = 100; ny = 100;
x = linspace(0,1,nx);
y = linspace(0,1,ny);
[X,Y] = ndgrid(x,y);

X = X(:);
Y = Y(:);
Z = zeros(length(X),1);
for i = 1:length(X)
	Z(i) = PMCpropagation(reseau, [X(i) Y(i)]);
	//disp(Z(i))
end

//Z = Z*max;
Z = matrix(Z, sqrt(length(Z)), sqrt(length(Z)));
//subplot(2,2,4)
//plot3d(x,y, Z);
//title("Données interpolées");