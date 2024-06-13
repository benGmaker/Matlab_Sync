function [ub, lb, lbf, ubf] = CheckFeasibility(sigma,ub,lb,lbf,ubf,pres,diagnostics)
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
    end
end