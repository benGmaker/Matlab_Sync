% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------

    % Initial condition
    x0 = [2; 0];
    
    % Simulation horizon
    % The simulation stops when either T or J has been reached
    T = 10; % maximum simulation time interval
    J = 30; % maximum number of discrete jumps
    
    % Rule for jumps
    % rule = 1 -> priority for jumps
    % rule = 2 -> priority for flows
    rule = 2;
    
    RelTol = 1e-6;
    MaxStep = 0.1;
    
    % Simulate using Hybrid Equations Simulink library
    sim JF_model_Simulink.mdl
    
    
    % Plot solution over time
    figure
    title(name);
    subplot(3,1,1)
    plotflows(t,j,x(:,1))
    grid on
    xlabel('time t')
    ylabel('x_1(t)')
    
    subplot(3,1,2)
    plotflows(t,j,x(:,2))
    grid on
    xlabel('time t')
    ylabel('x_2(t)')
    
    subplot(3,1,3)
    plotflows(t,j,x(:,3))
    grid
    xlabel('time t')
    ylabel('x_3(t)')
