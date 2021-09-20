function main
clear all; home; close all;
t1 = 0; % start time
t2 = 100; % end time
yinit = 1; % initial value of function y(t): y(t=t1)
y0 = 2; % parameter needed in the ODE
options = odeset('RelTol',1e-12,'AbsTol',1e-12); % (don’t change)
[T,Y] = ode15s(@evolution,[t1 t2],yinit,options,y0); % solve ODE
plot(T,Y,'-') % plot solution
end

function dy = evolution(t,y,y0) % define ODE (example)
% example:
% ordinary differential equation (ODE) of the form
% (dy/dt) = -y0 * y^2 with y0 = 2
% for the function y(t)
ysq = y^2;
dy = -y0 * ysq;
end