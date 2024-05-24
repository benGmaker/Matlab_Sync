% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------
% Description: jump map 
% -------------------------------------------------------------------------

function xplus = JF_g3(x)
    lambda = 0.8;
    xplus = [-x(1); -lambda*x(2)];
end
