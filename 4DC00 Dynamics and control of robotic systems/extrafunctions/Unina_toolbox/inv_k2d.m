function q = inv_k2d(a,x)
%INV_K2D Inverse kinematics for two-link planar arm in elbow-down posture.
%        q = INV_K2D(a,x) returns vector of joint positions, where:
%
%        a is vector of link lengths
%        x is vector of tip coordinates

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

q = [0;0];
r = x'*x;
c2 = 0.5*(r - a(1)^2 - a(2)^2)/(a(1)*a(2));
s2 = sqrt(1 - c2^2);
q(2) = atan2(s2,c2);

k1 = a(1)+a(2)*c2;
k2 = a(2)*s2;

q(1) = atan2(x'*[-k2;k1]/r, x'*[k1;k2]/r);
