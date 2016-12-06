function [S, Y]=generation_plan(x, y)
// Betty Fabre - Chyrine Tahri
// Generation d'un plan

x = 1:1:200;
y = 1:1:200;

 [X, Y] = meshgrid(x,y);
 Z = 15.*Y;
 mesh(x,y,Z);

 x1 = matrix(X,1,200*200);
 y1 = matrix(Y,1,200*200);
 Y = matrix(Z,1,200*200);
 S = [x1 x2];

 return;
