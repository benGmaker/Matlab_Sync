% ESQ4exer5.m
% Visualization of the errors in finite differencing
% objfnc.m contains objective function for which finite difference
% gradient is calculated

clf, hold off, clear

% Point at which finite difference gradient is calculated
x0 = 1.5;

% Vector of finite difference steps
hvec=logspace(-20,0,100);

% Calculation of finite difference gradient for range of h values
for i=1:1:length(hvec)

  h = hvec(i);
  fx0 = objfnc(x0);
  fx0plush = objfnc(x0+h);
  dfdx(i) = (fx0plush - fx0)/h;
  
end

% Plotting finite difference gradients
subplot(211)
semilogx(hvec,dfdx)
xlabel('h'), ylabel('df/dx'), title('forward difference')
%subplot(212)
%semilogx(hvec,dfdxcentral)
%xlabel('h'), ylabel('df/dx'), title('central difference')
subplot


