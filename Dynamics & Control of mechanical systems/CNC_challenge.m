% -------------------------------------------------------------------------
% 4DB00 Dynamics and control of mechanical systems 2020-2021
% CNC challenge.
% -------------------------------------------------------------------------
clc;close all;clearvars
addpath Toolbox
addpath Toolbox/Functions

%% Symbols
% Define the degrees of freedom and their first two derivative w.r.t. time
% as symbolic expressions
syms xc dxc ddxc yb dyb ddyb phih dphih ddphih

% Define the system parameters, actuator force and time
% as symbolic expressions
syms g Lf Lb L23 L24 wc hc mf mb mc mh Jh2 kPD dPD dx kphi dphi xref phiref phih3
syms Mphi
syms t

% Place degrees of freedom (and their derivatives) in the generalized
% coordinates and the prescribed displacements.
Components.q        = [xc;phih];
Components.dq       = [dxc;dphih];
Components.ddq      = [ddxc;ddphih];
Components.s_pd     = [yb];
Components.ds_pd    = [dyb];
Components.dds_pd   = [ddyb];
Components.F        = [Mphi];
Components.time     = [t];

% Define system parameters as symbols
Components.parameters.g.symbol  = g;
Components.parameters.Lf.symbol = Lf;
Components.parameters.Lb.symbol = Lb;
Components.parameters.L23.symbol = L23;
Components.parameters.L24.symbol = L24;
Components.parameters.wc.symbol = wc;
Components.parameters.hc.symbol = hc;
Components.parameters.mf.symbol = mf;
Components.parameters.mb.symbol = mb;
Components.parameters.mc.symbol = mc;
Components.parameters.mh.symbol = mh;
Components.parameters.Jh2.symbol = Jh2;
Components.parameters.kPD.symbol = kPD;
Components.parameters.dPD.symbol = dPD;
Components.parameters.dx.symbol = dx;
Components.parameters.kphi.symbol = kphi;
Components.parameters.dphi.symbol = dphi;
Components.parameters.xref.symbol = xref;
Components.parameters.phiref.symbol = phiref;
Components.parameters.phih3.symbol = phih3;

%% ------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------> Please complete the following code for Deliverable 1:
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Insert the system parameter values:
Components.parameters.g.value      = []; %m/(s^2)
Components.parameters.Lf.value     = []; %m
Components.parameters.Lb.value     = []; %m
Components.parameters.L23.value    = []; %m
Components.parameters.L24.value    = []; %m
Components.parameters.wc.value     = []; %m
Components.parameters.hc.value     = []; %m
Components.parameters.mf.value     = []; %kg
Components.parameters.mb.value     = []; %kg
Components.parameters.mc.value     = []; %kg
Components.parameters.mh.value     = []; %kg
Components.parameters.Jh2.value    = []; %kg*m^2
Components.parameters.kPD.value    = []; %N/m
Components.parameters.dPD.value    = []; %N*s/(m)
Components.parameters.dx.value     = []; %N*s/(m)
Components.parameters.kphi.value   = []; %N*m/rad
Components.parameters.dphi.value   = []; %N*m*s/rad
Components.parameters.xref.value   = []; %m
Components.parameters.phiref.value = []; %rad
Components.parameters.phih3.value  = []; %rad


% Insert symbolic expressions for the kinetic and potential energy
% and the generalized forces:
T   = [];   % Kinetic energy
V   = [];   % Potential energy
Qnc = [];   % Generalised forces

% Calculate the non-linear equations of motion (statement is complete):
Nonlinear_EOM = DOMS('NonlinearEOM',Components,T,V,Qnc);

% Insert the settings for the simulation:
t_sim     = [];  % Simulation time
q_init    = [];  % Initial value for q
dq_init   = [];  % Initial value for dq
s_pd_of_t = [];  % Prescribed displacement a function of time t (e.g. sin(t))
M_of_t    = [];  % External force as a function of time t (e.g. cos(t))

% Simulate the non-linear equations of motion (statement is complete):
Sim_Nonlinear = DOMS('Sim_Nonlinear',Components, Nonlinear_EOM,...
    t_sim,q_init,dq_init,s_pd_of_t,M_of_t);

% Simulate the virtual test setup in Simulink (statement is complete):
Sim_Setup  = DOMS('Sim_Setup',Components,t_sim,...
    q_init,dq_init,s_pd_of_t, M_of_t);

%--------------------------------------------------------------------------
%--------> Please generate the plots for questions f and g here:
%--------------------------------------------------------------------------



 return % This statement stops the script here.
% Remove or comment it, if you wish to continue with deliverable 2
%% ------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------> Please complete the following code for Deliverable 2:
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%Insert the linearization points
q_0_stable = [];   %Stable equilibrium for linearization
q_0_given  = [];   %Given equilibrium for linearization

% Linearize the equations of motion (statements are complete):
LinearEOM_stable   = DOMS('Linearize',Components,Nonlinear_EOM,q_0_stable);
LinearEOM_given    = DOMS('Linearize',Components,Nonlinear_EOM,q_0_given);

% Insert the settings for the simulation:
t_sim             = [];   % Simulation time
q1_init_stable    = [];   % Initial value for q1
q1_init_given     = [];   % Initial value for q1
dq1_init_stable   = [];   % Initial value for dq1
dq1_init_given    = [];   % Initial value for dq1
M_of_t           = [];    % External force as a function of time t (e.g. cos(t))


% Simulate the linear equations of motion (statements are complete):
Sim_Linear_stable   = DOMS('Sim_Linear',Components,LinearEOM_stable,...
    t_sim,q1_init_stable,dq1_init_stable, M_of_t);
Sim_Linear_given    = DOMS('Sim_Linear',Components,LinearEOM_given,...
    t_sim,q1_init_given,dq1_init_given, M_of_t);


%--------------------------------------------------------------------------
%--------> Please generate the plots for questions d and e here:
%--------------------------------------------------------------------------


