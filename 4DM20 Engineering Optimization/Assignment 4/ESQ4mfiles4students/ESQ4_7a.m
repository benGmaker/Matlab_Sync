% Exercise 4.6a
clear

% Starting point
x0 = [-1 -1]';

% Initial guess Hessian
Hhat0 = [1 0; 0 1];

% Line search step
alpha = 0.1;
%alpha=0.001;

% Compute function value and gradient at x0
x=x0;
f0 = (1-x(1))^2 +(x(2)-x(1)^2)^2
df0 = [-2*(1-x(1))-4*(x(2) - x(1)^2)*x(1), 2*(x(2)-x(1)^2)];

% Inexact line search in quasi Newton direction inv(Hhat0)*df0'
% New iterate
x1 = x0 - alpha*inv(Hhat0)*df0'

% Compute function value, gradient, and true Hessian at x1
x=x1;
f1 = (1-x(1))^2 +(x(2)-x(1)^2)^2
df1 = [-2*(1-x(1))-4*(x(2) - x(1)^2)*x(1), 2*(x(2)-x(1)^2)];
H1 = [2-4*x(2)+12*x(1)^2, -4*x(1); -4*x(1), 2]

% BFGS Hessian estimate at x1
s0 = x1 - x0;
y0 = df1'-df0';
Hhat1 = Hhat0 - (Hhat0*s0*s0'*Hhat0)/(s0'*Hhat0*s0) + (y0*y0')/(y0'*s0)
