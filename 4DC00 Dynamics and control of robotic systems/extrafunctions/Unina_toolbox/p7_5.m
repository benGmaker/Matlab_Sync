%P7_5   Plots of Problem 7.5.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

% x_c-position error
  subplot(2,2,1)
  plot(time, e(:,1));
  axis([0 t_d -1e-4 1e-4]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('x_c-pos error');

% y_c-force error
  subplot(2,2,2)
  plot(time, f(:,2));
  axis([0 t_d -300 0]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[N]');
  title('y_c-force');
