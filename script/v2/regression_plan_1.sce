// Betty Fabre - Chyrine Tahri
// Regression du plan

// On prend la regression POLY0 et la corrélation GAUSS


theta = [10 10];
lob = [1e-1 1e-1];
upb = [20 20];

//Generation du plan:
exec generation_plan.sce

// On créé le modéle avec dacefit
[dmodel, perf] = dacefit(S, Y, regpoly0, corrgauss, theta, lob, upb)

X = gridsamp([0 0;200 200], 60);

// nombre de site mx !=1 donc or = MSE mean squared error of the predictor
[YX MSE] = predictor(X, dmodel);

X1 = matrix(X(:,1),60,60);
YX = matrix(YX, size(X1));
X2 = matrix(X(:,2),60,60);

figure(1), mesh(X1, X2, YX)
plot3(S(:,1),S(:,2),Y,’.k’, ’MarkerSize’,10)

