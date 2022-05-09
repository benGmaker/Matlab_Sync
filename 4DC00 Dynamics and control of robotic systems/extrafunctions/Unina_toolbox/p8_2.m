%P8_2   Plots of Problem 8.2.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

% current
  subplot(2,2,1)
  plot(time, curr);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[A]');
  title('current');

% velocity
  subplot(2,2,2)
  plot(time, omega);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad/s]');
  title('velocity');
