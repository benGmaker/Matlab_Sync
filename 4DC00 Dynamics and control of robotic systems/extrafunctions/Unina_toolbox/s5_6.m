%S5_6   Solution to Problem 5.6.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% time instants
  t = [0;2;4];

% via points vector
  q_v = [0 2 3];

% vector of durations of parabolic blends
  D_t = 0.2*ones(size(t));

% initial and final velocities
  dq_i = 0;
  dq_f = 0;

% sample time
  Ts = 0.01;

% trajectory generation
  [time,q,dq,ddq] = lin_par(t,q_v,D_t,dq_i,dq_f,Ts);

% plot
  p5_6;
