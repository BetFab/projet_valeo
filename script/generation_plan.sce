//function []=generation_plan(x1, ...,xm)
// Betty Fabre - Chyrine Tahri
// Generation d'un plan

x = 1:1:200;
y = 1:1:200;

 [X, Y] = meshgrid(x,y);
 Z = 15.*Y;
 mesh(x,y,Z);
