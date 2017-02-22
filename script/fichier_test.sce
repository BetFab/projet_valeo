DACEPath = get_absolute_file_path('fichier_test.sce');

loadmatfile(DACEPath + 'data1.mat');
// S chargé par magie
I = [1:10];
S(I,:)
[f df] = regpoly0(S); 1
f(I,:)
[f df] = regpoly1(S); 1 x y
f(I,:)
[f df] = regpoly2(S); 1 x y x2 xy y2