% Main file for Guided Selfstudy Assignment 1, question g) 

% Options
%options = optimset('fmincon');
%options = optimset(options,'Display','Iter')
options = optimoptions('fmincon');
options = optimoptions(options,'Display','Iter')

% Initial guess
x0 = [2.0 2.0]; 

% Lower and upper bounds
lb = [0.00001 0.00001];
ub = [inf inf];

[x,fval,exitflag,output,lambda,grad]=...
    fmincon(@objfunGS1,x0,[],[],[],[],lb,ub,@confunGS1,options);

x
fval
exitflag

