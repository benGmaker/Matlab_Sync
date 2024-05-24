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

if x(3) >= 0.05
    inside = 1;
else
    inside = 0;
end
end
