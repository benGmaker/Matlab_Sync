% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------
% Description: flow map 
% -------------------------------------------------------------------------


function dx = JF_f(x)
    A1 = [-1 -100; 10 -1];
    A2 = [1 10; -100 1];
    
    y = [x(1); x(2)];
    if x(3) == 1
        dy = A1*y;
    elseif x(3) == 2
        dy = A2*y;
    else
        except('state not found') 
    end
    dx = [dy; 0];
        
end
