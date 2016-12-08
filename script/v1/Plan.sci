function [S, Y] = generation_plan(x, y)
// Betty Fabre - Chyrine Tahri
// Generation d'un plan

//x = 1:1:200;
//y = 1:1:200;

n = length(x);

 [X, Y] = meshgrid(x,y);
 Z = 150.*Y;
 //mesh(x,y,Z);


 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);
 S = [x1; y1];
 S = S';
 Y = Y';

 endfunction

function [S, Y]=generation_plan_supp(x, y)
// Generation d'un plan avec suppression de points

//x = 1:1:200;
//y = 1:1:200;

 [X, Y] = meshgrid(x,y);
 Z = 150.*Y;

 //mesh(x,y,Z);

 
 n = length(x); 

 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);

 Y(10)=10;
 Y(30)=100;
 Y(50)=200;
 Y(150)=3000;

 S = [x1; y1];

 S = S';
 Y = Y';

 endfunction

 function [S, Y] = quadratique(x, y)
// Betty Fabre - Chyrine Tahri
// Generation d'un plan

//x = 1:1:200;
//y = 1:1:200;

n = length(x);

 [X, Y] = meshgrid(x,y);
 Z = 2*X.*X -3*Y.*Y + 8*X.*Y;
 //mesh(x,y,Z);
halt;
clf;

 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);
 S = [x1; y1];
 S = S';
 Y = Y';

 endfunction

 function [S, Y]=quadratique_faux(x, y)
// Generation d'un plan avec suppression de points

//x = 1:1:200;
//y = 1:1:200;

 [X, Y] = meshgrid(x,y);
 Z = 2*X.*X -3*Y.*Y + 8*X.*Y;

//mesh(x,y,Z);
//halt;
//clf;
 
 n = length(x); 

 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);

 Y(10)=10;
 Y(30)=-2100;
 Y(50)=500000;
 Y(150)=3000;

 S = [x1; y1];

  S = S';
 Y = Y';

 endfunction