function  [X, max_x] = scaling(X)
// SCALING ramène les valeurs entre 1 et -1
//				 
// input :
//		- X : données à normaliser
// output :
//		- X : données normalisées
//		- max : maximum en valeur absolue des données

max_x = max(abs(X));
if(max_x > 1) then
	X = X./max_x;
end
endfunction