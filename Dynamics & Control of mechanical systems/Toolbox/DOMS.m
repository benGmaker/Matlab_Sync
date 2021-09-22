function [Result] = DOMS(request,varargin)
% -------------------------------------------------------------------------
% 4DB00 Dynamics and control of mechanical systems
% Toolbox Dynamics of Mechanical Systems.
%
% DOMS(request,varargin) accepts a request and a variable amount of inputs.
% Dependent on the request, a function inside the toolbox is called and the
% variable amount of inputs is provided to this function.
%
% The following requests can be done:
% (note: request has the type string)
%
% 'NonlinearEOM':   Computes nonlinear equations of motion of the form:
%                   Equation = dT/dq - T,q + V,q - Qnc.' (= 0)
%                   varargin(4):
%                       Components      (struct with system components)
%                       T               (Kinetic energy; symbolic expression)
%                       V               (Potential energy; symbolic expression)
%                       Qnc             (Generalised forces; column with symbolic expressions)
%
% 'Sim_Nonlinear':  Simulate response of nonlinear dynamics based on
%                              dT/dq - T,q + V,q - Qnc.' = 0
%                   varargin(7):
%                       Components      (struct with system components)
%                       NonlinearEOM    (struct with nonlinear equations)
%                       t_sim           (desired simulation time [s])
%                       q_init          (initial position; column)
%                       dq_init         (initial velocity; column)
%                       s_pd_of_t       (prescribed displacement; column with symbolic expressions)
%                       FA_of_t         (externally applied force; column with symbolic expressions)
%
% 'Sim_Setup':   Measure response using a Simulink model
%                   varargin(5): Unorced response
%                       Components      (struct with system components)
%                       t_sim           (desired simulation time [s])
%                       q_init          (initial position; column)
%                       dq_init         (initial velocity; column)
%                       s_pd_of_t       (prescribed displacement; column with symbolic expressions)
%                   varargin(6): Forced response
%                       FA_of_t         (externally applied force; column with symbolic expressions)
%
% 'Linearize':      Linearize the provided equations of motion based on
%                                   M*q1ddot + D*q1dot + (K+KQ)*q1 = Q*F(t)
%                   varargin(3), excluding s_pd_of_t and FA_of_t:
%                       Components      (struct with system components)
%                       NonlinearEOM    (struct with nonlinear equations)
%                       eq_point        (equilibrium point for linearization; column)
%                   varargin(5), including s_pd and FA:
%                       s_pd            (prescribed displacement; column)
%                       FA_of_t         (externally applied force; column)
%
% 'Sim_Linear':     Simulate (forced) response of linearized dynamics
%                   varargin(6):
%                       Components      (struct with system components)
%                       LinearEOM       (struct with linear equations)
%                       t_sim           (desired simulation time [s])
%                       q1_init          (initial position; column)
%                       dq1_init         (initial velocity; column)
%                       FA_of_t         (externally applied force; column with symbolic expressions)
%
% 'Make_tf':        Create a transfer function based on
%                              TF = q(s)/F(s) = inv(M*s^2 + D*s + K + KQ)*Q
%                   varargin(1):
%                       LinearEOM       (struct with matrices defining ODE)
%
% 'Sim_Control':    Simulate feedback control loop using Simscape model
%                   varargin(8), no external force
%                       Components      (struct with system components)
%                       t_sim           (desired simulation time [s])
%                       q_init          (initial position; column)
%                       dq_init         (initial velocity; column)
%                       s_pd_of_t       (prescribed displacement; column with symbolic expressions)
%                       Controller      (designed controller; transfer function)
%                       Reference       (define type of reference signal, string)
%                        - 'Explicit'   (r_of_t must be specified as a sym)
%                        - 'Const_vel'  (array containing [x0, xf, t0, tf])
%                        - 'Step'       (array containing [x0, xf, t0])
%                       ref_parameters  (see Reference parameters above)
%                   varargin(9), external force
%                       FA_of_t         (externally applied force; column)
%
%
% -------------------------------------------------------------------------
if strcmp(request,'NonlinearEOM')
    Result = NonlinearEOM(varargin);
elseif strcmp(request,'Sim_Nonlinear')
    Result = SimNonlinear(varargin);
