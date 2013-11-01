addpath ("./common");

1;

clear all;
close all;
clc;

% Plots a given nonlinear transformation
function plottrans (spc, f, tit)
  x = y = linspace (spc(1), spc(2));

  [xx, yy] = meshgrid (x', y');

  contour (xx, yy, arrayfun (f, xx, yy));
  title (tit);

  xlabel ("w_1");
  ylabel ("w_2");
end

% Axis limits
limits = [-1 1];

% Plots each proposed error surface

% h = figure (1);
% plottrans (limits, @ (w1, w2) w2^2, "w_1 = 0, w_2 > 0");

% h = figure (2);
% plottrans (limits, @ (w1, w2) w1^2, "w_1 > 0, w_2 = 0");

% h = figure (3);
% plottrans (limits, @ (w1, w2) w1^2 + w2^2,  "w_1 > 0, w_2 > 0");

h = figure (4);
plottrans (limits, @ (w1, w2) -w1^2 + w2^2, "w_1 < 0, w_2 > 0");

% h = figure (5);
% plottrans (limits, @ (w1, w2) w1^2 + -w2^2, "w_1 > 0, w_2 < 0");

% Uncomment the following line in order to save the plot to a PNG file
% saveplot (h, 4, 3, "../img/plot_error_surface.png");
