function  [X, max] = scaling(X)
// SCALING ramène les valeurs entre 1 et -1
//				 
// input :
//		- X : données à normaliser
// output :
//		- X : données normalisées
//		- max : maximum en valeur absolue des données

max = max(abs(X));
if(max > 1) then
	X = X./max;
end
endfunction