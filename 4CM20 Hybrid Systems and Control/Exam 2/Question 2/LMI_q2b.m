function [Pvar,Qvar,Zvar, L,diagnostics] = LMI_q2b(A,J,cvar,dvar,Pvar,Qvar,Zvar)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
        %setting LMI conditions
        cond1 = A'* Pvar - Qvar' + Pvar*A - Qvar <= -cvar * Pvar;
        cond2 = [ exp(-dvar)*Pvar,  J'*Pvar - Zvar';
            Pvar*J - Zvar,     exp(dvar)*Pvar];
    
        %positive definite condition
        Lp = Pvar >= 1e-9;
    
        % combine constraints into one object
        L = [cond1, cond2, Lp];
        opts = sdpsettings('verbose',0,'solver','sdpt3');
        diagnostics = optimize(L,[],opts); % solve the LMI problem
end