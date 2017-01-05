// Betty FABRE
// Chyrine TAHRI
// Implémentation de l'exemple de Krigeage ordinaire dans le
// livre d'Isaaks
// NE MARCHE QUE SUR SCILAB 6


// -------- DATA ------------
// Initialisation

X = [61 63 64 68 71 73 75];
Y = [139 140 129 128 140 141 128];

V = [477 696 227 646 606 791 783];

// Points que l'on veut estimer (environ ce point..):
X1 = 65;
Y1 = 137;


n = length(X);


// Affichage des points
clf();
scatter3(X,Y,V,"fill");

// Matrice des distances entre chaque point
H = zeros(n, n);

for i=1:n
	for j=1:n
		H(i,j) = sqrt((Y(j) - Y(i))^2 + (X(j) - X(i))^2);
	end
end
H
// Calcul des covariances avec la fonction exp
// C = C0 + C1 si h = 0
// C = C1*exp(-3*h/a) sinon 

// Choix des paramètres:
 C0 = 0; 		// absence de 'Nugget Effect'
 a = 10;		// range
 C1 = 10;		

 sigma_carre = C0 + C1 		// variance des va ou 'sill's

 // Matrice C des covariances:

 // initialisation
  C = zeros(n + 1,n + 1);

 // Fonction exp
  C(1:n,1:n) = 10.*exp(-0.3.*abs(H));

 // Dernières lignes et colonnes ? contraintes = 1 ?
  C(n + 1,:) = [ones(1,n) 0];
  C(:,n + 1) = [ones(n,1); 0];

  // Matrice D
  D = ones(n+1, 1);
  D(1:n) = 10.*exp(-0.3.*abs(sqrt((Y - Y1).^2 + (X - X1).^2)));
 
  // L'inverse de C : 
  // inv(C) // OK

  // Calcul des poids
  w = inv(C) * D 

  // Estimation en ppm? 
  V1 = V*w(1:n)

  X2 = [X X1];
  Y2 = [Y Y1];
  V2 = [V V1];
  scatter3(X2,Y2,V2,"fill", "markerFaceColor", "red");
  scatter3(X,Y,V,"fill"); // superpose les deux graphiques... temp

  // Variance minimisée:
  // -- QUESTION -> mu négatif ?

  sigma_R = sigma_carre - sum(w(1:n).*D(1:n)) + abs(w(n+1))

  //--------------------------------------------------------------
  // Utilisation d'une fonction de covariance "sphérique"
  // --> on change la "continuité spatiale"
  //--------------------------------------------------------------
  // C(h) = sigma_carre(1-1.5(h/a)+0.5(h/a)^3) si h<a
  //		0 sinon

  // Distance 0 (avec le point à estimer)
  d = sqrt((Y - Y1).^2 + (X - X1).^2);
  d
 for i=1:n
	for j=1:n
		if H(i,j)<a
			C(i,j) = sigma_carre*(1-1.5*H(i,j)/a+0.5*((H(i,j)/a)^3));
		else
			C(i,j) = 0;
		end
		D(i) = sigma_carre*(1-1.5*d(i)/a+0.5*((d(i)/a)^3));
	end
	if d(i)<a
		D(i) = sigma_carre*(1-1.5*d(i)/a+0.5*((d(i)/a)^3));
	else
		D(i) = 0;
	end
end
C
D // Seul le dernier point est à une distance > a=10
 // Calcul des poids
  w = inv(C) * D 

  // Estimation en ppm? 
  V1 = V*w(1:n)

  X2 = [X X1];
  Y2 = [Y Y1];
  V2 = [V V1];
  scatter3(X2,Y2,V2,"fill", "markerFaceColor", "green");
  scatter3(X,Y,V,"fill"); // superpose les deux graphiques... temp


  // Conclusion : le point est plus bas 