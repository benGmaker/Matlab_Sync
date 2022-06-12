% GSS 4
% Exercises for the course 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven University of Technology
%
% the Robotic Toolbox needs to be installed.
% Last modified: 12 Dec 2016


close all; clear all

%**************************************************************************

disp('This routine compare symbolic vs numerical approaches')
disp('for the solution of FK and IK problems on a given robotic arm')

disp('Press any key to continue...'); 
pause

disp('Matrix of DH parameters (in [mm]) for Mitsubishi robot:')

%                theta  d      a   alpha sigma
Mitsubishi_dh = [0      214    0   pi/2  0
                 0      0      200 0     0
                 0      0      150 0     0
                 0      0      0   pi/2  0
                 0      85     0   0     0     ];
               
clear L;
for ii=1:size(Mitsubishi_dh,1),
    L(ii) = Link(Mitsubishi_dh(ii,1:5));
end

Mitsubishi_robot = SerialLink(L,'name','Mitsubishi robot')

disp('Press any key to continue...'); 
pause
disp('')

%**************************************************************************

disp('Angular ranges of robot joints')

tmin_deg = [-120 -30 -120    0 -180]
tmax_deg = [ 120 120    0  180  180]

%**************************************************************************

disp('Generate vector of random joint coordinates q1_deg [deg] (q1 [rad]) that meet the joint limits:');

q1_deg = tmin_deg + rand(1,5).*(tmax_deg - tmin_deg) % q1 [deg]
q1_rad = q1_deg.*pi/180                              % q1 [rad]

disp('Press any key to continue...'); 
pause
disp(' ')

%**************************************************************************

disp('Forward kinematics based on symbolic expressions implemented in mitsufk2.m :')

tic; % Start a stopwatch timer
T5_symbolic = mitsufk2(q1_rad)
toc; % Read the stopwatch timer

disp('Press any key to continue...'); 
pause
disp(' ')

%**************************************************************************
disp('Forward kinematics based on numerical calculations using fkine :')

tic; % Start a stopwatch timer
T5_numeric = fkine(Mitsubishi_robot,q1_rad)
toc; % Read the stopwatch timer

disp('Press any key to continue...'); 
pause
disp(' ')

%**************************************************************************
disp('Inverse kinematics based on symbolic expressions implemented in mitsuik2.m :')

tic; % Start a stopwatch timer
q_symbolic_rad = mitsuik2(T5_symbolic);
toc; % Read the stopwatch timer

q_symbolic_deg = q_symbolic_rad*180/pi

disp('Press any key to continue...'); 
pause
disp(' ')

%**************************************************************************
disp('Inverse kinematics based on numerical calculations using ikine.m')

disp('  ');
disp('Initial guess q1:')

q_guess_rad = q1_rad + .1*(rand(1,5)-.5);
q_guess_deg = q_guess_rad*180/pi

disp('Press any key to continue!'); pause;

disp('  ');
disp('We define mask matrix M to specify task-space coordinates that cannot be controlled independently;')
disp('M contains values relative to the coordinate frame of the base. In this example,')
disp('rotation about the wrist axis X5 in the end-effector''s coordinate frame cannot be')
disp('controlled independently; the corresponding rotation in the base frame is about Z0 axis,')
disp('assuming the robot arm is fully streched.')

M = [1 1 1 1 1 0]

disp('Press any key to continue...'); 
pause
disp(' ')

disp('Numerical IK solution using ikine.m :')

% BEGIN TECHNICAL COMMENT
%
% (YOU CAN SKIP THIS UNLESS YOU DECIDE TO UNDERSTAND
% HOW ikine WORKS)
%
% ikine makes use of the RT function tr2diff
% tr2diff(H1, H2) provides in a 6x1 vector an approximation of 
% t2-t1 and logm(R1^T R2) 
%
% END TECHNICAL COMMENT

tic; % Start a stopwatch timer
q_numeric_rad = ikine(Mitsubishi_robot,T5_numeric,q_guess_rad,M)
toc; % Read the stopwatch timer

q_numeric_deg = q_numeric_rad*180/pi

disp('Press any key to continue...'); 
pause

disp('Evaluation of accuracy of numerical IK solution:')

disp(' ');  
disp('Absolut error [deg]: qerror = abs(q1_deg - qnd)');
error_deg = abs(q1_deg - q_numeric_deg)

disp('Maximum error [deg]: max_error_deg=max(abs(error))');
max_error_deg = max(abs(error_deg))

disp('Press any key to continue...'); 
pause
disp(' ')

disp('Comparison of all solutions:')
disp(' ');

disp('Initial vector of joint coordinates [deg]:')

q_reference = q1_deg

disp('Symbolic IK solution [deg]:')

q_symbolic_deg

disp('Initial guess for numerical IK solution [deg]:')

q_guess_deg

disp('Numerical IK solution [deg]:')

q_numeric_deg