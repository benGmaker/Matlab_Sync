%S5_1   Solution to Problem 5.1.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% initial and final time
  t = [0;2];

% initial position, velocity and acceleration vector
  q_i = [1;0;0];

% final position, velocity and acceleration vector
  q_f = [4;0;0];

% evaluates vector pp of coefficients of quintic polinomial
  pp = poly_5(t,q_i,q_f);

% first derivative coefficients
  dpp = polyder(pp);

% second derivative coefficients
  ddpp = polyder(dpp);

% sample time
  Ts = 0.01;

% time base vector
  time = t(1):Ts:t(2);

% position
  q = polyval(pp,time);

% velocity
  dq = polyval(dpp,time);

% acceleration
  ddq = polyval(ddpp,time);

% plot
  p5_1
