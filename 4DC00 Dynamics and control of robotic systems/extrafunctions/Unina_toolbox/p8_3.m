%P8_3   Plots of Problem 8.3.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

if c==0
% current
  subplot(2,2,1)
  plot(time, curr);
  axis([0 t_d 0 2]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[A]');
  title('current');

else

% velocity
  subplot(2,2,2)
  plot(time, omega);
  axis([0 t_d 0 25]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad/s]');
  title('velocity');

end;
