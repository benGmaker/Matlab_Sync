% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2019-2020
% Example 1: Finding a quadratic Lyapunov function for a linear system
%            V(x)=x'Px;
% -------------------------------------------------------------------------
close all
clear all

% system dynamics
A = [-1 2 0;-3 -4 1;0 0 -2];

% The function sdpvar(n,m) generates an unknown variable array for the
% LMI-solver of the desired dimension (n rows times m columns).
% Additionally, specific structure within the matrix can be also be
% defined (square matrices are by default defined to be symmetric).

% example if P should be diagonal
Pvar = sdpvar(3,3,'diagonal');
% note: variables generated with sdpvar are compatible with many normal
% matlab functions, e.g., the same result as above would be obtained by:
% pvar = sdpvar(3,1);
% Pvar = diag(pvar);

% Now, Pvar represents the (structured) unkown variable for the matrix P in
% the LMI-solver. We do not use P here because the function value() needs
% to be used later to convert Pvar into a numeric Matlab matrix. Rather
% than using P = value(P), which may lead to wrong re-assignments in
% Matlab, we shall use Pvar as variable and then P = value(Pvar) to
% retrieve the solution in matrix format.

% We are now ready to define the constraints.

Q = 0.1*eye(3); % Matrix related to the decrease rate

% Define the constraints
Lp = Pvar >= 1e-9;              % positive definiteness of P
Lf = A'*Pvar+Pvar*A + Q <= 0;   % decrease of the Lyapunv function in flow
L = [Lp,Lf];                    % combine LMIs
% We use Pvar>= 1e-9 instead of Pvar>0, as strict inequalities do not make
% much sense in continuous numerical optimization.

% Solving the LMI conditions with SDPT3: optimize() creates the correct
% arguments and calls the SDPT3 solver to obtain the solution.
opts = sdpsettings('solver','sdpt3');
diagnostics = optimize(L,[],opts);
disp(diagnostics.info)
if diagnostics.problem == 0
    disp('Feasible')
elseif diagnostics.problem == 1
    disp('Infeasible')
else
    disp('Something else happened')
end
pause;

% value() converts the solution Pvar into a numeric matrix
P = value(Pvar)
eigP = eig(P)
disp('Eigenvalues are positive so P is ok, so the system is stable.')

pause;
%% How to minimize?
disp('Optimizing over elements of P')
pause;

% Define unknown variables
gamma = sdpvar(1,1); % defines a scalar variable
Pvar = sdpvar(3,3);

L = [A'*Pvar+Pvar*A+ Q <= 0,
    Pvar >= 1e-9,
    gamma*eye(3) >= Pvar, % no eigenvalues of Pvar larger than gamma, next minimze gamma
    %-gamma + 1 >= 0, gamma - 0.01 >= 0 % gamma between 0.1 and 1
    ];

% besides L there is a second argument, which is not an inequality but an
% objective function (or in this case an objective variable). This
% automatically solves the inequalities in L while minimizing the
% objective.
diagnostics = optimize(L,gamma,opts);
disp(diagnostics.info)
if diagnostics.problem == 0
    disp('Feasible')
elseif diagnostics.problem == 1
    disp('Infeasible')
else
    disp('Something else happened')
end
pause;

% solutions are always retrieved using value().
P = value(Pvar)
eigP = eig(P)
opt = value(gamma)