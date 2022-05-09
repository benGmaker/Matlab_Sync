%P5_9   Plots of Problem 5.9.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

hold off
clg

  n = size(time_c,2);
  t_c = time_c(n);
  m = size(time,2);
  time_a = t_f:Ts:t_c;
  tau_a1 = tau_1(m)*ones(size(time_a));
  tau_a2 = tau_2(m)*ones(size(time_a));

% torques
  subplot(2,2,1)
  plot(time,tau_1,time_a,tau_a1);
  axis([0 t_c -6100 6100]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  title('joint 1 torque');
  xlabel('[s]');
  ylabel('[Nm]');

  subplot(2,2,2)
  plot(time,tau_2,time_a,tau_a2);
  axis([0 t_c -6100 6100]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  title('joint 2 torque');
  xlabel('[s]');
  ylabel('[Nm]');

% scaled torques
  subplot(2,2,3)
  plot(time_c,tau_c1);
  axis([0 t_c -3000 3000]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  title('joint 1 scaled torque');
  xlabel('[s]');
  ylabel('[Nm]');

  subplot(2,2,4)
  plot(time_c,tau_c2);
  axis([0 t_c -3000 3000]);
%  set(gca,'fontname','Times','fontsize',12,'fontweight','normal');
  title('joint 2 scaled torque');
  xlabel('[s]');
  ylabel('[Nm]');
