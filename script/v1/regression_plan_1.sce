// Betty Fabre - Chyrine Tahri
// Regression du plan

// On prend la regression POLY0 et la corrélation GAUSS

exec Plan.sci

theta = [10 10];
lob = [1e-1 1e-1];
upb = [20 20];

x=1:10:200; y =x;
n = length(x);

X = gridsamp([0 0; 200 200], 50);

k = 50;

X1 = matrix(X(:,1),k,k);
X2 = matrix(X(:,2),k,k);

//-------------------------------------------------------------------
//Generation du plan normal:
//-------------------------------------------------------------------

[S, Y] = generation_plan(x,y);
//-------------------------------------------------------------------
// regression poly0
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);


YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
//surf(X1, X2, YX, 0.*YX+2);
xtitle('Extrapolation - Modèle Poly0','x','y','z');
drawnow;

halt;
//clf;
//-------------------------------------------------------------------
// regression poly1
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly1, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
//surf(X1, X2, YX, 0.*YX+5);
xtitle('Extrapolation - Modèle Poly1','x','y','z');
drawnow;


halt;
clf;
//-------------------------------------------------------------------
// regression poly2
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly2, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly2','x','y','z');
drawnow;

halt;
clf;
//-------------------------------------------------------------------
//Generation d'un plan avec des points "faux"
//-------------------------------------------------------------------

[S, Y] = generation_plan_supp(x,y);
//figure(3), mesh(S(:,1), S(:,2), Y);
//-------------------------------------------------------------------
// regression poly0
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);


YX = matrix(YX, size(X1))

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly0','x','y','z');
drawnow;


halt;
clf;
//-------------------------------------------------------------------
// regression poly1
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly1, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1))

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly1','x','y','z');
drawnow;


halt;
clf;
//-------------------------------------------------------------------
// regression poly2
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly2, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly2','x','y','z');
drawnow;


halt;
clf;

//-------------------------------------------------------------------
//Equation quadratique
//-------------------------------------------------------------------

[S, Y] = quadratique(x,y);
//figure(3), mesh(S(:,1), S(:,2), Y);
//-------------------------------------------------------------------
// regression poly0
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);


YX = matrix(YX, size(X1))

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly0','x','y','z');
drawnow;


halt;
clf;

//-------------------------------------------------------------------
// regression poly1
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly1, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly1','x','y','z');
drawnow;

halt;
clf;

//-------------------------------------------------------------------
// regression poly2
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly2, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly2','x','y','z');
drawnow;


halt;
clf;


//-------------------------------------------------------------------
//Equation quadratique faux
//-------------------------------------------------------------------

[S, Y] = quadratique_faux(x,y);
//figure(3), mesh(S(:,1), S(:,2), Y);
//-------------------------------------------------------------------
// regression poly0
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);


YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly0','x','y','z');
drawnow;


halt;
clf;
//-------------------------------------------------------------------
// regression poly1
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly1, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1))

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly1','x','y','z');
drawnow;


halt;
clf;
//-------------------------------------------------------------------
// regression poly2
//-------------------------------------------------------------------

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly2, corrgauss, theta, lob, upb);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

YX = matrix(YX, size(X1));

drawlater;
param3d1(S(:,1), S(:,2), list(Y,-1));
mesh(X1, X2, YX, YX);
xtitle('Extrapolation - Modèle Poly2','x','y','z');
drawnow;

halt;

clf;