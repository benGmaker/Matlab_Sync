%P6_15  Plots of Problem 6.15.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

if c==0,
% tip x-position
  subplot(2,2,1);
  plot(time, p_d(1)*ones(size(time)),'--',time,p(:,1));
  axis([0 t_d 0.35 0.55])
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('x-pos');

% tip y-position
  subplot(2,2,2);
  plot(time, p_d(2)*ones(size(time)),'--',time,p(:,2));
  axis([0 t_d 0.35 0.55])
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('y-pos');

else

% tip x-position
  subplot(2,2,1);
  plot(time, p_d(1)*ones(size(time)),'--',time,p(:,1));
  axis([0 t_d 0.45 0.65])
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('x-pos');

% tip y-position
  subplot(2,2,2);
  plot(time, p_d(2)*ones(size(time)),'--',time,p(:,2));
  axis([0 t_d -0.35 -0.15])
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('y-pos');

end;
