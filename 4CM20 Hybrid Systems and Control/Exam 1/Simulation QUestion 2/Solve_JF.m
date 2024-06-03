% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------

clear all
close all


% Initial condition
x0 = [-1; -4; 1];

% Simulation horizon
% The simulation stops when the end of either TSPAN or JSPAN has been reached
TSPAN = [0 40]; % simulation time interval
JSPAN = [0 30]; % simulation interval for discrete jumps

% Rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

% ode45 solver options
RelTol = 1e-66;    MaxStep = 10;
options = odeset('RelTol',RelTol,'MaxStep',MaxStep);

% Simulate using Hybrid Equations Toolbox
[t,j,x] = HyEQsolver(@JF_f, @JF_g, @JF_C, @JF_D, x0,TSPAN,JSPAN,rule,options);



E12 = [-8 -1];
E21 = [2 -1];
Q = [E12; E21].'*[0 1; 1 0] * [E12; E21];

mapsize = 0.001;

min = round( min(-5,min(min(x))) );
max = round( max(5,max(max(x))) );
%%

mapsize = 0.01;
figure()
hold on
%plotting the invariant map
[X,Y,Qp] = Qfield(Q,min,max,mapsize);
contourf(X,Y,Qp,[0 mapsize])
plot(x(:,1),x(:,2))

%%
x0 = [1; 4; 1];

[t,j,x] = HyEQsolver(@JF_f, @JF_g, @JF_C, @JF_D, x0,TSPAN,JSPAN,rule,options);

plot(x(:,1),x(:,2),'Color',"#7E2F8E")
