// For ZZ2 2017 - equation determinist part
// Not efficient programming done on purpose to improve understanding
// Functions and hypermatrix could be used...
 
// Clear and allocate up to 2 GB memory (Scilab 5 limitation -> should be solved in Scilab 6)
clear ;          // Clear all variables
clc;             // Clear console
xdel(winsid());  // Close all figures
lines(50,120);   // Plot console using x lines and y columns
stacksize max;   // Max possible stacksize (2 GB)


// Input grid
// ----------
nx = 5; ny = 10;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);


// Sites (one column per vector)
S = [X(:), Y(:)];

// Example 1 - plane equations using regpoly1
// ------------------------------------------

disp(repmat('-',1,11),"1. Plane equations using regpoly1");

// Case 1.1 Z = X-Y
disp("Equation 1.1 : Z = X - Y");
V11 = X-Y ;
V11 = V11(:); // column vector

mprintf('Z mean is : %5.3f\n',mean(V11));

[dmodel11, perf11] = dacefit(S, V11, regpoly1, correxp, 1, 0.1, 200);

beta11 = dmodel11.beta ;

mprintf('Beta model values for equation 1.1 are :\n %5.3f %5.3f %5.3f\n',beta11(1),beta11(2),beta11(3))

// Case 1.2 Z = X - 10* Y
disp("Equation 1.2 : Z = X - 10*Y");
V12 = X-10*Y ;
V12 = V12(:); // column vector

mprintf('Z mean is : %5.3f\n',mean(V12));

[dmodel12, perf12] = dacefit(S, V12, regpoly1, correxp, 1, 0.1, 200);

beta12 = dmodel12.beta ;

mprintf('Beta model values for equation 1.2 are :\n %5.3f %5.3f %5.3f\n',beta12(1),beta12(2),beta12(3))


// Case 1.3 Z = X - 10* Y + 3
disp("Equation 1.3 : Z = X - 10*Y + 3");
V13 = X-10*Y + 3 ;
V13 = V13(:); // column vector

mprintf('Z mean is : %5.3f\n',mean(V13));

[dmodel13, perf13] = dacefit(S, V13, regpoly1, correxp, 1, 0.1, 200);

beta13 = dmodel13.beta ;

mprintf('Beta model values for equation 2 are :\n %5.3f %5.3f %5.3f\n\n',beta13(1),beta13(2),beta13(3))


// Example 2 - quadratic surface equation using regpoly2
// -----------------------------------------------------

disp(repmat('-',1,12),"2. Quadratic equation using regpoly2");

disp("Equation 2 : Z = X.^2 + 5* Y.^2");

V2 = X.^2 + 5* Y.^2 ;
V2 = V2(:); // column vector

mprintf('Z mean is : %5.3f\n',mean(V2));

[dmodel2, perf2] = dacefit(S, V2, regpoly2, correxp, 1, 0.1, 200);

beta32 = dmodel2.beta ;

mprintf('Beta model values for equation 3 are :\n %5.3f %5.3f %5.3f %5.3f %5.3f %5.3f\n',beta32(1),beta32(2),beta32(3),beta32(4),beta32(5),beta32(6));


// Example 3 - Quadratic surface equation using regpoly0 / 1 / 2
// -------------------------------------------------------------

disp(repmat('-',1,14),"3. Same quadratic but using regpoly 0/1/2");

disp("Equation 3 : Z = 0.1 * X.^2 + 5* Y.^2 ");

V3mat =  0.1 * X.^2 + 5* Y.^2;

// V3mat = Y.^2;

V3 = V3mat(:); // column vector

mprintf('Z mean is : %5.3f\n',mean(V3));

[dmodel30, perf30] = dacefit(S, V3, regpoly0, correxp, 1, 0.1, 200);
[dmodel31, perf31] = dacefit(S, V3, regpoly1, correxp, 1, 0.1, 200);
[dmodel32, perf32] = dacefit(S, V3, regpoly2, correxp, 1, 0.1, 200);

beta30 = dmodel30.beta ;
beta31 = dmodel31.beta ;
beta32 = dmodel32.beta ;

mprintf('Beta model value using regpoly 0 and equation 3 is :\n %5.3f\n',beta30(1));
mprintf('and the estimated process variance is %5.3f\n',dmodel30.sigma2);

mprintf('Beta model value using regpoly 1 and equation 3 are :\n %5.3f %5.3f %5.3f\n',beta31(1),beta31(2),beta31(3));
mprintf('and the estimated process variance is %5.3f\n',dmodel31.sigma2);

mprintf('Beta model value using regpoly 2 and equation 3 are :\n %5.3f %5.3f %5.3f %5.3f %5.3f %5.3f\n',...
beta32(1),beta32(2),beta32(3),beta32(4),beta32(5),beta32(6));
mprintf('and the estimated process variance is %5.3f\n',dmodel32.sigma2);


