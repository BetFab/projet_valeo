// Betty FABRE - Chyrine TAHRI
// Application des différents modules avec les données Valéo

// Clear and allocate up to 2 GB memory (Scilab 5 limitation -> should be solved in Scilab 6)
clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
//lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)



// charge les fonctions .sci du module
d = pwd();
getd(d+'\module_regression');
getd(d+'\PMC_regression');
//getd(get_absolute_file_path('donnees_valeo.sce'));

load('./donnees.dat');
// les données sont base_test et base_modele
// de la forme suivante: [FN, AA, CA, LA]
//base_test = str2nb
disp(size(base_test));
disp(size(base_modele));

FN = base_modele(:,1);
AA = base_modele(:,2);
CA = base_modele(:,3);

FN_test = base_test(:,1);
AA_test = base_test(:,2);
CA_test = base_test(:,3);

beta = regression(FN, AA , CA);

[X2, mu_X2, sigma_X2] = normalisation(FN_test.*FN_test);
[Y2, mu_Y2, sigma_Y2] = normalisation(AA_test.*AA_test);
[XY, mu_XY, sigma_XY] = normalisation(FN_test.*AA_test); 
[X, mu_X, sigma_X] = normalisation(FN_test);
[Y, mu_Y, sigma_Y] = normalisation(AA_test);


// F = matrice contenant toutes les variables
F = [X2 Y2 X Y XY ones(length(CA_test),1)];

CA_prediction = F * beta;
f = scf();
param3d1(FN,AA,list(CA,-1));
title('Données Contact Angle (CA)')
param3d1(FN_test,AA_test list(CA_prediction,-1));
xlabel("FN");
ylabel("AA");
zlabel("CA");
f.color_map=jetcolormap(16);
disp(size(CA_prediction))