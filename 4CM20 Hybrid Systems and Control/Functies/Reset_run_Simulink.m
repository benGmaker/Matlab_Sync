% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2019-2020
% Reset control simulation example
%
% Bardia Sharif
% Eindhoven May 2020
% -------------------------------------------------------------------------

clear all
close all

% Initial condition
x0    = 0;

% Simulation horizon
% The simulation stops when either T or J has been reached
T = 10; % maximum simulation time interval
J = 20; % maximum number of discrete jumps

% Rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 2;

RelTol = 1e-6;
MaxStep = 0.1;

% Simulate using Hybrid Equations Simulink library
sim Reset_model_Simulink.mdl


% Plot solution over time
figure
plotflows(t,j,x)
hold on
grid on
xlabel('time t')
ylabel('x(t)')



