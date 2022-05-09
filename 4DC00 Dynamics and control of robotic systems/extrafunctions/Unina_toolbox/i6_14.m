%I6_14  Variables initialization for Problem 6.14.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% load manipulator dynamic parameters without load mass
  param;
  load_m;

% gravity acceleration
  g = 9.81;

% friction matrix
  K_r = diag([k_r1 k_r2]);
  F_v = K_r*diag([0.01 0.01])*K_r;

% sample time of controller
  Tc = 0.001;

% controller gains
  Lam = 10*diag([1 1]);
  K_d = 10000*diag([1 1]);
  K_ml = 0.005;

% initial estimate of load mass
  m_l0 = 0;

% duration of simulation
  t_d = 2.5;

% trajectory generation
  tra_6;

% sample time for plots
  Ts = Tc;

global a k_r1 k_r2 pi_m pi_l F_v g
