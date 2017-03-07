// Betty FABRE - Chyrine TAHRI
// Extraction des données de Valeo 
// Sauvegarde dans un fichier .mat

// On extrait les colonnes qui nous interessent:
// 			 - FN (N/m)  ->
//			 - AA (deg) -> Attack angle
//			 - LA (deg) ->
//			 - CA (deg) -> Contact Angle

// -----------------------------------------------------------------

// Clear and allocate up to 2 GB memory (Scilab 5 limitation -> should be solved in Scilab 6)
clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
//lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)

// -----------------------------------------------------------------

Fn_vec = [5 6 7 8 9 10 12 14 16 18 20 25 30 35 40 45 50 55 60];
AA_vec = [-12 -10 -8 -6 -4 -2 0 2 4 6 8 10 12];

disp(length(Fn_vec));
disp(length(AA_vec));

//********************************************************************
//
//********************************************************************

donnees = fscanfMat('../Ex_donnees/ex1/Rubber-ZZ2.txt');
Fn = donnees(:,1);
AA = donnees(:,2);

CA = donnees(:,5);
CA_mat = matrix(CA, length(Fn_vec), length(AA_vec));
LA = donnees(:,4);
LA_mat = matrix(LA, length(Fn_vec), length(AA_vec));

disp(size(CA_mat));
disp(size(LA_mat));

nb_exemples = length(Fn);

// On sépare les données en deux parties : 
//				- une pour la construction du modèle
//				- une pour les tests
// On garde 10% des points au hasard pour les tests

indice_total = (1:nb_exemples)';
indice_modele = ones(nb_exemples,1);
indice_tests = unique(ceil(rand(floor(nb_exemples*0.1),1)*nb_exemples)); 

indice_modele(indice_tests) = 0; 
indice_modele = indice_total(find(indice_modele));

// Matrices pour les affichages:
nan_modele = ind2sub(size(CA_mat),indice_tests);
CA_mat(nan_modele) = %nan;
LA_mat(nan_modele) = %nan;

disp(size(CA_mat));
disp(size(LA_mat));


base_test = [Fn(indice_tests) AA(indice_tests) CA(indice_tests) LA(indice_tests)];
base_modele = [Fn(indice_modele) AA(indice_modele) CA(indice_modele) LA(indice_modele)];

save('donnees.dat' , base_test, base_modele);


// --------------------------------------------------------------------
// 			Affichage de la base 
// --------------------------------------------------------------------

f = scf();

plot3d1(Fn_vec,AA_vec,CA_mat);
title('Données Contact Angle (CA)')
param3d1(Fn(indice_tests), AA(indice_tests), list(CA(indice_tests),-1), 'ro');
xlabel("FN");
ylabel("AA");
zlabel("CA");
f.color_map=jetcolormap(16);

//p=get("hdl"); 
//p.thickness=3;
//p.mark_style=0;
f = scf();
plot3d1(Fn_vec, AA_vec, LA_mat);
a=get("current_axes");//get the handle of the newly created axes
param3d1(Fn(indice_tests), AA(indice_tests), list(LA(indice_tests),-1));
title('Données L..... Angle (LA)')
xlabel("FN");
ylabel("AA");
zlabel("LA");
f.color_map=jetcolormap(16);