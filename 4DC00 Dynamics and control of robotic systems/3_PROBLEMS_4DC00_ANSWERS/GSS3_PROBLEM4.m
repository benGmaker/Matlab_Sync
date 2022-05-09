% GSS DAY 3
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven
%
% version 2 - DH table consistent with rotation convention

close all; clear all

syms a2 d1 d4 d6 q1 q2 q3 q4 q5 q6 
pi = sym(pi);
% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

a   = [      0; a2;      0;      0;       0;   0]
d   = [     d1;  0;      0;     d4;       0;  d6]
alf = [-0.5*pi;  0; 0.5*pi; 0.5*pi; -0.5*pi;   0]
th  = [     q1; q2;     q3;     q4;      q5;  q6]

zero1x3 = [0 0 0]

x=[]; R=[]; A=[];
for ii=1:length(a),
  
    x{ii}=[a(ii)*cos(th(ii)); a(ii)*sin(th(ii)); d(ii)];
    
    R{ii}=[cos(th(ii)), -cos(alf(ii))*sin(th(ii)),  sin(alf(ii))*sin(th(ii))
           sin(th(ii)),  cos(alf(ii))*cos(th(ii)), -sin(alf(ii))*cos(th(ii))
                    0,             sin(alf(ii)),             cos(alf(ii))];
                
    A{ii}=[   R{ii},   x{ii}
            zero1x3,       1  ];
         
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
% representing the position o^0_6 and orientation R^0_6
% of the robot tip's coordinate frame o6x6y6z6 
% relative to the base's coordinate frame o0x0y0z0 

T_0_6=1;
for ii=length(a):-1:1,
    T_0_6 = simplify( A{ii} * T_0_6 );
end

T_0_6

