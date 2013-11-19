% Runs dual SVM and returns the weight vector and the support vectors
function [w, sv] = svm (X, y, k, iters)

  % Number of examples
  N = length (X);

  % Linear coefficient
  q = ones (N, 1) .* -1;

  % Subject to
  A = y';
  b = 0;

  % Lower and upper bounds
  lb = zeros (N, 1);
  ub = [];

  % Other options
  options = optimset ("MaxIter", iters);

  % Quadratic coefficients
  H = ((y * y') .* k (X, X));

  % Initial guess for the alphas
  x0 = [];

  % Adds some noise to make things easier for qp ()
  Hm = H + eye (N) .* 1e-15;

  % Uses the slightly modified matrix to get a reliable initial guess for the alphas
  % Without this step, qp () fails to converge
  [x0 obj info lambda] = qp (x0, Hm, q, A, b, lb, ub, options);

  % Solves the quadratic programming to get the final alphas
  [a obj info lambda] = qp (x0, H, q, A, b, lb, ub, options);

  % Finds the support vectors
  sv = find (a > 1e-7);

  % Returns weight vector w from x
  w = sum (a(sv) .* y(sv) .* X(sv, :))';

  % Returns the b value using the first support vector found
  fsv = sv(1);
  b = y(fsv) - sum (a(sv) .* y(sv) .* k (X(sv, :), X(fsv, :)));

  % B is the x0
  w = [b; w];
end
