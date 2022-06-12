% GSS 4
% Exercises for the course 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven University of Technology
%
% the Robotics Toolbox (v9.10) needs to be installed 
% Last modified: 12 Dec 2016

close all; clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DH-parameters in symbolic form
syms a2 a3 d1 d2 d3 q1 q2 q3 
pi = sym(pi);

% Generate vectors between origins 
% of the circumjacent coordinate frames 
% attached to RRR robot joints
% (DH-parameters)

alf = [0.5*pi; 0 ;  0] % link twists
a   = [0     ; a2; a3] % link distances
q   = [q1    ; q2; q3] % joint angles
d   = [d1    ; d2; d3] % link offsets

% Generate the homogenous transformation matrices 
% between the coordinate frames attached to RRR robot joints

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
% representing the position o^0_3 and orientation R^0_3
% of the robot tip's coordinate frame o3x3y3z3 
% relative to the base's coordinate frame o0x0y0z0 

T_0_3 = eye(4);

for ii=length(a):-1:1
    % the simplify command tries to shorten the obtained symbolic expression 
    T_0_3 = simplify( A{ii} * T_0_3 ); 
end

T_0_3

pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define numerical values of RRR robot DH pamarameters
a2_num =0.2 ; a3_num = 0.415;
d1_num =0.56; d2_num = 0.169; d3_num=0.09;

% We now use the Robotics Toolbox (v9.10)
% We create the a data structure, compatible with the Robotic Toolbox,
% containing the DH-parameters for the RRR robot
%
% Type 'help Link' for a review of the data structure used by the 
% Robotics Toolbox to store the DH parameters. The output of the command
% will be something like the following
%
% 	1	alpha	  link twist angle        [ link twist  ]
%  	2	A	      link length             [ link length ] 
%  	3	theta	  link rotation angle     [ joint angle ] 
%  	4	D	      link offset distance    [ link offset ]
%  	5	sigma	  joint type  ( 0 for revolute, non-zero for prismatic )
%        

% Create the data structure for the RRR robot

%        theta d       a        alpha             sigma
rrr_dh=[ 0     d1_num  0        double(alf(1))    0  ; ...
         0     d2_num  a2_num   0                 0  ; ...
         0     d3_num  a3_num   0                 0  ] ;

% Create link objects with the Robotic Toolbox 

clear L
for ii=1:size(rrr_dh,1),
    
  L(ii) = Link(rrr_dh(ii,:)); % special function call format
  
end

% Create the corresponding robot object

rrr_robot       = SerialLink(L, 'name', 'TU/e RRR robot')

% We now compute the forward kinematics
% Determine the position and orientation of the RRR robot tip's frame 
% o3x3y3z3 relative to the base coordinate frame o0x0y0z0, given the 
% DH parameters of the robot for several configurations of the robot joints

% subs   command: substitute a symbolic expression with a numerical value
% double command: convert a symbolic object into a numerical object

% Compute homogenous transformation matrix for q_a
q_num     = [0; pi/2; pi/3]
T_0_3_num = ...
  double(subs(T_0_3,...
              {a2    ,a3    ,d1    ,d2    ,d3    ,q1      ,q2      ,q3},   ...
              {a2_num,a3_num,d1_num,d2_num,d3_num,q_num(1),q_num(2),q_num(3)} ...
              )...
         )
T_0_3_RT  = fkine( rrr_robot, double(q_num) )
nfig = 1; 
figure(nfig); 
  plot(rrr_robot,double(q_num)','nobase'); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('First pose')
pause

% Compute homogenous transformation matrix for q_b
q_num     = [pi; pi/2; pi/3]
T_0_3_num = ...
  double(subs(T_0_3,...
              {a2    ,a3    ,d1    ,d2    ,d3    ,q1      ,q2      ,q3},   ...
              {a2_num,a3_num,d1_num,d2_num,d3_num,q_num(1),q_num(2),q_num(3)} ...
              )...
         )
T_0_3_RT  = fkine( rrr_robot, double(q_num) )
nfig = nfig+1; 
figure(nfig); 
  plot(rrr_robot,double(q_num)','nobase'); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('Second pose')
pause

% Compute homogenous transformation matrix for q_c
q_num=[pi/2; 0; 0]
T_0_3_num = ...
  double(subs(T_0_3,...
              {a2    ,a3    ,d1    ,d2    ,d3    ,q1      ,q2      ,q3},   ...
              {a2_num,a3_num,d1_num,d2_num,d3_num,q_num(1),q_num(2),q_num(3)} ...
              )...
         )
T_0_3_RT = fkine( rrr_robot, double(q_num) )
nfig = nfig+1; 
figure(nfig); 
  plot(rrr_robot,double(q_num)'); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('Third pose')
pause

% Compute homogenous transformation matrix for q_d
q_num=[pi/2; 0; pi/2]
T_0_3_num = ...
  double(subs(T_0_3,...
              {a2    ,a3    ,d1    ,d2    ,d3    ,q1      ,q2      ,q3},   ...
              {a2_num,a3_num,d1_num,d2_num,d3_num,q_num(1),q_num(2),q_num(3)} ...
              )...
         )
T_0_3_RT = fkine( rrr_robot, double(q_num) )
nfig = nfig+1; 
figure(nfig);  
  plot(rrr_robot,double(q_num)','nobase'); % axis([-1 1 -1 1 0 1])
grid on, zoom on

disp('Fourth pose')
pause

% Compute homogenous transformation matrix for q_e
q_num=[pi/2; 0; pi]
T_0_3_num = ...
  double(subs(T_0_3,...
              {a2    ,a3    ,d1    ,d2    ,d3    ,q1      ,q2      ,q3},   ...
              {a2_num,a3_num,d1_num,d2_num,d3_num,q_num(1),q_num(2),q_num(3)} ...
              )...
         )
T_0_3_RT = fkine( rrr_robot, double(q_num) )
nfig = nfig+1; 
figure(nfig);  
  plot(rrr_robot,double(q_num)','nobase'); % axis([-1 1 -1 1 0 1])
grid on, zoom on
  
disp('Fifth pose')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q_start=[pi/2 0 0]; q_end=[pi pi pi];
number_points=100;

q_num=[];
for ii=1:3,
    delta_q(ii)=(q_end(ii)-q_start(ii))/(number_points-1);
    q_num = [q_num, [q_start(ii):delta_q(ii):q_end(ii)]'];
end

disp('Animation (it can be interrupted by pressing ctrl-c, after clicking on this MATLAB prompt window)')
nfig = nfig+1; 
figure(nfig); 
  % perform an ANIMATION because q_num is a matrix, not just a vector ! 
  plot(rrr_robot,double(q_num),'nobase','fps',30); %axis([-0.5 0.5 -1 1 0 1])
grid on, zoom on
disp('Animation completed')


