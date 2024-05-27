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
    E12 = [-8 -1];
    E21 = [2 -1];
    Q = [-16,3;3,1];
    y = [x(1); x(2)];
    product = y.'*Q*y;
    
    inside = 0;
    if product <= 0
        %inside = 1;
        
        if abs(E12*y) < abs(E21*y) &&  x(3) == 1
            inside = 1;
            display('edge1') 
        end 

        if abs(E12*y) > abs(E21*y) && x(3) == 2
            inside = 1; 
            display('edge2')
        end
        
    else
        inside = 0;
    end
    
    
end
