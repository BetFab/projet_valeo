function  [X, mu, sigma] = normalisation(X)
// NORMALISATION centre et réduit les données
//				 permet de mettre toutes les données à la même échelle
//				 après normalisation mu =  0 et sigma = 1
//				 
// input :
//		- X : données à normaliser
// output :
//		- X : données normalisées
//		- mu : moyenne des données
//		- sigma : écart-type des données


mu = mean(X);
sigma = stdev(X);
X = (X - mu)./sigma;

endfunction