elseif strcmp(request,'Sim_Setup')
    Result = SimSetup(varargin);
elseif strcmp(request,'Linearize')
    Result = Linearize(varargin);
elseif strcmp(request,'Sim_Linear')
    Result = SimLinear(varargin);
elseif strcmp(request,'Make_tf')
    Result = LinEOMtoTF(varargin);
elseif strcmp(request,'Sim_FRF')
    Result = SimFRF(varargin);
elseif strcmp(request,'Sim_Control')
    Result = SimControl(varargin);
else
    error(strcat('The request "',request,'" is not recognized. Note that the request is case-sensitive.'));
end
end

%-------------------------------------------------------------------------
% Do not edit the code above this line when implementing a new system.
% -------------------------------------------------------------------------
%% Adaptation checklist
% - The function sims_par
%
% (- For the FRF: Measurement specific simscape paramters for the input noise.)
% (- For the FRF: Expression of the transfer function to be estimated.)
%

%% Simscape parameters
function [sims_par] = simscape_pars(sims_par,Components,q_init,dq_init)
%Extract parameters
parameters = fields(Components.parameters);
for i = 1:length(parameters)
    values(i) = eval(sprintf('Components.parameters.%s.value',parameters{i}));
end

% Simulink file
sims_par.simulink = 'CNC_Simulink';

% depths
sims_par.depth = 0.05;

% external factors
sims_par.g = values(1);

% dimensions frame, beam, hoist block and chain
sims_par.Lfloor = values(2);                                        % width of floor
sims_par.Lf = values(2);                                            % length of frame
sims_par.Lb = values(3);                                            % length of horizontal beam
sims_par.L23 = values(4);                                           % length of center of mass milling head to rotation point
sims_par.L24 = values(5);                                           % length of end effector to rotation point
sims_par.wc = values(6);                                            % width of carriage
sims_par.hc = values(7);                                            % height of carriage
sims_par.mf = values(8);                                            % mass of frame
sims_par.mb = values(9);                                            % mass of horizontal beam
sims_par.mc = values(10);                                           % mass of carriage
sims_par.mh = values(11);                                           % mass of milling head
sims_par.Jh2 = values(12);                                          % inertia of milling head with respect to rotation point

% linear spring/damper characteristics
sims_par.kPD = values(13);                                          % stiffness PD controller on x
sims_par.dPD = values(14);                                          % damping PD controller on x
sims_par.dx = values(15);                                           % friction constant on x
sims_par.kphi = values(16);                                         % stiffness rotational spring
sims_par.dphi = values(17);                                         % damping rotational damper
sims_par.xref = values(18);                                         % equilibrium position spring on x
sims_par.phiref = values(19);                                       % equilibrium position rotational spring
sims_par.phih3 = values(20);                                        % phi offset, angle between center of mass and end effector

% initial conditions
sims_par.x_init    = q_init(1,1);
sims_par.dx_init   = dq_init(1,1);
sims_par.phi_init  = q_init(2,1);
sims_par.dphi_init = dq_init(2,1);

% Simulation parameters initialization
sims_par.C = 0;                                                         % controller
sims_par.dist_var = 0;                                                  % disturbance varianc(FRF)
sims_par.sample_rate = 1000;                                            % sample rate
sims_par.A_exc = 0;
sims_par.f_exc = 0;
sims_par.A_trian = 0;
sims_par.P_trian = 1;
sims_par.x0 = 0;
sims_par.xf = 0;
sims_par.t0 = 0;
sims_par.tf = 0;
sims_par.ramp_slope = 0;
sims_par.ref_nr = 0;

end


%-------------------------------------------------------------------------
% Do not edit the code below this line when implementing a new system.
% -------------------------------------------------------------------------

%% NonlinearEOM
function [NonlinearEOM] = NonlinearEOM(varargin)

% inputs
Components = varargin{1,1}{1,1};
Components.T = varargin{1,1}{1,2};
Components.V = varargin{1,1}{1,3};
Components.Qnc = varargin{1,1}{1,4};
n = size(Components.q,1);

% input checks
if size(Components.T,1) ~= 1 || size(Components.T,2) ~= 1
    error('Error using DOMS(). T must be a 1x1 sym.')
