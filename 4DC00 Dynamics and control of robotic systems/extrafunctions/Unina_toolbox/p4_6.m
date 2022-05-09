%P4_6   Plots of Problem 4.6.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

% joint torques
  subplot(2,2,1);
  plot(time, tau_1);
  axis([0 t_d -1e4 1.5e4]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[Nm]');
  title('joint 1 torque');

  subplot(2,2,2);
  plot(time, tau_2);
  axis([0 t_d -1e4 1.5e4]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[Nm]');
  title('joint 2 torque');
