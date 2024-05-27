% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------
% Description: jump set
% Return 0 if outside of D, and 1 if inside D
% -------------------------------------------------------------------------
function [inside] = JF_D(x)
    Q = [-32 6;6 2];
    y = [x(1); x(2)];
    product = y.'*Q*y;
    
    if product <= 0
        inside = 1;
    else
        inside = 0;
    end
end
