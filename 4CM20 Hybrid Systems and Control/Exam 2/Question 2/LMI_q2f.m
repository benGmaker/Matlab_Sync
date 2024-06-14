function [Pvar,Qvar,Zvar, L,diagnostics] = LMI_q2f(A,J,cvar,dvar,Pvar,Qvar,Zvar)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
        %setting LMI conditions
        L_1 = [6.7480;-3.0027;-0.0037];
        L_2 = [0.5786;0.8427;0.4945];
        C = [0, 1, 0];
        cond1 = (A-L_1*C)'*Pvar + Pvar* (A - L_1*C) <= -cvar * Pvar;
        cond2 = [ exp(-dvar)*Pvar, (J-L_2*C)'*Pvar ;
            Pvar*(J-L_2*C),     exp(dvar)*Pvar] >= 0;
    
        %positive definite condition
        Lp = Pvar >= 1e-9;
    
        % combine constraints into one object
        L = [cond1, cond2, Lp];
        opts = sdpsettings('verbose',0,'solver','sdpt3');
        diagnostics = optimize(L,[],opts); % solve the LMI problem
end