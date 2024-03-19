% Quadratic interpolation
f = @(x) (1 - 2.*x./(3.^x));

x1 = 0;
x2 = 1;
x3 = 2;

for k = 1:2
    f1 = f(x1);
    f2 = f(x2);
    f3 = f(x3);

    % we want to fit a quadratic function of the form y = a1 + a2*x + a3*x^2
    A = [1,x1,x1^2;...
        1,x2,x2^2;...
        1,x3,x3^2];
    b = [f1;f2;f3];

    a = A\b;

    % minimum of the quadratic approximation
    x4 = -a(2)/(2*a(3));
    f4 = f(x4);

    if x4>x2
        if f4<f2
            x1=x4;
        else if f4>f2
                x3 = x2;
                x2 = x4;
        end
        end
    else
        if f4<f2
            x3=x2;
            x2 = x4;
        else if f4>f2
                x1 = x4;
        end
        end
    end

    disp([x1,x2,x3])

end


