% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Dwell time optimization by bisection
% -------------------------------------------------------------------------

% This file allows the optimization of the dwell time of a given switched
% system. Since the parameter that is to be optimized appears in a non-linear
% manner in the matrix inequality, the problem to be solved is no longer an
% an LMI. Generally, the solvers that were supplied will not allow you to
% solve this problem directly. However using bisection methods and
% iteratively solving the LMI problem for a fixed parameter leads to an
% optimized result where the optimization problem can be formulated as an
% LMI for each iteration.
%
% Code written by: Mark Haring, 2-12-2008
%
% Modifications:
%       v1: David Rijlaarsdam, 03-12-2008
%       v2: David Rijlaarsdam, 30-11-2009
%       v3: Niek Borgers,      09-11-2016
%       v4: Daniel Deenen,     05-12-2017

%% Decalarations
clear all
close all
clc

% System matrices
A = [1 -3;
    1.5 1];
R = [0.4 0.3;
    0 0.6];


% LMI variables:
Pvar = sdpvar(2,2); % symmetric by default

% Parameters
alpha = 0.01;       % \alpha of exercise
beta = 100;         % \beta of exercise
I = eye(2);

% Loop parameters
lb = 1e-2;             % initial value lower search bound
ub = 10;            % initial value upper search bound
dtau = 1e-8;      % maximal difference in sigma between to different iteration steps
ii = 100;           % maximal number of iteration steps

% Set initial loop values
lbf = NaN;      % lower bound feasible? NaN: not determined yet, 0: no, 1: yes
ubf = NaN;      % upper bound feasible? NaN: not determined yet, 0: no, 1: yes


tau = [];    % search variable 

%% Iteration loop

if lb >= ub     % lower bound is larger than upper bound
    disp('Lower bound larger than upper bound. Change values.')
elseif lb <=0   % lower bound is negative
    disp('Sigma must be positive. Change lower bound.')
else
    for i = 1:ii
        % Determine feasibility of upper and lower bound
        if isnan(lbf)
            tau = lb;      % determine feasibility lower bound
        elseif isnan(ubf)
            tau = ub;     % determine feasibility upper bound
            
            % Expand range if both values are feasibile or not feasible
        elseif lbf == 0 && ubf == 0  	% both values are not feasible
            tau = lb/2;                    % try lower value, reducing the lower bound by a factor 2
        elseif lbf == 1 && ubf == 1     % both values are feasible
            tau = 2*ub;                  % try higher value, by doubling the interval length and keeping the lower bound fixed
            
            % Lower bound is feasible, upper bound is not feasible
        else
            tau = (ub-lb)/2 + lb;      % bisecting the interval
        end
        
        % LMIs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %
        %               FORMULATE THE LMI PROBLEM HERE
        %
        % Defining the LMI problem and solve using SeDuMi:
        % Use notation P1var, P2var for the matrices to be solved and L for
        % your final set of constraints to follow the syntax of this file.
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % LMI problem
        %positive definiteness of P
        Lp = Pvar >= 1e-9;
            % We use Pvar>= 1e-9 instead of Pvar>0, as strict inequalities do not make
        %decrease of the Lyapunv function in flow
        Lf = A'*Pvar+Pvar*A1<=-sigma*Pvar;
        Lg = R'*Pvar*R <= e^-d * Pvar;
        
        % combine constraints into one object
        L = [Lf,Lp]
        opts = sdpsettings('solver','sdpt3');
        diagnostics = optimize(L,[],opts); % solve the LMI problem
        
        % Check result
        % pres : Primal constraint residuals
        % dres : Dual constraint residuals
        [pres,~] = check(L);
        
        % Results initial feasibility check
        if sigma == lb
            lbf = min(pres) > 0 && diagnostics.problem == 0;    % lower bound feasible? 0: no, 1: yes
        elseif sigma == ub
            ubf = min(pres) > 0 && diagnostics.problem == 0;    % upper bound feasible? 0: no, 1: yes
            
            % Resuls feasibility check if range is broadened
        elseif sigma > ub
            lb = ub;                % set new lower bound
            ub = tau;             % set new upper bound
            ubf = min(pres) > 0 && diagnostics.problem == 0;    % determine feasibility upper bound
        elseif sigma < lb
            ub = lb;                % set new upper bound
            lb = tau;             % set new upper bound
            lbf = min(pres) > 0 && diagnostics.problem == 0;    % determine feasibility lower bound
            
            % Determine feasibility after bisection
        else
            if min(pres) > 0 && diagnostics.problem == 0
                lb = tau;     % new lower bound
            else
                ub = tau;     % new upper bound
            end
            
            % Check convergence criterion?
            if abs(tau-tau(i-1)) < dtau
                break;              % break loop if accurate enough
            end
        end
        
        % Add sigma to history list
        tau(i) = tau;
        
        % Store feasible solution
        if min(pres) > 0 && diagnostics.problem == 0
            feasible.Pvar = Pvar;
            feasible.tau = tau;
        end
        
    end
    
    % Plot iteration history
    figure(1)
    plot(sigmal,'ro-','LineWidth',2)
    xlabel('iteration step')
    ylabel('\sigma')
    title('Iteration results')
    grid on
    axis tight
    
    % Retrieve output
    P   = value(feasible.Pvar)
    tau = feasible.tau
end


%f1 = eig(P1)
%f2 = eig(P2)
%f3 = eig(P3)

%computing c
%c1 = sqrt(max(f1)/min(f1))
%c2 = sqrt(max(f2)/min(f2))
%c3 = sqrt(max(f3)/min(f3))

%tau = log(max([c1 c2 c3])/(sigma/2))



