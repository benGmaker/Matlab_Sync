% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------
% Description: Flow set
% Return 0 if outside of C, and 1 if inside C
% -------------------------------------------------------------------------

function [inside] = JF_C(x) 
    Q = [-16,3;3,1];
    y = [x(1); x(2)];
    product = y.'*Q*y;
    
    if  product >= 0
        inside = 1;
    else
        inside = 0;
       
    end
end
