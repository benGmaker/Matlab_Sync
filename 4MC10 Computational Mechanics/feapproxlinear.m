function [E, c] = feapproxlinear(m)

% function [E, c] = polyapprox(p)
%
% Evaluates the error for a polynomial approximation of degree p (p >= 0).
% The condition number c of the least-squares matrix is also returned.

% exact field u(x)
x = (0:0.01:1)';
u = 5 .* x.^2 .* (1 - x.^2) ./ (2 - x);

% polynomial shape functions
N = zeros(length(x), 1);
for i = 1:(m+1)
  N(:,i) = x.^(i-1);
end

% construct approximation uh(x)
M = N' * N;
a = M \ N'*u;
uh = N * a;

% error and condition number
E = sqrt( sum( (uh - u).^2 ) / length(x) );
c = cond(M);

% plot result
%
plot(x, u, '-', x, uh, '--')
axis([0 1 0 1])
legend('exact', 'approximation', 'Location', 'NorthWest')
xlabel('x')
ylabel('u')
title(sprintf('E = %g', E))
%}
