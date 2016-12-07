// Betty Fabre - Chyrine Tahri
// Regression du plan

// On prend la regression POLY0 et la corrélation GAUSS


theta = [10 10];
lob = [1e-1 1e-1];
upb = [20 20];

//Generation du plan:
exec Plan.sci

x=1:10:200; y =x;
n = length(x);

[S, Y] = generation_plan(x,y);

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb);

X = gridsamp([-100 -100; 300 300], 10);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

X1 = matrix(X(:,1),10,10)
YX = matrix(YX, size(X1))
X2 = matrix(X(:,2),10,10);
drawlater;
mesh(X1, X2, YX);
xtitle('Extrapolation','x','y','z');
drawnow;