end
if size(Components.V,1) ~= 1 || size(Components.V,2) ~= 1
    error('Error using DOMS(). V must be a 1x1 sym.')
end
if size(Components.Qnc,2) ~= 1 || size(Components.Qnc,1)~= n
    error('Error using DOMS(). Qnc must be a %dx1 sym.',n)
end

% derivation of components for EOM
dt = [Components.q;Components.dq;Components.s_pd;Components.ds_pd];         % d/dt
ddt = [Components.dq;Components.ddq;Components.ds_pd;Components.dds_pd];    % d^2/dt^2

NonlinearEOM.Tq = jacobian(Components.T,Components.q).';                % dT/dq
Tdq = jacobian(Components.T,Components.dq).';                           % dT/ddq
NonlinearEOM.dTdq = jacobian(Tdq,dt)*ddt;                               % d/dt(dT/ddq)
NonlinearEOM.Vq = jacobian(Components.V,Components.q).';                % dV/dq
NonlinearEOM.Qnc = Components.Qnc;                                      % Qnc
NonlinearEOM.Equation = NonlinearEOM.dTdq-NonlinearEOM.Tq + NonlinearEOM.Vq-NonlinearEOM.Qnc; % EOM
end

%% Sim_Nonlinear
function [Nonlinear] = SimNonlinear(varargin)
% inputs
Components = varargin{1,1}{1,1};
NonlinearEOM = varargin{1,1}{1,2};
t_sim = varargin{1,1}{1,3};
q_init = varargin{1,1}{1,4};
dq_init = varargin{1,1}{1,5};
s_pd_of_t = varargin{1,1}{1,6};
FA_of_t = varargin{1,1}{1,7};
n = size(Components.q,1);

% input checks
if size(t_sim,1) ~= 1 ||size(t_sim,2) ~= 1
    error('Error using DOMS(). t_sim must be a 1x1 double.')
end
if size(q_init,2) ~= 1 ||size(q_init,1) ~= n
    error('Error using DOMS(). q_init must be a %dx1 double.',n)
end
if size(dq_init,2) ~= 1 || size(dq_init,1) ~= n
    error('Error using DOMS(). dq_init must be a %dx1 double.',n)
end
if size(s_pd_of_t,2) ~= 1 || size(s_pd_of_t,1) ~= size(Components.s_pd,1)
    error('Error using DOMS(). s_pd_of_t must be a %dx1 sym.',n)
end
if size(FA_of_t,2) ~= 1 || size(FA_of_t,1) ~= size(Components.F,1)
    error('Error using DOMS(). FA_of_t must be a %dx1 sym.',n)
end

% derivation ddq; (M ddq + H = 0)
M = jacobian(NonlinearEOM.Equation,Components.ddq);               % symbolic M
H = NonlinearEOM.Equation - M*Components.ddq;                     % symbolic H

