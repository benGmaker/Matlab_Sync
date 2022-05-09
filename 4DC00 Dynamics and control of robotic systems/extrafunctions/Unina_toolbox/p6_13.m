%P6_13  Plots of Problem 6.13.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

% joint torques
  subplot(2,2,1)
  plot(time, tau(:,1),time,tau(:,2),'--');
  axis([0 t_d -4000 4000]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[Nm]');
  title('joint torques');

% joint position errors
  subplot(2,2,2)
  plot(time, e(:,1),time, e(:,2),'--');
  axis([0 t_d -1.5e-3 1.5e-3]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad]');
  title('joint pos errors');
