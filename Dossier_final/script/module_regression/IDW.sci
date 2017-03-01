function [Zinterp]=IDW(Xinterp,Yinterp,X,Y,Z)
    //IDW : Pondération inverse a la distance
    // input :
    //		- Xinterp,Yinterp : coordonnées du point à interpoler
    //		- X, Y, Z: coordonnées des données
    // output :
    //		- Zinterp : valeur d'interpolation au point cherché
    zpt=0;
    //for j=1:length(Z)
    //        M=M+1/sqrt((xpt-X(j))**2 + (ypt-Y(j))**2);
    //end
    Zinterp=zeros(length(Xinterp),1);
    for j=1:length(Xinterp)
        M=0;
        for k=1:length(X)
            M=M+1/sqrt((Xinterp(j)-X(k))^2+(Yinterp(j)-Y(k))^2);
        end
        for i=1:length(Z)
            dist=1/sqrt((Xinterp(j)-X(i))^2+(Yinterp(j)-Y(i))^2);   
            poids=dist/M;// = lambda-i
            Zinterp(j)=Zinterp(j)+poids*Z(i);
        end
    end
    
    
endfunction

