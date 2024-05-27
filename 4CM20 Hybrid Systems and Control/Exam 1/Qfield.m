function [X,Y,p] = Qfield(Q,min,max,stepsize)
%vectorfield retruns, X, Y vectorfield coordinates and u, v 2D vector
%components, given the matrix M to be multiplied and coverage area
    [X,Y] = meshgrid(min:stepsize:max,min:stepsize:max);
    L = length(X);
    u = zeros(L);
    v = zeros(L);
    for i = 1 : L
        for j = 1 : L
               p(i,j) = [X(i,j);Y(i,j)].'*Q*[X(i,j);Y(i,j)];

        end
    end
end