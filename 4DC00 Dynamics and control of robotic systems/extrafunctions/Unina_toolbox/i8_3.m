%I8_3   Variables initialization for Problem 8.3.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

% motor parameters
  I_m = 0.0014;
  F_m = 0.01;
  L_a = 2e-3;
  R_a = 0.2;
  k_t = 0.2;
  k_v = 0.2;
  G_v = 1;
  T_v = 0.1e-3;

% controller parameters
  k_i = 1;
  K_i = 21592;
  T_i = 9/21592;

% integration time
  if c==0,
     Tc = 0.000005;
  else
     Tc = 0.001;
end;

% duration of simulation
  t_d = 1000*Tc;

% sample time for plots
  Ts = Tc;
