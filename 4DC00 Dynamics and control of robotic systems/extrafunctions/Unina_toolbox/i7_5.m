%I7_5   Variables initialization for Problem 7.5.

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
  K_p = 100*diag([1 1]);
  K_d = 16*diag([1 1]);

% force controller gains
  K_pf = 50*diag([1 1]);
  K_df = 16*diag([1 1]);
  K_f = 0.00025*diag([1 1]);
  K_i = 0.001*diag([1 1]);

% discrete PI
  Tf = K_f/K_i;
  Af = zeros(2,2);
  Bf = eye(2,2);
  Cf = eye(2,2);
  Df = Tf;
  [Adf,Bdf,Cdf,Ddf]=c2dm(Af,Bf,Cf,Df,Tc,'zoh');
  Cdf = K_i*Cdf;
  Ddf = K_i*Ddf;

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

% desired force in constraint frame
  f_d = [0;-50];

% initial position
  p_i = [1+0.2*cos(pi/4); 0];

% final position
  p_f = [1.2+0.2*cos(pi/4);0.2];

% initial arm position
  p_0 = [1 + 0.1*cos(pi/4); 0.1*sin(pi/4)];

% initial arm position in constraint frame
  p_c0 = Rc*[1 + 0.1*cos(pi/4); 0.1*sin(pi/4)];

% initial joint configuration
  q_0 = inv_k2u(a,p_0);

% duration of simulation
  t_d = 2.5;

% trajectory in constraint frame
  tra_7;

% sample time for plots
  Ts = Tc;

global a k_r1 k_r2 pi_m pi_l
