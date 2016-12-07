function [S, Y]=generation_plan_supp(x, y)
// Generation d'un plan avec suppression de points

//x = 1:1:200;
//y = 1:1:200;

 [X, Y] = meshgrid(x,y);
 Z = 15.*Y;

 mesh(x,y,Z);
 
 n = length(x); 
 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);
 Y(10)=10;
 Y(30)=100;
 Y(50)=200;
 Y(150)=3000;
 S = [x1; y1];

 return;