%Substitute parameters
parameters = fields(Components.parameters);
for i = 1:length(parameters)
    M = subs(M,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
    H = subs(H,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
end

ddq = -inv(M)*H;
X0 = double([q_init;dq_init]);

%Substitute the force and prescribed displacement signals of time
ds = diff(s_pd_of_t,Components.time);
dds = diff(ds,Components.time);
ddq = subs(ddq,[Components.s_pd;Components.ds_pd;Components.dds_pd;Components.F],[s_pd_of_t;ds;dds;FA_of_t]);

% Transform the symbolic expression into a function to reduce
% computational time
fcn_handle = matlabFunction(ddq);
fcn_t = functions(fcn_handle);
express = fcn_t.function;

[args_t,express] = strtok(express,'()');
[args_t,express] = strtok(express,'()');

segments= [];
while (args_t ~= "")
    [token,args_t] = strtok(args_t, ',');
    segments = [segments; string(token)];
end

arg_list = string([Components.q(1), Components.q(2), Components.dq(1), Components.dq(2),"t"]);                % adapt to system parameters

for i = 1:length(arg_list)
    arg_order(find(startsWith(segments,arg_list(i)))) = i;
end

expression_f = '';
for i = 1:length(arg_order)
    expression_f = [expression_f, sprintf(',y(%d)',arg_order(i))];
end
expression_f = expression_f(2:end);

%Simulate the model
[Nonlinear.t,X]    = ode45(@(t,X) ODENonlin(t,X,fcn_handle,expression_f),[0 t_sim],X0);
Nonlinear.qt       = X(:,1:n);                                             % positions
Nonlinear.dqt      = X(:,n+1:end);                                         % velocities
end

function Xdot = ODENonlin(t,X,SS,exp_f)
y = [X;t];
n = length(X)/2;
eval(sprintf('Xdot = [X(n+1:2*n); SS(%s)];',exp_f))
end

%% Sim_Setup
function [Setup] = SimSetup(varargin)
% inputs forced response
Components = varargin{1,1}{1,1};
sims_par.Tsim = varargin{1,1}{1,2};
q_init = varargin{1,1}{1,3};
dq_init = varargin{1,1}{1,4};
sims_par = simscape_pars(sims_par,Components,q_init,dq_init);
s_pd_of_t = varargin{1,1}{1,5};
if size(varargin{1,1},2) > 5
    M_of_t = varargin{1,1}{1,6};
else
    M_of_t = 0;
end

ds_pd_of_t = diff(s_pd_of_t);
dds_pd_of_t = diff(ds_pd_of_t);
if isempty(ds_pd_of_t)
    ds_pd_of_t = 0;
    dds_pd_of_t = 0;
end
r_of_t = 0;
n = size(Components.q,1);

% input checks
if size(sims_par.Tsim,1) ~= 1 ||size(sims_par.Tsim,2) ~= 1
    error('Error using DOMS(). t_sim must be a 1x1 double.')
end
if size(q_init,1) ~= n ||size(q_init,2) ~= 1
    error('Error using DOMS(). q_init must be a %dx1 double.',n)
end
if size(dq_init,1) ~= n ||size(dq_init,2) ~= 1
    error('Error using DOMS(). dq_init must be a %dx1 double.',n)
end
if size(s_pd_of_t,1) ~= 1 || size(s_pd_of_t,2) ~= 1
    error('Error using DOMS(). s_pd_of_t must be a 1x1 double.')
end


% general parameters for simscape model
syms t u

s_pd_text = char(subs(sym(s_pd_of_t),t, u));
ds_pd_text = char(subs(sym(ds_pd_of_t),t, u));
dds_pd_text = char(subs(sym(dds_pd_of_t),t, u));
M_text = char(subs(sym(M_of_t),t, u));
r_text = char(subs(sym(r_of_t),t, u));

set_param('CNC_Simulink/Subsystem/Reference  generator/Fcn', 'Expression', r_text)
set_param('CNC_Simulink/Subsystem/s', 'Expression', s_pd_text)
set_param('CNC_Simulink/Subsystem/ds', 'Expression', ds_pd_text)
set_param('CNC_Simulink/Subsystem/dds', 'Expression', dds_pd_text)
set_param('CNC_Simulink/Subsystem/Force', 'Expression', M_text)

% run simulink model
assignin('base','sims_par',sims_par)
simlog = [];
simout = [];
tout = [];
sim(sims_par.simulink);
Setup.t = simout(:,9);                                            % time
Setup.qt = simout(:,5:4+n);                                       % position
Setup.dqt = simout(:,5+n:4+2*n);                                  % velocity
end

%% Linearize
function [LinearEOM] = Linearize(varargin)
% inputs
Components = varargin{1,1}{1,1};
NonlinearEOM = varargin{1,1}{1,2};
eq_pos = varargin{1,1}{1,3};
if size(varargin{1,1},2)==5                                             % including prescribed displacements in linearization
    s_pd_of_t = varargin{1,1}{1,4};
    FA_of_t = varargin{1,1}{1,5};
else                                                                    % making the assumption that s(t) and F(t) are zero
    s_pd_of_t = 0;
    FA_of_t = 0;
end
q_array = Components.q;
dq_array = Components.dq;
ddq_array = Components.ddq;
F_array = Components.F;
n = size(Components.q,1);                                               % determining size of system

% input checks
if size(eq_pos,2) ~= 1 || size(eq_pos,1) ~= n
    error('Error using DOMS(). eq_point must be a %dx1 double.',n)
end

% using M*qddot + D*qdot + (K+KQ)*q = Q*F(t) each of the matrices M, D, K,
% KQ are calculated, before being substituted

% mass matrix
Temp = subs(NonlinearEOM.dTdq-NonlinearEOM.Tq,q_array,eq_pos);
Temp = subs(Temp,dq_array,zeros(n,1));
LinearEOM.Msym = jacobian(Temp,ddq_array);
% stiffness matrix
Temp = jacobian(NonlinearEOM.Vq,q_array);
Temp = subs(Temp,dq_array,zeros(n,1));
LinearEOM.Ksym = simplify(subs(Temp,q_array,eq_pos));
% time dependent contribution Qnc
Temp = jacobian(NonlinearEOM.Qnc,F_array);
Temp = subs(Temp,q_array,eq_pos);
LinearEOM.Qsym = subs(Temp,dq_array,zeros(n,1));
% stiffness contribution Qnc
Temp = jacobian(NonlinearEOM.Qnc,q_array);
Temp = subs(Temp,q_array,eq_pos);
LinearEOM.KQsym = -subs(Temp,dq_array,zeros(n,1));
% damping matrix
Temp = jacobian(NonlinearEOM.Qnc,dq_array);
Temp = subs(Temp,q_array,eq_pos);
LinearEOM.Dsym = -subs(Temp,dq_array,zeros(n,1));

% initialise numerical matrices
LinearEOM.M = LinearEOM.Msym;
LinearEOM.D = LinearEOM.Dsym;
LinearEOM.K = LinearEOM.Ksym;
LinearEOM.KQ = LinearEOM.KQsym;
LinearEOM.Q = LinearEOM.Qsym;
% subsitute parameters into dynamics
parameters = fields(Components.parameters);
for i = 1:length(parameters)
    LinearEOM.M = subs(LinearEOM.M,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
    LinearEOM.D = subs(LinearEOM.D,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
    LinearEOM.K = subs(LinearEOM.K,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
    LinearEOM.KQ = subs(LinearEOM.KQ,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
    LinearEOM.Q = subs(LinearEOM.Q,eval(sprintf('Components.parameters.%s.symbol',parameters{i})),eval(sprintf('Components.parameters.%s.value',parameters{i})));
end
% substitute time dependent variables
LinearEOM.M = double(subs(LinearEOM.M,[Components.s_pd Components.F],[s_pd_of_t FA_of_t]));
LinearEOM.D = double(subs(LinearEOM.D,[Components.s_pd Components.F],[s_pd_of_t FA_of_t]));
LinearEOM.K = double(subs(LinearEOM.K,[Components.s_pd Components.F],[s_pd_of_t FA_of_t]));
LinearEOM.KQ = double(subs(LinearEOM.KQ,[Components.s_pd Components.F],[s_pd_of_t FA_of_t]));
LinearEOM.Q = double(subs(LinearEOM.Q,[Components.s_pd Components.F],[s_pd_of_t FA_of_t]));
end


%% SimLinear
function [Linear] = SimLinear(varargin)
% assigning inputs
Components = varargin{1,1}{1,1};
LinearEOM = varargin{1,1}{1,2};
t = varargin{1,1}{1,3};
q_init = varargin{1,1}{1,4};
dq_init = varargin{1,1}{1,5};
FA_of_t = varargin{1,1}{1,6};
n = size(Components.q,1);                                               % detemrining size of system

% input checks
if size(t,1) ~= 1 ||size(t,2) ~= 1
    error('Error using DOMS(). t_sim must be a 1x1 double.')
end
if size(FA_of_t,1) ~= 1 ||size(FA_of_t,2) ~= 1
    error('Error using DOMS(). FA_of_t must be a 1x1 double or sym.')
end
if  size(q_init,1) ~= n || size(q_init,2) ~= 1
    error('Error using DOMS(). q_init must be a %dx1 double.',n)
end
if size(dq_init,1) ~= n || size(dq_init,2) ~= 1
    error('Error using DOMS(). dq_init must be a %dx1 double.',n)
end

Tsim = linspace(0,t,1000*t);                                             % time vector; specify sample amount
syms t;
FA_fcn = matlabFunction(FA_of_t-1e-20*t);

% derivation ddq: M ddq+ D dq + Kq = Q*F(t)
invM = inv(LinearEOM.M);
ddq = [-invM*(LinearEOM.K+LinearEOM.KQ) -invM*LinearEOM.D];
SS.A = [zeros(n) eye(n);ddq];                                           % state space description system matrix A
SS.B = [zeros(n,1);invM*LinearEOM.Q];                                   % state space input B*u
X0 = double([q_init;dq_init]);                                          % initial conditions
[Linear.t,X] = ode45(@(t,X) ODELin(t,FA_fcn,X,SS),Tsim,X0);             % solve differential equations
Linear.q1t = X(:,1:n);                                                   % extract positions w.r.t. equilibrium
Linear.dq1t = X(:,n+1:end);                                              % extract velocities
end

function Xdot = ODELin(t,FA_fcn,X,SS)
Xdot = SS.A*X+SS.B*FA_fcn(t);
end

%% LinEOMtoTF
% needs to be adapted for a new system
function [TF] = LinEOMtoTF(varargin)
LinearEOM = varargin{1,1}{1,1};
s = tf('s');
TF = (LinearEOM.M*s^2+LinearEOM.D*s+LinearEOM.K+LinearEOM.KQ)\LinearEOM.Q;
end

%% SimFRF
function FRF = SimFRF(varargin)
% input
Components = varargin{1,1}{1,1};
sims_par.Tsim = varargin{1,1}{1,2};
q_init = varargin{1,1}{1,3};
dq_init = varargin{1,1}{1,4};
omega = varargin{1,1}{1,5};

% input checks
if size(sims_par.Tsim,1) ~= 1 ||size(sims_par.Tsim,2) ~= 1
    error('Error using DOMS(). t_sim must be a 1x1 double.')
end
if size(q_init,1) ~= 2 ||size(q_init,2) ~= 1
    error('Error using DOMS(). q_init must be a %dx1 double.',n)
end
if size(dq_init,1) ~= 2 ||size(dq_init,2) ~= 1
    error('Error using DOMS(). dq_init must be a %dx1 double.',n)
end
if size(omega,1) ~= 1
    error('Error using DOMS(). omega must be a 1xm double.')
end

% measurement specific simscape parameters
sims_par.C              = 0;                                            % controller
sims_par.dist_var       = 1000;                                         % white noise distribution
sims_par.sample_rate    = 1000;                                          % Simscape model sample rate

% general simscape parameters
sims_par = simscape_pars(sims_par,Components.pars,q_init,dq_init);
assignin('base','sims_par',sims_par)
simlog = [];
simout = [];
tout = [];
sim(sims_par.simulink);

% deriving the FRF from open loop FRF measurement
Fs = sims_par.sample_rate;                                              % sample rate
f = omega/2/pi;                                                         % frequency vector in [Hz]
nfft = length(simout(:,3))/4;                                           % window size
noverlap = 0.5*nfft;                                                    % amount of overlap between windows
F = simout(:,4);                                                        % input signal
x1 = simout(:,5);                                                       % signal required to construct output
phi2 = simout(:,6);                                                     % signal required to construct output
G_frf = x1 + Components.l2*(phi2-pi/2);                                 % transfer function of crane system
[FRF] = tfestimate(F,G_frf,hann(nfft),noverlap,f,Fs);                   % FRF estimation with overlapping von hann windows
end

%% Sim_Control
function [Measurement] = SimControl(varargin)
% inputs
Components = varargin{1,1}{1,1};
n = size(Components.q,1);
sims_par.Tsim = varargin{1,1}{1,2};
q_init = varargin{1,1}{1,3};
dq_init = varargin{1,1}{1,4};
sims_par = simscape_pars(sims_par,Components,q_init,dq_init);
s_pd_of_t = varargin{1,1}{1,5};
ds_pd_of_t = diff(s_pd_of_t);
dds_pd_of_t = diff(ds_pd_of_t);
if isempty(ds_pd_of_t)
    ds_pd_of_t = 0;
    dds_pd_of_t = 0;
end
sims_par.C = varargin{1,1}{1,6};
ref_request = varargin{1,1}{1,7};
ref_pars = varargin{1,1}{1,8};
if size(varargin{1,1},2) > 8
    M_of_t = varargin{1,1}{1,9};
else
    M_of_t = 0;
end

r_of_t = 0;

if strcmp(ref_request,'Explicit')
    syms t;
    r_of_t = ref_pars;
    if length(r_of_t) ~= 1
        error('Error using DOMS(). r_of_t must be a 1x1 double or sym for a reference of type "Explicit".')
    end
    sims_par.ref_nr = 1;
elseif strcmp(ref_request,'Const_vel')
    if length(ref_pars) ~= 4
        error('Error using DOMS(). ref_pars must be a 1x4 or 4x1 double for a reference of type "Const_vel".')
    end
    sims_par.x0 = ref_pars(1);
    sims_par.xf = ref_pars(2);
    sims_par.t0 = ref_pars(3);
    sims_par.tf = ref_pars(4);
    sims_par.ramp_slope = (sims_par.xf-sims_par.x0)/(sims_par.tf-sims_par.t0);
    sims_par.ref_nr = 2;
elseif strcmp(ref_request,'Step')
    if length(ref_pars) ~= 3
        error('Error using DOMS(). ref_pars must be a 1x3 or 3x1 double.')
    end
    sims_par.x0 = ref_pars(1);
    sims_par.xf = ref_pars(2);
    sims_par.t0 = ref_pars(3);
    sims_par.ref_nr = 3;
else
    error(strcat('The reference request "',ref_request,'" is not recognized. Note that it is case-sensitive.'));
end

% input checks
if size(sims_par.Tsim,1) ~= 1 ||size(sims_par.Tsim,2) ~= 1
    error('Error using DOMS(). t_sim must be a 1x1 double.')
end
if length(sims_par.C) ~= 1
    error('Error using DOMS(). Controller must be a 1x1 tf.')
end
if length(s_pd_of_t) ~= 1
    error('Error using DOMS(). s_pd_of_t must be a 1x1 sym.')
end
if size(q_init,1) ~= 2 ||size(q_init,2) ~= 1
    error('Error using DOMS(). q_init must be a %dx1 double.',n)
end
if size(dq_init,1) ~= 2 ||size(dq_init,2) ~= 1
    error('Error using DOMS(). dq_init must be a %dx1 double.',n)
end


% measurement specific parameters for simscape model
sims_par.dist_var = 0;                                                   % disturbance variance (FRF)
sims_par.sample_rate = 1000;                                             % sample rate

% general parameters for simscape model
syms t u

s_pd_text = char(subs(sym(s_pd_of_t),t, u));
ds_pd_text = char(subs(sym(ds_pd_of_t),t, u));
dds_pd_text = char(subs(sym(dds_pd_of_t),t, u));
M_text = char(subs(sym(M_of_t),t, u));
r_text = char(subs(sym(r_of_t),t, u));

set_param('CNC_Simulink/Subsystem/Reference  generator/Fcn', 'Expression', r_text)
set_param('CNC_Simulink/Subsystem/s', 'Expression', s_pd_text)
set_param('CNC_Simulink/Subsystem/ds', 'Expression', ds_pd_text)
set_param('CNC_Simulink/Subsystem/dds', 'Expression', dds_pd_text)
set_param('CNC_Simulink/Subsystem/Force', 'Expression', M_text)

% run simulink model
assignin('base','sims_par',sims_par)
simlog  = [];
simout  = [];
tout    = [];
sim(sims_par.simulink);
Measurement.rt  = simout(:,1);                                          % reference
Measurement.et  = simout(:,2);                                          % error
Measurement.dt  = simout(:,3);                                          % input disturbance
Measurement.FA  = simout(:,4);                                          % externally applied force
Measurement.qt  = simout(:,5:5+n-1);                                    % position
Measurement.dqt = simout(:,5+n:5+2*n-1);                                % velocity
Measurement.t   = simout(:,5+2*n);                                      % time
end


%% Archive

% 'Sim_FRF':     	Perform FRF measurement on the Simscape model
%                   varargin(5):
%                       Components      (struct with system components)
%                       t_sim           (desired simulation time [s])
%                       q_init          (initial position; column)
%                       dq_init         (initial velocity; column)
%                       omega           (frequency vector rad/s; column)
