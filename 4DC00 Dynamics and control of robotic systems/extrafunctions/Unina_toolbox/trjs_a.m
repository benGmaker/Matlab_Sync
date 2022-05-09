function dq = trJs_a(w)
%TRJS_A Joint velocity with Jacobian transpose for SCARA manipulator.
%       dq = TRJS_A(w) returns vector of joint velocities as:
%
%       dq = Js_a(w(5:8))'*w(1:4)
%
%       where:
%
%       w(3:6)=[a(1)*c_1;a(2)*c_12;a(1)*s_1;a(2)*s_12]

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

dq = Js_a(w(5:8))'*w(1:4);