// Example 4 - prediction based on example 3 using regpoly0 / 1 / 2
// -----------------------------------------------------------------

disp(repmat('-',1,20),"4. Kriging prediction based on equation 3 for removed points");

// Remove some points (replace values by %nan) and plot the resulting surface :
// all the values corresponding to the index ind will be set to the Nan value
N = size(V3,1);

indnan = unique(ceil(rand(floor(N),1)*N)); // May remove randomly ~ 50 % of points
// Do not refer to the truncated surface as surf needs more than one point to work...
// TODO : remove much more points (80%)
V4 = V3 ;
V4(indnan) = %nan;

// Based on the remaining values of V4 vector (i.e. not Nan ones), build the kriging models

indvalues = find(~isnan(V4));
V4remain = V4(indvalues);

[dmodel40, perf40] = dacefit(S(indvalues,:), V4remain, regpoly0, correxp, 1, 0.1, 200);
[dmodel41, perf41] = dacefit(S(indvalues,:), V4remain, regpoly1, correxp, 1, 0.1, 200);
[dmodel42, perf42] = dacefit(S(indvalues,:), V4remain, regpoly2, correxp, 1, 0.1, 200);

beta40 = dmodel40.beta ;
beta41 = dmodel41.beta ;
beta42 = dmodel42.beta ;

mprintf('Beta model value using regpoly 0 and equation 3 is :\n %5.3f\n',beta40(1));
mprintf('and the estimated process variance is %5.3f\n',dmodel40.sigma2);

mprintf('Beta model value using regpoly 1 and equation 3 are :\n %5.3f %5.3f %5.3f\n',beta41(1),beta41(2),beta41(3));
mprintf('and the estimated process variance is %5.3f\n',dmodel41.sigma2);

mprintf('Beta model value using regpoly 2 and equation 3 are :\n %5.3f %5.3f %5.3f %5.3f %5.3f %5.3f\n',...
beta42(1),beta42(2),beta42(3),beta42(4),beta42(5),beta42(6));
mprintf('and the estimated process variance is %5.3f\n',dmodel42.sigma2);

// Predict the missing values

[prediction40, mse40] = predictor(S(indnan,:), dmodel40);
[prediction41, mse41] = predictor(S(indnan,:), dmodel41);
[prediction42, mse42] = predictor(S(indnan,:), dmodel42);

mprintf('\nThe maximum mean square error in regpoly0 case is %5.3f\n',max(mse40));
mprintf('The maximum mean square error in regpoly1 case is %5.3f\n',max(mse41));
mprintf('The maximum mean square error in regpoly2 case is %5.3f\n',max(mse42));

// Max. errors done vs. orginal V3 matrix
// (we could manage all these plots using a single variable, for example with multi-columns...)

// Regpoly0
V4poly0 = V4;
V4poly0(indnan)=prediction40;
maxerror0 = max(V3-V4poly0);

mprintf('\nRegpoly 0 : the maximum error vs. original equation is %5.3f\n',maxerror0);


// Regpoly1
V4poly1 = V4;
V4poly1(indnan)=prediction41;
maxerror1 = max(V3-V4poly1);

mprintf('Regpoly 1 : the maximum error vs. original equation is %5.3f\n',maxerror1);


// Regpoly2
V4poly2 = V4;
V4poly2(indnan)=prediction42;
maxerror2 = max(V3-V4poly2);

mprintf('Regpoly 2 : the maximum error vs. original equation is %5.3f\n',maxerror2);

// Plot the corresponding V3-V4 surfaces
// -------------------------------------

// Plot initial surface
figtmp = scf();
figtmp.figure_size=[1200,900];

subplot(231);
surf(x,y,V3mat');
title('Original surface');
figtmp.children(1).rotation_angles = [60 -60] ;
figtmp.color_map = jetcolormap(16);

// Plot the truncated surface
subplot(232);
surf(x,y,matrix(V4,nx,ny)'); // surf requires a matrix to plot
title('Removing points from original surface...');
figtmp.children(1).rotation_angles = [60 -60] ;
figtmp.color_map = jetcolormap(16);

// Plot Regpoly0 
subplot(234);
surf(x,y,matrix(V4poly0,nx,ny)'); // surf requires a matrix to plot
title('Interpolation using regpoly 0...');
figtmp.children(1).rotation_angles = [60 -60] ;
figtmp.color_map = jetcolormap(16);

// Regpoly1
subplot(235);
surf(x,y,matrix(V4poly1,nx,ny)'); // surf requires a matrix to plot
title('Interpolation using regpoly 1...');
figtmp.children(1).rotation_angles = [60 -60] ;
figtmp.color_map = jetcolormap(16);

// Regpoly2
subplot(236);
surf(x,y,matrix(V4poly2,nx,ny)'); // surf requires a matrix to plot
title('Interpolation using regpoly 2...');
figtmp.children(1).rotation_angles = [60 -60] ;
figtmp.color_map = jetcolormap(16);






