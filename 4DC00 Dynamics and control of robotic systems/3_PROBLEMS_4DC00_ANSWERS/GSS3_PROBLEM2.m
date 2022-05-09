% GSS DAY 3
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven

close all; clear all

syms d1 d2 
pi = sym(pi);

% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

a  = [      0;  0]
d  = [     d1; d2]
alf= [-0.5*pi;  0]
q  = [      0;  0]

zero1x3 = [0 0 0]

x=[]; R=[]; A=[];
for ii=1:length(a),
    x{ii}=[a(ii)*cos(q(ii)); a(ii)*sin(q(ii)); d(ii)];
    
    R{ii}=[cos(q(ii)), -cos(alf(ii))*sin(q(ii)),  sin(alf(ii))*sin(q(ii))
           sin(q(ii)),  cos(alf(ii))*cos(q(ii)), -sin(alf(ii))*cos(q(ii))
                    0,             sin(alf(ii)),             cos(alf(ii))];
                
    A{ii}=[        R{ii},  x{ii}
                 zero1x3,      1 ];
end


% Inspect the homogenous transformation matrices 
% representing the coordinates of the origin and 
% the relative rotation matrix of the frame i 
% with respect to the frames i-1

for ii=1:length(a),
    disp(['A_',num2str(ii)])
    A{ii}
end


% Generate the homogenous transformation matrix
% representing the position o^0_2 and orientation R^0_2
% of the robot tip's coordinate frame o2x2y2z2 
% relative to the base's coordinate frame o0x0y0z0 


T_0_2=1;
for ii=length(a):-1:1,
    T_0_2 = simplify( A{ii} * T_0_2 );
end

T_0_2