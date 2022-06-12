% Inverse kinematics of MITSUBISHI RM-101 5 DOF manipulator.

%

% USAGE:  q = mitsuik(T)

%

% where: T = homogeneous transform of point at center of finger pads

%        q = joint angles (radians)

%

% DH parameters:

%

%    link    alpha     a     theta        d

%      1      90       0      var        d1

%      2       0      a2      var         0

%      3       0      a3      var         0

%      4      90       0      var         0

%      5       0       0      var        d5

%

% The world origin is taken at the base of the robot.



function q = mitsuik2(T)



% check if T5 is valid transform (ishomog is a Robotic Toolbox function)

if ishomog(T) ~= 1  % this actually only checks if 4X4 matrix

   error('T5 is not a 4X4 matrix')

end



% parameters values 
d1 = 214;

a2 = 200;

a3 = 150;

d5 = 85;



nx = T(1, 1);

ny = T(2, 1);



ox = T(1, 2);

oy = T(2, 2);



ax = T(1, 3);

ay = T(2, 3);

az = T(3, 3);



px = T(1, 4);

py = T(2, 4);

pz = T(3, 4);



% ===================   BODY JOINT  ============================



if py == 0 & px == 0          % point on the Z0 axis is a problem

  if ay == 0 & ax == 0        % wrist pointing straight up/down is problem

     theta_1 = 0;

  else

     theta_1 = atan2(ay, ax);

  end

else

  theta_1 = atan2(py, px);    % use this as much as possible

end



% check joint limits

tmax = 120*pi/180; tmin = -tmax;

if theta_1 > tmax 

   theta_1 = theta_1 - pi;

end

if theta_1 < tmin

   theta_1 = theta_1 + pi;

end



c1 = cos(theta_1);

s1 = sin(theta_1);





% =================== T2+T3+T4  ===================================



t234 = atan2(c1*ax + s1*ay, -az);



% check joint limits

tmax = 300*pi/180; tmin = -150*pi/180;

if t234 > tmax 

   t234 = t234 - pi;

elseif t234 < tmin

   t234 = t234 + pi;

end



c234 = cos(t234);

s234 = sin(t234);



% ===================   ELBOW joint 3 ==========================



% some dummy variables

p1 = c1*px + s1*py - d5*s234;

p2 = pz - d1 + d5*c234;



c3 = (p1^2 + p2^2 - a3^2 - a2^2) / (2*a2*a3);



% check for error

if abs(c3) > 1

  error('Illegal position - too far away.')

end



s3 = -sqrt(1 - c3^2);

theta_3 = atan2(s3, c3);





if theta_3 < -120*pi/180

  error('Elbow rotation illegal.')

end



% ==================  SHOULDER JOINT 2 =========================

num = p2*(a3*c3 + a2) - a3*s3*p1;

den = p1*(a3*c3 + a2) + a3*s3*p2;

theta_2 = atan2(num, den);



% check joint limits

tmax = 120*pi/180; tmin = -30*pi/180;

if theta_2 > tmax | theta_2 < tmin

   error('Shoulder rotation illegal.');

end



% ==================  PITCH JOINT 4 =========================

theta_4 = t234 - theta_3 - theta_2;

% check joint limits

tmax = pi; tmin = 0;

if theta_4 > tmax | theta_4 < tmin

   error('Pitch rotation illegal.');

end



% ==================  ROLL JOINT 5  ============================

theta_5 = atan2(s1*nx - c1*ny, s1*ox - c1*oy);



% no problem with joint limits since these are +/- 180 degrees



% assign the joint values to output vector.



q(1) = theta_1;

q(2) = theta_2;

q(3) = theta_3;

q(4) = theta_4;

q(5) = theta_5;





