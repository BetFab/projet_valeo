function [z_pt]=IDW(x_pt,y_pt,X,Y,Z)
    //IDW : Pondération inverse a la distance
    // input :
    //		- x_pt,y_pt : coordonnées du point à interpoler
    //		- X, Y, Z: coordonnées et valeurs des données
    // output :
    //		- z_pt : valeur d'interpolation au point cherché
    total=0;
    somme_poids=0;
    //for j=1:length(Z)
     //       M=M+1/sqrt((x_pt-X(j))**2 + (y_pt-Y(j))**2);
    //end
    for i=1:length(X)
        dist=sqrt((x_pt-X(i))^2+(y_pt-Y(i))^2);  
        poids=1/dist; 
        valeur=poids*Z(i);
        total=total+valeur;
        somme_poids=somme_poids+poids;
    end
    z_pt=total/somme_poids;
endfunction

