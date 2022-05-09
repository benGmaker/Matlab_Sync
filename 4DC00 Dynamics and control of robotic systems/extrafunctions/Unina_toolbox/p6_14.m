%P6_14  Plots of Problem 6.14.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

% joint position errors
  subplot(2,2,1)
  plot(time, e(:,1),time,e(:,2),'--');
  axis([0 t_d -2e-3 2e-3]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad]');
  title('joint pos errors');

% load mass estimate
  subplot(2,2,2)
  plot(time, m_l);
  axis([0 t_d 0 20]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[kg]');
  title('load mass estimate');
