% forward kinematics of Mitsubishi Rm101 5 DOF manipulator using the following

% DH parameters:

%

%    link    alpha     a     theta        d

%      1      90       0      var        d1

%      2       0      a2      var         0

%      3       0      a3      var         0

%      4      90       0      var         0

%      5       0       0      var        d5

%

%

% The world origin is taken at at the base of the robot.



function T = mitsufk2(q)



d1 = 214;

a2 = 200;

a3 = 150;

d5 = 85;



th1 = q(1);

th2 = q(2);

th3 = q(3);

th4 = q(4);

th5 = q(5);



C234 = cos(th2+th3+th4);

S234 = sin(th2+th3+th4);

C23 = cos(th2+th3);

S23 = sin(th2+th3);

C1  = cos(th1);

S1  = sin(th1);

C2  = cos(th2);

S2  = sin(th2);

C5  = cos(th5);

S5  = sin(th5);



nx = C5*C1*C234 + S1*S5;

ny = C5*S1*C234 - C1*S5;

nz = C5*S234;



ox = -S5*C1*C234 + S1*C5;

oy = -S5*S1*C234 - C1*C5;

oz = -S5*S234;



ax = C1*S234;

ay = S1*S234;

az = -C234;



px = d5*C1*S234 + a3*C1*C23 + a2*C1*C2;

py = d5*S1*S234 + a3*S1*C23 + a2*S1*C2;

pz = d1 - d5*C234 + a3*S23 + a2*S2;



T = [nx ox ax px

     ny oy ay py

     nz oz az pz

      0  0  0  1];





