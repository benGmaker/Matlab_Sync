% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2019-2020
% Example 2: Checking stability of a PWL system (no S-procedure used)
% -------------------------------------------------------------------------
close all
clear all
clc 

yalmip clear

% System dynamics:
A1 = [-3 0 -2;
    0 -5 0;
    1 0 -1];
A2 = [-2 0 -3;
    0 -3 0;
    3 0 -2];
A3 = [7 -5 -7;
    -8 -1 12;
    8 -4 -9];

% LMI variables:
Pvar = sdpvar(3,3); % symmetric by default

%% Search for a common quadratic Lyapunov function
% Lyapunov condition:
Lf1 = A1'*Pvar+Pvar*A1<=-1e-9;
Lf2 = A2'*Pvar+Pvar*A2<=-1e-9;
Lf3 = A3'*Pvar+Pvar*A3<=-1e-9;

Lp = Pvar>=1e-9;

% combine constraints into one object
L = [Lf1,Lf2,Lf3,Lp]; 

% solve the LMI using SDPT3:
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

% retrieve the solution:

P = value(Pvar)
eigP = eig(P)
eigLf1 = eig(A1'*P+P*A1)
eigLf2 = eig(A2'*P+P*A2)
disp('The LMI is not feasible  ... - no common quadratic Lyapunov function exists')

% diagnostics contains solver info, but is not always sufficient to
% conclude feasibility of the solution. Use check(L) to inspect residuals
disp('Do not trust only on outcome "solver info", check always the LMI eigenvalues and solver residuals!!')
disp('Use check(L) to look at the primal residuals of inequalities: positive = feasible; some negative = (generally) not feasible')

pause;

check(L)
[pres,~] = check(L);
if all(pres>=0)
    disp('Feasible according to primal residuals.')
else
    disp('Infeasible according to primal residuals.')
end

pause;

% check for stability system 1
diagnostics = optimize([Lf1,Lp],[],opts);
disp(diagnostics.info)
if diagnostics.problem == 0
 disp('Feasible')
elseif diagnostics.problem == 1
 disp('Infeasible')
else
 disp('Something else happened')
end
P=value(Pvar)
eig(P)
disp('P is ok, system 1 stable');

pause;

% check for stability system 2
diagnostics = optimize([Lf2,Lp],[],opts);
disp(diagnostics.info)
if diagnostics.problem == 0
 disp('Feasible')
elseif diagnostics.problem == 1
 disp('Infeasible')
else
 disp('Something else happened')
end
P=value(Pvar)
eig(P)
disp('P is ok, system 2 stable');

pause;
clear all;

%% Search for a Piecewise quadratic one: P1, P2 (no S-procedure used!)
% First define the matrices Ei*x>=0 that define the regions where dynamics
%   A1, A2 are active

% Mode A1 is active in quadrant 1 and 3 defined by E1x>=0 and E3x>=0
A1 = [-0.1 1; -5 -0.1];
A2 = [-0.1 5; -1 -0.1];

E1 = [-1 1; -1 -1]; E3=-E1;

% Mode A2 is active in quadrant 2 and 3 defined by E2x>=0 and E4x>=0

E2 = [-1 1; 1 1]; E4=-E2;

% To ensure continuity we define Pi=Fi'*T*Fi where T is a 4x4 common matrix
%   and Fi is constructed for each quadrant i using the matrix Ei as follows (i=1,2,3,4):

F1 = [eye(2) ;E1]; 
F2 = [eye(2) ;E2];
F3 = [eye(2) ;E3]; 
F4 = [eye(2) ;E4];

% LMI variables: Tvar now stands for T

Tvar = sdpvar(4,4);

% Lyapunov condition:
Pvar1 = F1'*Tvar*F1;
Pvar2 = F2'*Tvar*F2;
Pvar3 = F3'*Tvar*F3;
Pvar4 = F4'*Tvar*F4;

% We only need to check two cases ... why? 
Lf1 = [A1'*Pvar1+Pvar1*A1<=-1e-9];
Lf2 = [A2'*Pvar2+Pvar2*A2<=-1e-9];
Lf3 = [A1'*Pvar3+Pvar3*A1<=-1e-9];
Lf4 = [A2'*Pvar4+Pvar4*A2<=-1e-9];

Lp1 = [Pvar1>=1e-9];
Lp2 = [Pvar2>=1e-9];
Lp3 = [Pvar3>=1e-9];
Lp4 = [Pvar4>=1e-9];

% Gathering all conditions in one
L=[Lf1,Lf2,Lf3,Lf4,Lp1,Lp2,Lp3,Lp4];

% Solve the LMIs using SDPT3:
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

% retrieve the solutions:

T = value(Tvar)
P1 = F1'*T*F1
eigP1 = eig(P1)
P2 = F2'*T*F2
eigP2 = eig(P2)
P3 = F3'*T*F3
eigP3 = eig(P3)
P4 = F4'*T*F4
eigP4 = eig(P4)
disp('The PWL system is asymptotically stable')


