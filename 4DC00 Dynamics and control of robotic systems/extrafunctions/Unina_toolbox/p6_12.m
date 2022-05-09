%P6_12  Plots of Problem 6.12.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

if c==0,
% joint position errors
  subplot(2,2,1);
  plot(time,e(:,1),time,e(:,2),'--');
  axis([0 t_d -0.02 0.02]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad]');
  title('joint pos errors');

else

% joint position errors
  subplot(2,2,2);
  plot(time, e(:,1),time,e(:,2),'--');
  axis([0 t_d -5e-4 5e-4]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  xlabel('[s]');
  ylabel('[rad]');
  title('joint pos errors');

end;
