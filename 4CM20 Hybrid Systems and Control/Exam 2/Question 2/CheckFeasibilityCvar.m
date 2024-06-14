function [ub, lb, lbf, ubf,dwelltime_cond] = CheckFeasibilityCvar(sigma,ub,lb,lbf,ubf,dwelltime)
    L = length(dwelltime); 
    dwelltime_cond = 0;
    if L == 1
        %only one simulation has been done meaning we can't compare
        %dwelltimes
        lbf = 0;
        return
    end
    
    if ub < 0 
        %cvar is negative, we are searching for maximal dwell time
        dwelltime_cond = dwelltime(L) > dwelltime(L-1); 
    else
        %cvar is positive, we are searching for minimal dwell time
        dwelltime_cond = dwelltime(L) < dwelltime(L-1); 
    end


    if L == 2 %second simulation run check
        %two simulations have been done and we have dwelltime for the
        %lowerboud (i = 1) and upper bound (i = 2) 
        if dwelltime_cond
            ubf = 0;
            lbf = 1; % lower bound lower? 0: no, 1: yes
        else
            ubf = 1; % upper bound lower? 0: no, 1: yes
            lbf = 0;
        end
    elseif sigma == lb
        if dwelltime_cond %feasible if dwelltime has decreased
            lbf = 1; % lower bound feasible? 0: no, 1: yes
        else
            lbf = 0;
        end
    elseif sigma == ub
        if dwelltime_cond %feasible if dwelltime has decreased
            ubf = 1; % lower bound feasible? 0: no, 1: yes
        else
            ubf = 0;
        end

        % Resuls feasibility check if range is broadened
    elseif sigma > ub
        lb = ub;                % set new lower bound
        ub = sigma;             % set new upper bound
        if dwelltime_cond %feasible if dwelltime has decreased
            lbf = 1; % lower bound feasible? 0: no, 1: yes
        else
            lbf = 0;
        end
    elseif sigma < lb
        ub = lb;                % set new upper bound
        lb = sigma;             % set new upper bound
        if dwelltime_cond %feasible if dwelltime has decreased
            ubf = 1; % lower bound feasible? 0: no, 1: yes
        else
            ubf = 0;
        end

        % Determine feasibility after bisection
    else
        if dwelltime_cond %feasible if dwelltime has decreased
            lb = sigma;     % new lower bound
        else
            ub = sigma;     % new upper bound
        end
    end
end
