% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2020-2021
% GS 1, Exercise 1
%
% This .m file solves the hybrid dynamical system specified in
% Bz1Ex2_fun_Matlab.mat. For more information on solving (non-) linear
% differential equation using matlab type help ode45 in the command window.
%
% Maurice Heemels, Niek Borgers, Bas van Loon
% Eindhoven 12-11-2012
% -------------------------------------------------------------------------

clear all
close all

% Defining initial conditions and timespan for the ODE solver
x0 = [1 1];
TimeSpan = [0 1]; % The timespan should be small, for example [0 1].

% Solving the ode over the specified time domain
options = odeset('RelTol',1e-1,'AbsTol',1e-1);
[T X] = ode45(@PWL_fun_Matlab,TimeSpan,x0,options);

% Plotting the results
figure
plot(T,X(:,1),'r-')
hold on
plot(T,X(:,2),'b--')
grid on
legend('x_1','x_2')
xlabel('time')
ylabel('x_i')

figure
plot(X(:,1),X(:,2),'r-')
grid on
xlabel('x_1')
ylabel('x_2')
