function [diagnostics,pres] = LMI_solve(Pvar,c,d)
    %this function specifically states our LMI problem
    
    % System matrices
    A = [1 -3;
        1.5 1];
    R = [0.4 0.3;
        0 0.6];
    
    Lp = Pvar >= 1e-9;
    % We use Pvar>= 1e-9 instead of Pvar>0, as strict inequalities do not make
    %decrease of the Lyapunv function in flow
    Lf = A'*Pvar+Pvar*A<=-c*Pvar;
    Lg = R'*Pvar*R <= exp(-d) * Pvar;
    
    % combine constraints into one object
    L = [Lf,Lp];
    opts = sdpsettings('solver','sdpt3');
    diagnostics = optimize(L,[],opts); % solve the LMI problem
    
    % Check result
    % pres : Primal constraint residuals
    % dres : Dual constraint residuals
    [pres,~] = check(L);
end