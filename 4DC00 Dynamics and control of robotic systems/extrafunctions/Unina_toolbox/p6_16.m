%P6_16  Plots of Problem 6.16.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

if c==0,
% tip position errors
  subplot(2,2,1);
  plot(time,e(:,1),time,e(:,2),'--');
  axis([0 t_d -6e-3 6e-3]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('tip pos errors');

else

% tip position errors
  subplot(2,2,2);
  plot(time, e(:,1),time,e(:,2),'--');
  axis([0 t_d -4e-4 4e-4]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[m]');
  title('tip pos errors');

end;
