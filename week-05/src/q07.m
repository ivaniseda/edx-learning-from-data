1;

addpath ("./common");

clear all;
clc;

% Function that defines the error surface
errfunc = @ (w) (w(1) * exp (w(2)) - 2*w(2) * exp (-w(1)))^2;

% Function that computes the gradient for the error surface
function nw = errfuncgrad (w)
  u = w(1);
  v = w(2);

  % Partial derivative with respect to u and v, respectively
  du = 2 * exp (-2*u) * (u*exp (u+v) - 2*v) * (exp (u+v) + 2*v);
  dv = 2 * exp (-2*u) * (u*exp (u+v) - 2) * (u*exp (u+v) - 2*v);

  nw = [du; dv];
end

% Learning rate
eta = 0.1;

% Error tolerance
errprec = 10^-21;

% Maximum number of GD iterations
iters = 15;

% Initial weights
w= ones (2, 1);

% Runs coordinate descent
[w, epoch] = cgd (w, eta, errfunc, @errfuncgrad, errprec, iters);

fprintf ("Ein: %f\n", errfunc (w));
