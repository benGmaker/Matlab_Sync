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
    Q = [-16,3;3,1];
    %Q = [-32,6;6,2];
    y = [x(1); x(2)];
    E12 = [-8 -1];
    E21 = [2 -1];

    if x(3) == 1
        if E12*y <= 0
            inside = 1;
        else 
            inside = 0;
        end
    elseif x(3) == 2
        if E21*y <= 0
            inside = 1;
        else
            inside = 0;
        end
    end
    
end
