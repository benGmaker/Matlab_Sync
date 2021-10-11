% onedimensionalexample_prelim
%
% Preliminary version of the program for the one-dimensional example
% problem of a fancy fair ride.
% A constant cross section area A(x) = A0 is used instead of the exponential
% dependence defined in the problem.
% The system matrices have been integrated analytically.

% parameters of the problem (in SI units)
L     = 25;
A0    = 0.040;
rho   = 7800;
E     = 210e9;
M     = 3900;
omega = 4.0;

% parameters of the finite element discretisation
m = 4;
n = m + 1;
x = linspace(0, L, n)';

% assemble system matrices in element loop
K = zeros(n, n);
f = zeros(n, 1);
for e = 1:m
    
    iie = [e e+1];
    xe  = x(iie);
        
    % compute element matrices
    h  = xe(2) - xe(1);
    Ke = E*A0/h * [  1  -1
                    -1   1 ];
    fe = 1/6*rho*omega^2*A0*h * [ 2*xe(1)+  xe(2)
                                    xe(1)+2*xe(2) ];

    % store element matrices in system matrices
    K(iie, iie) = K(iie, iie) + Ke;
    f(iie)      = f(iie)      + fe;
  
end

K, f

% apply boundary conditions by partitioning
Kgg = K(1  , 1  );
Kfg = K(2:n, 1  );
Kgf = K(1  , 2:n);
Kff = K(2:n, 2:n);

fg  = f(1  );
ff  = f(2:n);

ug  = 0;
qf  = [zeros(n-2, 1); M*omega^2*L];

% solve the system for unknowns
uf = Kff \ (ff + qf - Kfg*ug);
u  = [ug; uf]

qg = Kgg * ug + Kgf * uf - fg;
q = [qg; qf]

% plot the solution and compare with exact solution (for A(x) = A0)
xe = 0:0.01*L:L;
ue = (rho*omega^2)/(6*E) * xe .* (3*L^2-xe.^2) + (M*omega^2*L)/(E*A0)*xe;

figure
plot(xe, ue, 'g--', x, u, 'bo-')
axis([0 L 0 1e-2])
xlabel('x [m]')
ylabel('u [m]')
