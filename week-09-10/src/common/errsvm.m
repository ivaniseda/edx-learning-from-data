function ein = errsvm (model, X, y)
  [_, accuracy, _] = svmpredict (y, X, model, '-q');
  ein = 1 - accuracy(1) / 100;
end
