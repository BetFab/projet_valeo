function [zpt]=IDW(xpt,ypt,X,Y,Z)
    //IDW : Pondération inverse a la distance
    // input :
    //		- xpt,ypt : coordonnées du point à interpoler
    //		- X, Y, Z: coordonnées des données
    // output :
    //		- zpt : valeur d'interpolation au point cherché
    zpt=0;
    M=0;
    for j=1:length(Z)
            M=M+1/sqrt((xpt-X(j))**2 + (ypt-Y(j))**2);
    end
    
    for i=1:length(Z)
        dist=1/sqrt((xpt-X(i))**2 + (ypt-Y(i))**2);        
        poids=dist/M;// = lambda-i
        zpt=zpt+poids*Z(i);
    end
    
endfunction

