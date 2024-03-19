clear
load('EQ1_data.mat')

U = data(:,1);
Y = data(:,2);

g = @(x,u)  (x(1).*u + x(2));

dgdx1 = @(x,u) (u);
dgdx2 = @(x,u) (1);

%% Gradient Descent
xk = [0;0];

plot(U,g(xk,U))
alpha = 0.6;

for k = 1:50

    for i = 1:numel(U)
        dldx(:,i) =  -2*[dgdx1(xk,U(i)),dgdx2(xk,U(i))]'*(Y(i) - g(xk,U(i)));
    end
    xk = xk - alpha*sum(dldx,2)/numel(U);


    figure(12)
    clf
    hold all
    plot(U,Y,'.')
    plot(U,g(xk,U),'r')
end
%% Stochastic Gradient Descent
xk = [0;0];

alpha = 0.6;
for k = 1:50
    S = randi(numel(U),8,1);
    for j = 1:numel(S)
        i = S(j);
        dldx(:,i) =  -2*[dgdx1(xk,U(i)),dgdx2(xk,U(i))]'*(Y(i) - g(xk,U(i)));
    end
    xk = xk - alpha*sum(dldx,2)/numel(U);

    figure(12)
    clf
    hold all
    plot(U,Y,'.')
    plot(U(S),Y(S),'ro','LineWidth',1)
    plot(U,g(xk,U),'r')
    pause(0.3)

end