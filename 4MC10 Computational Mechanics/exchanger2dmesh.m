function [x, conn] = exchanger2dmesh(e)
% exchangermesh2d  Create mesh for 2D analysis of heat exchanger
%
% Usage:
%
%   [x, conn] = exchanger2dmesh(e)
%
% input:
%   e     basis vectors to be used
%
% output:
%   x     column containing the position vectors of the nodes
%   conn  connectivity matrix of the elements
%

% parameters
Ri =  2;
Ro = 20;
mc =  8;
mr =  3;

% construct nodes
n = mc * (3*mr + 2);
x = zeros(1, e, n, 1);
i = 0;
for er = 1:(mr+1)
  r = Ri + (Ro - Ri) * (er -  1 ) / mr;
  for ec = 1:mc
    theta1 = 2*pi * (ec -  1 ) / mc;
    theta2 = 2*pi * (ec - 1/2) / mc;
    x(i+1) = r * [ cos(theta1)  sin(theta1) ] * e;
    x(i+2) = r * [ cos(theta2)  sin(theta2) ] * e;
    i = i + 2;
  end
  if er ~= (mr+1)
    r = Ri + (Ro - Ri) * (er -  1/2 ) / mr;
    for ec = 1:mc
      theta = 2*pi * (ec -  1 ) / mc;
      x(i+1) = r * [ cos(theta)  sin(theta) ] * e;
      i = i + 1;
    end
  end
end

% construct elements
m = mc * mr;
conn = zeros(m, 8);
e = 0;
for er = 1:mr
  for ec = 1:mc
    ii = zeros(1, 8);
    ii(1) = (er-1)*mc*3 + (ec-1)*2 + 1;
    ii(2) = er*mc*3 + (ec-1)*2 + 1;
    ii(3) = er*mc*3 + (ec~=mc)*ec*2 + 1;
    ii(4) = (er-1)*mc*3 + (ec~=mc)*ec*2 + 1;
    ii(5) = (er-1)*mc*3 + mc*2 + ec;
    ii(6) = er*mc*3 + ec*2;
    ii(7) = (er-1)*mc*3 + mc*(1+(ec~=mc)) + ec + 1;
    ii(8) = (er-1)*mc*3 + ec*2;
    conn(e+1, :) = ii;
    e = e + 1;
  end
end
