%TRA_7  Generation of trajectory #7.

% B. Siciliano & L. Villani
% DIS, Univ. of Naples, Italy, 7-23-95

% time base vector
  T = (0:Tc:t_d)';

% segment length
  D_s = norm(p_f - p_i);

% trapezoidal velocity profile trajectory for path coordinate from 0 to 1
  ds_c = 0.5;                % maximum velocity
  t_f  = 1;                  % final time
  [T_1,s,ds,dds,err] = trapez(0,1,ds_c/D_s,t_f,Tc);

  n = size(T,1);
  m = size(T_1,1);
  p_d = zeros(n,2);
  dp_d = p_d;
  ddp_d = p_d;

% transformation to constraint frame
  p_ci = Rc*p_i;
  p_cf = Rc*p_f;

% tip trajectory
  p_d(1:m,:) = ones(m,1)*p_ci' + s*(p_cf - p_ci)';
  p_d(m+1:n,:) = ones(n-m,1)*p_cf';
  dp_d(1:m,:) = ds*(p_cf - p_ci)';
  ddp_d(1:m,:) = dds*(p_cf - p_ci)';
