function Ja = J_a(u)
%J_A    Jacobian of two-link planar arm.
%       Ja = J_A(u) returns 2-by-2 analytical Jacobian, where:
%
%       u=[a(1)*c_1;a(2)*c_12;a(1)*s_1;a(2)*s_12]

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

Ja = eye(2);
Ja(:,2) = [-u(4); u(2)];
Ja(:,1) = [-u(3); u(1)] + Ja(:,2);
