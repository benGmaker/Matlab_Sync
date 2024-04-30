% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2020-2021
% -------------------------------------------------------------------------

clear all
close all

%% Calculation of Vectorfields in different modes
[xp11,xp12] = meshgrid(0:0.1:0.5,-0.5:.1:0.5);
p11 = -3*xp11 + xp12;
p12 = -5*xp11 + xp12;
%2
[xp21,xp22] = meshgrid(-0.5:0.1:0,-0.5:.1:0.5);
p21 = -3*xp21 - xp22;
p22 = 5*xp21 + xp22;

% Plotting of the vector fields
figure
subplot(2,2,1)
quiver(xp11,xp12,p11,p12,'k-')
grid on
title('Vectorfield mode 1')
xlabel('x_1')
ylabel('x_2')
xlim([0 0.5])
ylim([-0.5 0.5])

subplot(2,2,[2 4])
quiver(xp11,xp12,p11,p12,'k-')
hold on
quiver(xp21,xp22,p21,p22,'r-')
grid on
legend('mode 1','mode 2','location','south')
title('Vectorfield combined')
xlabel('x_1')
ylabel('x_2')

subplot(2,2,3)
quiver(xp21,xp22,p21,p22,'r-')
grid on
title('Vectorfield mode 2')
xlabel('x_1')
ylabel('x_2')
xlim([-0.5 0])
ylim([-0.5 0.5])
