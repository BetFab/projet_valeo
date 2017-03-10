function  [output] = PMCLayerPropagation(input, W)
// PMCLayerPropagation propagation à travers d'une couche définie par
//		des poids. La fonction d'activation utilisée est la fonction sigmoide
//
//
// input :
//		- input: vecteur contenant les données à propager
//		- W : Matrice contenant les poids de la couche
// output :
//		- output : vecteur contenant les données après propagation
//


// potentiel post-synaptique
prod_scal = W'*input';

// Fonction d'activation
output = 1./(1+exp(-prod_scal));
endfunction