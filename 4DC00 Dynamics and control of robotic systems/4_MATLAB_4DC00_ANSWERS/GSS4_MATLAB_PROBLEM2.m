% GSS 4
% Exercises for the course 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven University of Technology
%
% the Robotic Toolbox needs to be installed.
% Last modified: 12 Dec 2016

close all; clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DH-parameters in symbolic form
syms a1 a2 d4 q1 q2 q3
pi = sym(pi);

% Generate vectors between origins of the coordinate frames 
% attached to SCARA robot joints (DH-parameters)

a   =[a1; a2; 0;  0]
d   =[ 0;  0; 0; d4]
alf =[ 0; pi; 0;  0]
q   =[q1; q2; q3; 0]

% Generate the homogenous transformation matrices 
% between the coordinate frames attached to SCARA robot joints

zero1x3 = [0 0 0]
x=[]; R=[]; A=[];

for ii=1:length(a)
  
    % translation part of the DH homogeneour transformation
    x{ii}=[a(ii)*cos(q(ii)); a(ii)*sin(q(ii)); d(ii)];
    
    % rotation part of the DH homogeneous transformation
    R{ii}= ...
    [ cos(q(ii)), -cos(alf(ii))*sin(q(ii)),  sin(alf(ii))*sin(q(ii))
      sin(q(ii)),  cos(alf(ii))*cos(q(ii)), -sin(alf(ii))*cos(q(ii))
               0,             sin(alf(ii)),             cos(alf(ii)) ];
       
    % homogeneous transformation              
    A{ii}=[   R{ii},   x{ii}
            zero1x3,       1 ];
end

% Inspect the homogenous transformation matrices 
% representing the coordinates of the origin and 
% the relative rotation matrix of the frame i 
% with respect to the frames i-1

for ii=1:length(a),
  disp(['A_',num2str(ii),' ='])
  disp(A{ii})
end

pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate the homogenous transformation matrix
% representing the position o^0_4 and orientation R^0_4
% of the robot tip's coordinate frame o4x4y4z4 
% relative to the base's coordinate frame o0x0y0z0 

T_0_4 = eye(4);

for ii=length(a):-1:1,
    % the simplify command tries to shorten the obtained symbolic expression 
    T_0_4 = simplify( A{ii} * T_0_4 );
end

T_0_4

pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define numerical values of the DH pamarameters for the SCARA robot 

a1_num=3; a2_num=2;

% Create matrix containing DH-parameters:
%	1	alpha	link twist angle
%	2	A	link length
%	3	theta	link rotation angle
%	4	D	link offset distance
%	5	sigma	joint type, 0 for revolute, non-zero for prismatic

%         theta  d  a        alpha           sigma
scara_dh=[0      0  a1_num   0               0
          0      0  a2_num   double(alf(2))  0
          0      0  0        0               0
          0      1  0        0               1 ];

% Create links      

clear L
for ii=1:length(a),
  L(ii) = Link(scara_dh(ii,1:5));
end

% Create robot object
scara_robot = SerialLink (L,'name', 'SCARA robot')

% Determine position and orientation of the robot tip's coordinate frame 
% relative to the base's coordinate frame 
% given the DH parameters of the robot 
% for several configurations of the robot joints

% Compute random homogenous transformation matrix
q_num = rand(4,1)
T_0_4_num = ...
  double(subs(T_0_4,...
              {a1,a2,q1,q2,q3,d4},   ...
              {a1_num,a2_num,q_num(1),q_num(2),q_num(3),q_num(4)} ...
              )...
         )
T_0_4_RT = fkine( scara_robot, double(q_num) )
nfig = 1;
figure(nfig);  
  plot(scara_robot,double(q_num)','workspace',[-6 6 -6 6 -2 2]); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('first, random, pose')
pause

% Compute random homogenous transformation matrix
q_num = rand(4,1)
T_0_4_num = ...
  double(subs(T_0_4,...
              {a1,a2,q1,q2,q3,d4},   ...
              {a1_num,a2_num,q_num(1),q_num(2),q_num(3),q_num(4)} ...
              )...
         )
T_0_4_RT = fkine( scara_robot, double(q_num) )
nfig = nfig+1; 
figure(nfig);  
  plot(scara_robot,double(q_num)','workspace',[-6 6 -6 6 -2 2]); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('second, random, pose')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q_start=[pi/2 0 0 0]; q_end=[pi pi pi 5];
number_points=100;
q_num=[];
for ii=1:4,
    delta_q(ii)=(q_end(ii)-q_start(ii))/(number_points-1);
    q_num = [q_num, [q_start(ii):delta_q(ii):q_end(ii)]'];
end

disp('Animation (it can be interrupted by pressing ctrl-c, after clicking on this MATLAB prompt window)')
nfig = nfig+1; 
figure(nfig); 
  plot(scara_robot,double(q_num),'workspace',[-6 6 -6 6 -2 2]); % axis([-1 1 -1 1 0 1])
grid on, zoom on  
disp('Animation completed')
  