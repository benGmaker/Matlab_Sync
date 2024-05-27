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

    if x(3) == 1 %checking if x(3) i.e. is one
        q = 2; %then it wil be set to 2
    elseif x(3) == 2
        q = 1;
    else
        except('state not found')
    end
    xplus = [x(1); x(2); q]; %setting new variables
end
