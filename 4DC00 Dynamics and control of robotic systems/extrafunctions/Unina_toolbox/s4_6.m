%S4_6   Solution to Problem 4.6.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

clear all

% first trajectory
  % trajectory generation
    tra_1;

  % tip forces
    f = [500;500];

  % inverse dynamics
    inv_d;

  % plot
    figure(1)
    p4_6;

  clear

% second trajectory
  % trajectory generation
    tra_2;

  % tip forces
    f = [500;500];

  % inverse dynamics
    inv_d;

  % plot
    figure(2);
    p4_6;

  clear

% third trajectory
  % trajectory generation
    tra_3;

  % tip forces
    f = [500;500];

  % inverse dynamics
    inv_d;

  % plot
    figure(3);
    p4_6;
