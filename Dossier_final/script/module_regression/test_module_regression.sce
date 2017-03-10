// Betty FABRE - Chyrine TAHRI
// Fonction principale du module de régression

// Expliquer ici le plan
// et les différentes fonctions à utiliser


// Clear and allocate up to 2 GB memory (Scilab 5 limitation -> should be solved in Scilab 6)
clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
//lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)

// charge les fonctions .sci du module
getd(get_absolute_file_path('test_module_regression.sce'));


// Création d'une grille:
nx = 5; ny = 5;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
// Calcul d'une fonction sur la grille 
// Fonction de degré 2 :z = x.^2 + 5*y.^2
deff("z=f(x,y)","z=3*x.^2 + 5*y.^2+x*y -6 -2*x")
Z = f(X,Y);
// Affichage de la surface
clf()
subplot(2,2,1)
//plot3d(x,y,Z,'+');
param3d1(X(:), Y(:), list(Z(:),-1));
title("Données initiales");


// Transformer sous forme de vecteurs: X(:), Y(:), Z(:) 
beta = regression(X(:), Y(:), Z(:));

