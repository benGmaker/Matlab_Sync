function [x, conn] = notchedbarmesh(ee, mh, mv)
% notchedbarmesh   Create mesh for analysis of notched bar
%
% Usage:
%
%   [x, conn] = notchedbarmesh(ee)
%
% input:
%   ee    basis vectors to be used
%   mh    number of elements in horizontal direction on half of the specimen
%   mv    number of elements in vertical direction on half of the specimen
%
% output:
%   x     column containing the position vectors of the nodes (in mm!)
%   conn  connectivity matrix of the elements

% parameters
L = 60;
D = 20;
d = 10;
R = 20;
l = sqrt( R^2 - (R - D + d)^2 );
md = mh;
mn = ceil(0.4*mv);
ms = floor(0.6*mv);
m = 4 * mh * mv;
n = (2*mh + 1) * (2*mv + 1);

% generate nodes
i = 0;
X = zeros(1, ee, n, 1);
for ev = -(mn+ms):(mn+ms)
  if abs(ev) < mn
    y = ev * l / mn;
    dy = R + d - sqrt(R^2 - y.^2);
  else
    y = sign(ev) * (l + (abs(ev)-mn) * (L-l) / ms);
    dy = D;
  end
  for eh = -md:md
    x = eh * dy / md;
    i = i + 1;
    X(i) = [x y] * ee;  
  end
end
x = X;

% generate elements
e = 0;
conn = zeros(m, 4);
for ev = 1:(2*mn+2*ms)
  for eh = 1:(2*md)
    e = e + 1;
    iie = [ (ev-1) * (2*md+1) + eh
            (ev-1) * (2*md+1) + eh + 1
             ev    * (2*md+1) + eh + 1
             ev    * (2*md+1) + eh     ]';
    conn(e, :) = iie;
  end
end


