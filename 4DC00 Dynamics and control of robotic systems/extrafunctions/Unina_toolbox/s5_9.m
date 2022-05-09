%S5_9   Solution to Problem 5.9.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% joint limits
  tau_l = 3000;

% trajectory generation
  tra_1;

% tip forces
  f = [0;0];

% inverse dynamics
  inv_d;

% scaling factor
  tau_s1 = tau_1 - grav_1;
  tau_s2 = tau_2 - grav_2;
  c1 = sqrt(max(max(-tau_s1./(3000+grav_1)), max(tau_s1./(3000-grav_1))));
  c2 = sqrt(max(max(-tau_s2./(3000+grav_2)), max(tau_s2./(3000-grav_2))));
  c = max([c1 c2]);

% scaled torques
  time_c = c*time;
  tau_c1 = tau_s1/(c*c) + grav_1;
  tau_c2 = tau_s2/(c*c) + grav_2;

% plot
  p5_9;
