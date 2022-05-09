%I6_11  Variables initialization for Problem 6.11.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

% load manipulator dynamic parameters with load mass
  param
  load_m;

% gravity acceleration
  g = 9.81;

% joint actuator parameters
  K_r = diag([k_r1 k_r2]);
  F_v = K_r*diag([0.01 0.01])*K_r;
  R_a = diag([10 10]);
  k_t = diag([2 2]);
  k_v = diag([2 2]);
  G_v =  diag([1 1]);
  k_tp = K_r*diag([1 1]);
  k_tv = K_r*diag([1 1]);
  G_r = K_r*k_t*inv(R_a)*G_v;
  K_pr = R_a*inv(k_t*K_r);
  F_e = K_r*k_t*inv(R_a)*k_v*K_r;
  I1 = (I_l1 + m_l1*l_1^2 + I_m2 + m_m2*a(1)^2)/(k_r1*k_r1) + I_m1;
  I2 = (I_l2 + m_l2*l_2^2 + m_pl*a(2)^2 + I_pl)/(k_r2*k_r2)  + I_m2;
  Im = diag([I1 I2]);
  T_m = R_a*Im*inv(k_t*k_v);

% sample time of controller
  Tc = 0.001;

% controller gains
  if c==0,
     K_v = 10*diag([1 1]);
     K_p = 5*diag([1 1]);
  else
    K_v = 32*diag([1 1]);
    K_p = 6.25*diag([1 1]);
  end;

  k_fp = k_tp;
  k_fv = k_tv;
  k_fa = K_r*k_v*inv(K_v);

% discrete PI
  Ac = zeros(2,2);
  Bc = eye(2,2);
  Cc = eye(2,2);
  Dc = T_m;
  [Ad,Bd,Cd,Dd] =c2dm(Ac,Bc,Cc,Dc,Tc,'zoh');

% duration of simulation
  t_d = 2.5;

% trajectory generation
  tra_6;

% sample time for plots
  Ts = Tc;

global a k_r1 k_r2 pi_m pi_l
