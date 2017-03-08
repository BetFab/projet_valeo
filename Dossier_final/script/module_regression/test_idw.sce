clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
//lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)

// charge les fonctions .sci du module
getd(get_absolute_file_path('test_idw.sce'));


// Création d'une grille:
nx = 30; ny = 30;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
// Calcul d'une fonction sur la grille 
deff("z=f(x,y)","z=3*x.^2 + 5*y.^2+x*y -6 -2*x")
Z = f(X,Y);
Z=Z(:);

// Affichage de la surface
//clf()
//subplot(1,2,1)
//plot3d(x,y,Z);
//title("Surface initiales");

N = size(Z,1);

indnan = unique(ceil(rand(floor(N/2),1)*N)); // May remove randomly ~ ? % of points
// TODO : points à supprimer à voir..
Z1 = Z ;
Z1(indnan) = %nan;
X=X(:);
Y=Y(:);
indvalues = find(~isnan(Z1));
indinterp = find(isnan(Z1));
Z1remain = Z1(indvalues);
X2=X(indinterp);
Y2=Y(indinterp);
X1=X(indvalues);
Y1=Y(indvalues);
Z2=zeros(length(X2),1);
disp(size(Z2))
for i=1:length(Z2)
    Z2(i)=IDW(X2(i),Y2(i),X1,Y1,Z1remain);
end
Z=matrix(Z,length(x),length(y));
clf()
subplot(2,2,1)
plot3d(x,y,Z);
title("Surface initiale");
Z=Z(:);
Z(indinterp)=%nan
Z=matrix(Z,length(x),length(y));
subplot(2,2,2)
plot3d1(x,y,Z);
title("Surface tronquée");
Z=Z(:);
Z(indinterp)=Z2;
Z=matrix(Z,length(x),length(y));

subplot(2,2,3)
plot3d1(x,y,Z);
title("Surface IDW");

subplot(2,2,4)
param3d1(X2,Y2,list(Z2,-1))
title("Points interpolés")




// ---------






