// Betty Fabre - Chyrine Tahri
// Regression du plan

// On prend la regression POLY0 et la corrélation GAUSS


theta = [10 10];
lob = [1e-1 1e-1];
upb = [20 20];


// On créé le modéle avec dacefit

[dmodel, perf] = dacefit(S, Y, @regpoly0, @corrgauss, theta, lob, upb)
