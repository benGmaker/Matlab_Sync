%S5_5   Solution to Problem 5.5.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% time instants
  t = [0;1;2;3;4];

% initial position, velocity and acceleration vector
  q_i = [0;0;0];

% final position, velocity and acceleration vector
  q_f = [3;0;0];

% intermediate position
  q_m = 2;

% sample time
  Ts = 0.01;

% trajectory generation
  [time,q,dq,ddq] = spline_c(q_i,q_f,q_m,t,Ts);

% plot
  p5_5;
