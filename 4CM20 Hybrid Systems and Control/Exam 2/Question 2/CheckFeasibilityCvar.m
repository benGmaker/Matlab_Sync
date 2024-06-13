function [ub, lb, lbf, ubf] = CheckFeasibilityCvar(sigma,ub,lb,lbf,ubf,feasible)
    if sigma == lb
            lbf = feasible;    % lower bound feasible? 0: no, 1: yes
        elseif sigma == ub
            ubf = feasible;    % upper bound feasible? 0: no, 1: yes
    
            % Resuls feasibility check if range is broadened
        elseif sigma > ub
            lb = ub;                % set new lower bound
            ub = sigma;             % set new upper bound
            ubf = feasible;    % determine feasibility upper bound
        elseif sigma < lb
            ub = lb;                % set new upper bound
            lb = sigma;             % set new upper bound
            lbf = feasible;    % determine feasibility lower bound
    
            % Determine feasibility after bisection
        else
            if feasible
                lb = sigma;     % new lower bound
            else
                ub = sigma;     % new upper bound
            end
        end
end