function [X,Y,p]  = valuefield(M,min,max,stepsize)
%valuefield returns the value of matrix m over field X,Y
    [X,Y] = meshgrid(min:stepsize:max,min:stepsize:max);
    L = length(X);
    p = zeros(L);
    for i = 1 : L
        for j = 1 : L
               p(i,j) = M*[X(i,j);Y(i,j)];
        end
    end
end