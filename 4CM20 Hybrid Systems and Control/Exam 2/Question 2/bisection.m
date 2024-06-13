function [sigma] = bisection(lb,ub,lbf,ubf)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
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
end