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

dx = [-x(1)-2*x(2); 
    x(1)+2*x(2); 
    1];
end
