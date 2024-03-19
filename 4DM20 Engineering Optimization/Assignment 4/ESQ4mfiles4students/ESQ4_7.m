clear
clc

Newton = 0;

Hhat = eye(2);

MaxIter = 30;

f = @(x) ((1-x(1)).^2 + (x(2) - x(1)^2)^2);
df = @(x) ([-2*(1-x(1)) - 4*x(1)*(x(2) - x(1)^2);2*(x(2) - x(1)^2)]);
H = @(x) ([2-4*x(2)+12*x(1).^2, -4*x(1);...
    -4*x(1),2]);

x = [-1;-1]; % initial x
f_eval(1) = f(x);

for k = 1:MaxIter
    alpha = 0.1; % step length
    if Newton
        pk = -H(x(:,k))\df(x(:,k)); % Newton direction
    else
        % Quasi Newton direction
        pk = -Hhat\df(x(:,k));
    end

    x(:,k+1) = x(:,k) + alpha*pk;
    f_eval(k+1) = f(x(:,k+1));

    % BFGS algorithm
    s0 = x(:,k+1) - x(:,k);
    y0 = df(x(:,k+1))-df(x(:,k));
    Hhat = Hhat - (Hhat*s0*s0'*Hhat)/(s0'*Hhat*s0) + (y0*y0')/(y0'*s0);
end

%% plotting

if MaxIter>1
    x1 = -1:0.1:2;
    x2 = x1;
    [X1,X2] = meshgrid(x1,x2);
    J =  (1-X1).^2 + (X2 - X1.^2).^2;
    figure(1)
    clf
    subplot(121)
    hold all
    surfc(X1,X2,J)
    plot3(x(1,:),x(2,:),f_eval,'r.','MarkerSize',8)
    plot3(x(1,:),x(2,:),f_eval,'r')
    xlabel('x_1')
    ylabel('x_2')
    box on

    subplot(122)
    hold all
    contour(X1,X2,J,30)
    plot(x(1,:),x(2,:),'r.','MarkerSize',8)
    plot(x(1,:),x(2,:),'r')
    xlabel('x_1')
    ylabel('x_2')
    box on
else
    disp('True Hessian=')
    disp(H(x(:,k+1)))
    disp('Approx Hessian=')
    disp(Hhat)
end






