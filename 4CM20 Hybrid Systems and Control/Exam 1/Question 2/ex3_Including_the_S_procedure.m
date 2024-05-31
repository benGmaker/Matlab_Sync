% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2019-2020
% Example 3: why is the S-procedure useful
% -------------------------------------------------------------------------
close all
clear all 
clc

yalmip clear

% System dynamics:
A1 = [-1 -100;
    10 -1];
A2 = [1 10;
    -100 1];

%% First: common Lyapunov function
% LMI variables:
Pvar = sdpvar(2,2);

% Lyapunov condition:
Lf1 = A1'*Pvar+Pvar*A1<=-1e-9;
Lf2 = A2'*Pvar+Pvar*A2<=-1e-9;

Lp = Pvar>=1e-9;

L=Lf1+Lf2+Lp;

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

% retrieve the solution:

P = value(Pvar)
disp('The LMI is not feasible ... - no common quadratic Lyapunov function exists')
% diagnostics contains solver info, but is not always sufficient to
% conclude feasibility of the solution. Use check(L) to inspect residuals
disp('Do not trust only on outcome "solver info", check always the LMI eigenvalues and solver residuals!!')
disp('Use check(L) to look at the primal residuals: positive = feasible; some negative = (generally) not feasible')

pause;

check(L)
[pres,~] = check(L);
if all(pres>=0)
    disp('Feasible according to primal residuals.')
else
    disp('Infeasible according to primal residuals.')
end

pause; 

%% Search for a Piecewise quadratic one: P1, P2
clear all;
% First define the matrices Ei*x>=0 that define the regions
% A1 is active in x1*x2<=0 
A1 = [-1 -100;
    10 -1];
A2 = [1 10;
    -100 1];

% regions
E12 = [-8 -1];
E21 = [2 -1];
Q = 0.5 * [E12; E21].'*[0 1; 1 0] * [E12; E21];
E1 = Q;
E2 = Q;


% To ensure continuity define Pi=Fi'*T*Fi
F1=[E1' eye(2)]';
F2=[E2' eye(2)]';


% LMI variables:
Tvar=sdpvar(4,4);

% Lyapunov condition:
Pvar1=F1'*Tvar*F1;
Pvar2=F2'*Tvar*F2;

Lf1=[A1'*Pvar1+Pvar1*A1<=-1e-9];
Lf2=[A2'*Pvar2+Pvar2*A2<=-1e-9];

Lp1=[Pvar1>=1e-9];
Lp2=[Pvar2>=1e-9];

L=Lf1+Lf2+Lp1+Lp2;

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

% retrieve the solutions:

T=value(Tvar)
P1=F1'*T*F1
eig(P1)
P2=F2'*T*F2
eig(P2)

disp('a PWQ function not found!')

pause;
clear all;

%% Search for a Piecewise quadratic one with S-procedure: P1, P2, U1, U2, W1, W2
% First define the matrices Ei*x>=0 that define the regions
A1 = [-1 -100;
    10 -1];
A2 = [1 10;
    -100 1];

% regions
E12 = [-8 -1];
E21 = [2 -1];
Q = 0.5 * [E12; E21].'*[0 1; 1 0] * [E12; E21];
E1 = Q;
E2 = Q;

% To ensure continuity define Pi=Fi'*T*Fi
F1=[E1' eye(2)]';
F2=[E2' eye(2)]';

% LMI variables:
Tvar=sdpvar(4,4);
Uvar1=sdpvar(2,2);
Uvar2=sdpvar(2,2);

Wvar1=sdpvar(2,2);
Wvar2=sdpvar(2,2);

% Lyapunov condition:
Pvar1=F1'*Tvar*F1;
Pvar2=F2'*Tvar*F2;

Lf1=[A1'*Pvar1+Pvar1*A1+E1'*Uvar1*E1<=-1e-9];
Lf2=[A2'*Pvar2+Pvar2*A2+E2'*Uvar2*E2<=-1e-9];

Lp1=[Pvar1-E1'*Wvar1*E1>=1e-9];
Lp2=[Pvar2-E2'*Wvar2*E2>=1e-9];

Lpos=[Uvar1(:)>=0, Uvar2(:)>=0, Wvar1(:)>=0, Wvar2(:)>=0];

L=Lf1+Lf2+Lp1+Lp2+Lpos;

%solve the LMI using SDPT3:
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

%retrieve the solutions:

T=value(Tvar)
P1=F1'*T*F1
eig(P1)
U1=value(Uvar1)
W1=value(Wvar1)
pause;

P2=F2'*T*F2
eig(P2)
U2=value(Uvar2)
W2=value(Wvar2)
pause;

disp('a PWQ function with S-procedure found!') 

