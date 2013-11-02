1;

addpath ("./common");

clear all;
clc;

% Learning rate
eta = 0.1;

% Error tolerance
errprec = 10^-14;

% Maximum number of GD iterations
iters = 1000;

% Initial weights
w= ones (2, 1);

% Runs gradient descent
[w, epoch] = gd (w, eta, @errfunc, @errfuncgrad, errprec, iters);

fprintf ("Num of iterations: %d\n", epoch);
fprintf ("Final value of w : (%f, %f)\n", w');
