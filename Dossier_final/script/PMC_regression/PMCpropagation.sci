function sortie = PMCpropagation (reseau, x)
// PMCpropagation propagation d'un exemple x ) travers le réseau
// 
//
// input :
//		- reseau : Perceptron multi-couches
//		- x : données à propager
// output :
//		- sortie : valeur en sortie du perceptron
//


x = [x 1];
sortie_cachee = PMCLayerPropagation(x, reseau.IH);
sortie_cachee = [sortie_cachee' 1];
sortie = PMCLayerPropagation(sortie_cachee, reseau.HO);

endfunction