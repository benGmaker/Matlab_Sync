% -------------------------------------------------------------------------
% 4CM20 Hybrid Systems and Control 2018-2019
% Jump-flow simulation example
%
% Niek Borgers (d.p.borgers@tue.nl)
% Eindhoven 07-12-2015
% -------------------------------------------------------------------------
% Description: jump map 
% -------------------------------------------------------------------------

function xplus = JF_g(x)

xplus = [x(1); x(1); 0];
end
