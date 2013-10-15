1;

% Probability that a single sample has at least one red ball is 1 minus the
% probability that a single sample has no red balls:
%
% = 1 - (1-mu)^N
% = 1 - 0.45^10
% = 0.9996595
%
% The probability that all 1000 samples have at least one red ball is:
%
% = (1 - (1-mu)^N)^1000
% = (1 - 0.45^10)^1000
% = 0.9996595^1000
% = 0.711
%
% The probability we want is that one or more samples have no red balls which
% equals 1 minus the probability that all 1000 samples have at lease one
% red ball:
%
% = 1 - 0.711
% = 0.289

function b = noRedMarble (N, mu)
  b = length (find (rand (N, 1) <= mu)) == 0;
end

function b = hasSampleWithNoRedMarbles (N, mu, samples)
  results = arrayfun (@ (_) noRedMarble (N, mu), zeros (samples, 1));
  b = length (find (results == 1)) > 0;
end

% Number of times the experiment will run in order to average the probability
iters = 10000;

% Number of samples
samples = 1000;

% Number of marbles per sample
N = 10;

% Probability of picking a red marble
mu = 0.55;

% Result of each iteration
results = arrayfun (@ (_) hasSampleWithNoRedMarbles (N, mu, samples), zeros (iters, 1));

printf("Probability of picking no red marbles: %.3f\n", mean (results));
