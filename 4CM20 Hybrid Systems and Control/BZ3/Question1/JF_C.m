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

if  x(3) <= 0.05
    inside = 1;
else
    inside = 0;
end
end
