% vectorexample
%
% Two-dimensional vector example.
% This program computes the stess and strain state in a coating which is
% subjected to a micro-indentation.
% The influence of gravity is included, although its effect on the results
% is neglegible.

% parameters of the problem (in SI units)
H     = 20e-6;
L     = 50e-6;
T     = 1.0e-3;
d     = 2.0e-6;
g     = 9.81;
rho   = 4.0e3;
kappa = 30e6;
G     = 20e6;

% finite element discretisation
ee = cartesianbasis2d('e1', 'e2');
e1 = ee(1);
e2 = ee(2);

[x, conn] = femgrid([L H], [10 4], ee, 'ElementType', 'Linear');
m = size(conn, 1);
n = size(x, 1);

figure;
femplot(x, conn, 'ElementNumbers', 'on', 'Nodes', 'on', 'NodeNumbers', 'on');
axis equal

xi = [ -1/sqrt(3)*e1 - 1/sqrt(3)*e2
        1/sqrt(3)*e1 - 1/sqrt(3)*e2
        1/sqrt(3)*e1 + 1/sqrt(3)*e2
       -1/sqrt(3)*e1 + 1/sqrt(3)*e2 ];
w  = [ 1
       1
       1
       1 ];

% determine coefficient tensor
I   = identity(2, ee);
I4  = identity(4, ee);
I4S = 1/2 * (I4 + rtranspose(I4));
C   = kappa * I*I + 2*G * (I4S - 1/3*I*I);

% assemble system matrices in element loop
K = zeros(2, ee, n, n);
f = zeros(1, ee, n, 1);
for e = 1:m

    iie = conn(e, :);
    xe  = x(iie);
        
    % compute element matrices in integration point loop
    Ke = zeros(2, ee, 4, 4);
    fe = zeros(1, ee, 4, 1);
    for k = 1:4
        
        xi1 = dot(xi(k), e1);
        xi2 = dot(xi(k), e2);

        Ne = [ 1/4*(1-xi1)*(1-xi2)
               1/4*(1+xi1)*(1-xi2)
               1/4*(1+xi1)*(1+xi2)
               1/4*(1-xi1)*(1+xi2) ];

        gradxiNe = [ -1/4*(1-xi2)*e1 - 1/4*(1-xi1)*e2
                      1/4*(1-xi2)*e1 - 1/4*(1+xi1)*e2
                      1/4*(1+xi2)*e1 + 1/4*(1+xi1)*e2
                     -1/4*(1+xi2)*e1 + 1/4*(1-xi1)*e2 ];
        
        J = gradxiNe' * xe;
        gradNe = dot(inv(J), gradxiNe);
        
        Ke = Ke + w(k) * dot(gradNe, C, gradNe') * T * det(J);
        fe = fe - w(k) * Ne * rho*g*e2 * T * det(J);
        
    end
    
    % store element matrices in system matrices
    K(iie, iie) = K(iie, iie) + Ke;
    f(iie)      = f(iie)      + fe;
    
end

% apply boundary conditions by partitioning
iig = [1:11 12:11:45 22:11:55 49:51];
iif = setdiff(1:n, iig);

Kgg = K(iig, iig);
Kfg = K(iif, iig);
Kgf = K(iig, iif);
Kff = K(iif, iif);

fg  = f(iig);
ff  = f(iif);

ug  = [zeros(1, ee, length(iig)-3, 1); -d*e2*ones(3, 1)];
qf  = zeros(1, ee, length(iif), 1);

% solve the system for unknowns
uf = Kff \ (ff + qf - dot(Kfg, ug));
u = zeros(1, ee, n, 1);
u(iig) = ug;
u(iif) = uf;

qg = dot(Kgg, ug) + dot(Kgf, uf) - fg;
q = zeros(1, ee, n, 1);
q(iig) = qg;
q(iif) = qf;

% plot the displacement solution
figure
quiver(x, u, 0);
axis equal
femplot(x+u, conn, 'Color', 'r');

% compute rection force on the indenter tip
F = q(49) + q(50) + q(51)

% compute strain and stress at the centre of the tip
e   = 35;
xi1 = 1;
xi2 = 1;

iie = conn(e, :);
xe  = x(iie);
ue  = u(iie);

gradxiNe = [ -1/4*(1-xi2)*e1 - 1/4*(1-xi1)*e2
              1/4*(1-xi2)*e1 - 1/4*(1+xi1)*e2
              1/4*(1+xi2)*e1 + 1/4*(1+xi1)*e2
             -1/4*(1+xi2)*e1 + 1/4*(1-xi1)*e2 ];

J = gradxiNe' * xe;
gradNe = dot(inv(J), gradxiNe);

gradu   = gradNe' * ue;
epsilon = 1/2 * (gradu + gradu')

sigma = ddot(C, epsilon)
