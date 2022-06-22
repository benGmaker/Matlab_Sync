% GSS DAY 7
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven

close all; clear all; clc;

syms d2 d3 d6 th1 th2 th4 th5 th6 
pi = sym(pi);

% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

a  = [      0;      0;  0;       0;      0;   0]
d  = [      0;     d2; d3;       0;      0;  d6]
alf= [-0.5*pi; 0.5*pi;  0; -0.5*pi; 0.5*pi;   0]
th = [    th1;    th2;  0;     th4;    th5; th6]

zero1x3  = [0 0 0];

x=[]; R=[]; A=[];
for ii=1:length(a),
    x{ii}=[a(ii)*cos(th(ii)); a(ii)*sin(th(ii)); d(ii)];
    
    R{ii}=[cos(th(ii)), -cos(alf(ii))*sin(th(ii)),  sin(alf(ii))*sin(th(ii))
           sin(th(ii)),  cos(alf(ii))*cos(th(ii)), -sin(alf(ii))*cos(th(ii))
                     0,              sin(alf(ii)),              cos(alf(ii))];
                
    A{ii}=[        R{ii},  x{ii}
                 zero1x3,      1];
end

% Inspect the homogenous transformation matrices 
% representing the coordinates of the origin and 
% the relative rotation matrix of the frame i 
% with respect to the frames i-1

for ii=1:length(a),
    disp(['A_',num2str(ii)])
    A{ii}
end


% Generate matrices of homogenous transformations representing 
% the positions x^0_i and orientations R^0_i of the link 
% coordinate frames oixiyizi (i=1,2,...) relative 
% to the coordinate frame o0x0y0z0 of the base

T_0_{1}=A{1};
for ii=2:length(a),
    T_0_{ii} = simplify( T_0_{ii-1} * A{ii} );
end

for ii=1:length(a),
    disp(['T^0_',num2str(ii),'='])
    T_0_{ii}
end


% Extract the vectors needed to create the Jacobian

o_0_0=[0;0;0]

z_0_0=[0;0;1]

o_0_6=T_0_{6}(1:3,4)

z_0_1=T_0_{1}(1:3,3)

o_0_1=T_0_{1}(1:3,4)

z_0_2=T_0_{2}(1:3,3)

z_0_3=T_0_{3}(1:3,3)

o_0=T_0_{3}(1:3,4)

z_0_4=T_0_{4}(1:3,3)

z_0_5=T_0_{5}(1:3,3)


% Create Jacobian

J=[cross(z_0_0,o_0_6-o_0_0), cross(z_0_1,o_0_6-o_0_1),       z_0_2, cross(z_0_3,o_0_6-o_0),  cross(z_0_4,o_0_6-o_0),  cross(z_0_5,o_0_6-o_0)
                      z_0_0,                   z_0_1,  0*ones(3,1),                  z_0_3,                   z_0_4,                   z_0_5];
                  
J=simplify(J)

