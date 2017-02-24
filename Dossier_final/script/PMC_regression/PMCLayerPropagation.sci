function  [output] = PMCLayerPropagation(input, W)
// PMCLayerPropagation propagation à travers d'une couche définie par
//		des poids. La fonction d'activation utilisée est la fonction tanh
//
//
// input :
//		- input: vecteur contenant les données à propager
//		- W : Matrice contenant les poids de la couche
// output :
//		- output : vecteur contenant les données après propagation
//

prod_scal = W'*input';

// On ramène la tangente hyperbolique entre 0 et 1 
// Pour pouvoir appliquer l'algorithme de MAJ des poids.
output = (tanh(prod_scal)+1)./2;
//output = prod_scal;
endfunction