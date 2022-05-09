%I7_4   Variables initialization for Problem 7.4.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

% load manipulator dynamic parameters without load mass
  param;
  pi_l = pi_m;

% gravity acceleration
  g = 9.81;

% friction matrix
  K_r = diag([k_r1 k_r2]);
  F_v = K_r*diag([0.01 0.01])*K_r;

% sample time of controller
  Tc = 0.001;

% inverse dynamics controller gains
  K_d = 16*diag([1 1]);
  K_p = 100*diag([1 1]);

% impedance controller gains
  K_di = 16*diag([1 1]);
  K_pi = 50*diag([1 1]);
  M_di = 100*diag([1 1]);
  iM_di = inv(M_di);

% constraint frame matrix
  Rc = [cos(pi/4)  sin(pi/4);
       -sin(pi/4)  cos(pi/4)];

% selection matrix
  S = [0 0;
       0 1];

% stiffness matrix in constraint frame
  K = [0 0;0 5e3];

% position of undeformed plane
  p_e = [1;0];

% initial position
  p_i = [1+0.2*cos(pi/4); 0];

% final position
  p_f = [1.2+0.2*cos(pi/4);0.2];

% initial arm position
  p_0 = [1 + 0.1*cos(pi/4); 0.1*sin(pi/4)];

% initial joint configuration
  q_0 = inv_k2u(a,p_0);

% duration of simulation
  t_d = 2.5;

% trajectory in constraint frame
  tra_7;

% sample time for plots
  Ts = Tc;

global a k_r1 k_r2 pi_m pi_l
