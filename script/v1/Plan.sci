function [S, Y] = generation_plan(x, y)
// Betty Fabre - Chyrine Tahri
// Generation d'un plan

//x = 1:1:200;
//y = 1:1:200;

n = length(x);

 [X, Y] = meshgrid(x,y);
 Z = 15.*Y;
 //mesh(x,y,Z);

 x1 = matrix(X,1,n*n);
 y1 = matrix(Y,1,n*n);
 Y = matrix(Z,1,n*n);
 S = [x1; y1];
 S = S';

 endfunction
