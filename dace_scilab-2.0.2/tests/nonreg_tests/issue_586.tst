// ============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================
//
//
// <-- Short Description -->
// Non regression test for issue 586
// With some data, dacefit fails with an error in chol function (the matrix is not definite positive).

xs = [3.1415927;
        6.2712912;
        0.;
        1.586663;
        4.5061228;
        5.3946541;
        2.4751942;
        3.8714576]

fs = [0.0964357;
        0.0251002;
        2.;
        - 0.3312334;
        - 0.0440328;
        - 0.0069186;
        0.0355777;
        0.0071563]

ierr = execstr("[dd,pp] = dacefit(xs,fs,regpoly0,corrcubic,0.01,1,2)");

assert_checkequal(ierr, 0);

