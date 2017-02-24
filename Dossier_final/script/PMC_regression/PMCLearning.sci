function  [reseau, stat,sorties] = PMCLearning(reseau, donnees, taux, err, nb_max)
// PMCLearning : apprentissage d'un perceptron multi-couches par algorithme
// 		de rétropropagation du gradient
//
//
// input :
//		- reseau : Perceptron multi-couches
//		- donnes : ensemble des données
//		- taux : taux d'apprentissage initial
//		- nb_max : nombre_max d'itération de l'algorithme
// output :
//		- reseau : Perceptron mis à jour après l'apprentissage
//		- stats : statistiques d'apprentissage
//

reseau.taux_apprentissage = taux;

ordre_Presentation = 'random' ;      

reseau.IH = rand(reseau.dim_entree+1, reseau.dim_cachees) ;
reseau.HO = rand(reseau.dim_cachees+1, reseau.dim_sortie) ;


// Initialisation des statistiques d'apprentissage
stat = [] ;

// Algo de rétropropagation

for iter = 1:nb_max

	tab = randperm(donnees.nb_exemples);
	stat_iter.mse = 0;
	sorties = zeros(donnees.nb_exemples,1);
	// Passage des points
	for i = 1:donnees.nb_exemples
		p = tab(i);	

		// Entrees et sorties souhaitées
		patt_in = donnees.coordonnees(p,:);
		patt_out = donnees.sorties(p);
		// Propagation complète : entree -> cachée -> sortie

		// Ajout du biais:
		patt_in = [patt_in 1];
		// Couche cachée
		hidden_output = PMCLayerPropagation(patt_in, reseau.IH);
		hidden_output = [hidden_output' 1]; // Ajout du biais
		// Sortie
		sortie = PMCLayerPropagation(hidden_output, reseau.HO);
		
		sorties(p) = sortie;
		// Calcul de l'erreur
		erreur = patt_out - sortie;


		//*************************************************
		// Ajustement des poids
		//*************************************************

		delta_HO = sortie.*(1-sortie).*erreur;
		delta_IH = hidden_output.*(1-hidden_output).*(reseau.HO*delta_HO')';

		eps = reseau.taux_apprentissage;
		reseau.HO = reseau.HO + eps*(delta_HO'*hidden_output)';
		d = patt_in'*delta_IH;
		s = length(delta_IH);
		reseau.IH = reseau.IH + eps*(delta_IH(1:(s-1))'*patt_in)';

		// Erreur quadratique moyenne
		stat_iter.mse = stat_iter.mse + sum(erreur.^2);

	end

	stat_iter.mse = stat_iter.mse / donnees.nb_exemples;
	//disp(stat_iter.mse);
	stat = [stat stat_iter.mse]
	
	// Arret
	if(stat_iter.mse <= err)
		break;
	end

end
reseau.nb_iter = iter;
reseau.mse = stat_iter.mse;

endfunction