// ============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011 - DIGITEO - Vincent COUVERT
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================
//
//
// <-- Short Description -->
// Non regression test for issue 553
// Bad value for dmodel.beta when dacefit called with one output argument (no perf output)

x = linspace(0,10,10)';
y=sin(x)

// First call with one output argument
dm1 = dacefit(x,y,regpoly0, corrgauss, 1)

// Second call with two output arguments
[dm2, perf] = dacefit(x,y,regpoly0, corrgauss, 1)

assert_checkequal(dm1.beta, dm2.beta);
