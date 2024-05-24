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
    gamma = 9.81;
    
    dx = [x(2);
        -gamma];
end
