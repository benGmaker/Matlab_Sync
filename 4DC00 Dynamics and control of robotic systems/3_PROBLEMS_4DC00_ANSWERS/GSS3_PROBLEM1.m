% GSS DAY 3
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven

close all; clear all

syms a1 a2 a3 q1 q2 q3
pi = sym(pi);


% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

a   = [a1; a2; a3]
d   = [ 0;  0;  0]
alf = [ 0;  0;  0]
q   = [q1; q2; q3]

zero1x3 = [0 0 0]

x=[]; R=[]; A=[];
for ii=1:length(a),
    x{ii}=[a(ii)*cos(q(ii)); a(ii)*sin(q(ii)); d(ii)];
    
    R{ii}=[cos(q(ii)), -cos(alf(ii))*sin(q(ii)),  sin(alf(ii))*sin(q(ii))
           sin(q(ii)),  cos(alf(ii))*cos(q(ii)), -sin(alf(ii))*cos(q(ii))
                    0,             sin(alf(ii)),             cos(alf(ii))];
                
    A{ii}=[        R{ii},  x{ii}
                 zero1x3,      1];
end


% Inspect the homogenous transformation matrices 
% representing the coordinates of the origin and 
% the relative rotation matrix of the frame i 
% with respect to the frames i-1

for ii=1:length(a),
    disp(['A_',num2str(ii)])
    disp(A{ii})
end


% Generate the homogenous transformation matrix
% representing the position o^0_3 and orientation R^0_3
% of the robot tip's coordinate frame o3x3y3z3 
% relative to the base's coordinate frame o0x0y0z0 

T_0_3=1;
for ii=length(a):-1:1,
    T_0_3 = simplify( A{ii} * T_0_3 );
end

T_0_3