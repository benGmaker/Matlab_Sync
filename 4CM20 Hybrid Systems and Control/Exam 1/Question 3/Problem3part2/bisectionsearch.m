function [sigma,P,sigmal] = bisectionsearch(solveFunc,depth,d)
    Pvar = sdpvar(2,2); % symmetric by default
    % Loop parameters
    lb = 1e-2;             % initial value lower search bound
    ub = 10;            % initial value upper search bound
    dsigma = 1e-8;      % maximal difference in sigma search variable
    ii = 100;           % maximal number of iteration steps
    
    % Set initial loop values
    lbf = NaN;      % lower bound feasible? NaN: not determined yet, 0: no, 1: yes
    ubf = NaN;      % upper bound feasible? NaN: not determined yet, 0: no, 1: yes
    
    
    sigmal = [];    % tracking variable 
    
    %% Iteration loop
    
    if lb >= ub     % lower bound is larger than upper bound
        disp('Lower bound larger than upper bound. Change values.')
    elseif lb <=0   % lower bound is negative
        disp('Sigma must be positive. Change lower bound.')
    else
        for i = 1:ii
            % Determine feasibility of upper and lower bound
            if isnan(lbf)
                sigma = lb;      % determine feasibility lower bound
            elseif isnan(ubf)
                sigma = ub;     % determine feasibility upper bound
                
                % Expand range if both values are feasibile or not feasible
            elseif lbf == 0 && ubf == 0  	% both values are not feasible
                sigma = lb/2;                    % try lower value, reducing the lower bound by a factor 2
            elseif lbf == 1 && ubf == 1     % both values are feasible
                sigma = 2*ub;                  % try higher value, by doubling the interval length and keeping the lower bound fixed
                
                % Lower bound is feasible, upper bound is not feasible
            else
                sigma = (ub-lb)/2 + lb;      % bisecting the interval
            end
            
            if depth == 1
                [d,P,sigmal] = bisectionsearch(solveFunc,2,0);
            elseif depth == 2
                [diagnostics,pres] = solveFunc(Pvar,sigma,d);
            else
                display('óeps')
            end
                       
            % Results initial feasibility check
            if sigma == lb
                lbf = min(pres) > 0 && diagnostics.problem == 0;    % lower bound feasible? 0: no, 1: yes
            elseif sigma == ub
                ubf = min(pres) > 0 && diagnostics.problem == 0;    % upper bound feasible? 0: no, 1: yes
                
                % Resuls feasibility check if range is broadened
            elseif sigma > ub
                lb = ub;                % set new lower bound
                ub = sigma;             % set new upper bound
                ubf = min(pres) > 0 && diagnostics.problem == 0;    % determine feasibility upper bound
            elseif sigma < lb
                ub = lb;                % set new upper bound
                lb = sigma;             % set new upper bound
                lbf = min(pres) > 0 && diagnostics.problem == 0;    % determine feasibility lower bound
                
                % Determine feasibility after bisection
            else
                if min(pres) > 0 && diagnostics.problem == 0
                    lb = sigma;     % new lower bound
                else
                    ub = sigma;     % new upper bound
                end
                
                % Check convergence criterion?
                if abs(sigma-sigmal(i-1)) < dsigma
                    break;              % break loop if accurate enough
                end
            end
            
            % Add sigma to history list
            sigmal(i) = sigma;
            
            % Store feasible solution
            if min(pres) > 0 && diagnostics.problem == 0
                feasible.Pvar = Pvar;
                feasible.sigma = sigma;
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
        P    = value(feasible.Pvar)
        sigma = feasible.sigma
    end
end