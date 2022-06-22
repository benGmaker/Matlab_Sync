% GSS DAY 7
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven

close all; clear all; clc

syms a1 a2 d1 d3 th1 th2
pi = sym(pi);


% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

% table with DH params
a    = [ a1; a2;  0]
d    = [ d1;  0; d3]
alf  = [  0; pi;  0]
th   = [th1; th2; 0]

% joint type - 0 revolute, 1 prismatic 
sigma= [  0; 0;   1]; 

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
    disp(['A_',num2str(ii),' ='])
    disp(A{ii})
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

% Create linear velocity Jacobian Jv and angular velocity Jacobian Jomega

o_0_0=[0;0;0];
z_0_0=[0;0;1];

J_v=[]; J_omega=[];

if sigma(1)==0,
    J_v=cross(z_0_0,T_0_{end}(1:3,4)-o_0_0);
    J_omega=z_0_0;
else
    J_v=z_0_0;
    J_omega=0*ones(3,1);
end

for ii=1:length(a)-1,
    if sigma(ii+1)==0,
        J_v=[J_v, cross(T_0_{ii}(1:3,3),T_0_{end}(1:3,4)-T_0_{ii}(1:3,4))];
        J_omega=[J_omega, T_0_{ii}(1:3,3)];
    else
        J_v=[J_v, T_0_{ii}(1:3,3)];
        J_omega=[J_omega, 0*ones(3,1)];
    end    
end

J_v=simplify(J_v)
%J_omega=simplify(J_omega)

J=[J_v; J_omega]


% Determinant of the linear velocity Jacobian

det_J_v = simplify(det(J_v));
det_J_v


