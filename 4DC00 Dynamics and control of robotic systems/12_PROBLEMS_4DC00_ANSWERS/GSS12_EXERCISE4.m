% GSS DAY 12
%
% 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven

close all; clear all

syms g
syms a3
syms th1 d2 th3
syms thd1 d2d thd3
syms thdd1 d2dd thdd3
syms lc1 lc2 lc3
syms m1 m2 m3
syms Ixx_1 Iyy_1 Izz_1
syms Ixx_2 Iyy_2 Izz_2
syms Ixx_3 Iyy_3 Izz_3
pi = sym(pi);

% Generate translation vectors between two successive coordinate frames 
% Generate rotation matrices between two successive coordinate frames 
% Generate homogenous transformations matrices between two successive coordinate frames 

a    = [0; 0; a3]
d    = [0; d2; 0]
alf  = [0.5*pi; 0.5*pi; 0]
th   = [th1; pi; th3]

dd   = [0; d2d; 0]
ddd  = [0; d2dd; 0]

thd  = [thd1; 0; thd3]
thdd = [thdd1; 0; thdd3]

% joint type - 0 revolute, 1 prismatic 
sigma= [0; 1; 0]; 

q   =[]; % Vector of generalized coordinates
qd  =[]; % Vector of generalized velocities
qdd =[]; % Vector of generalized accelerations

for ii=1:length(a),
    if sigma(ii)==0, % revolute
        q   = [q;   th(ii)];
        qd  = [qd;  thd(ii)];
        qdd = [qdd; thdd(ii)];
    else             % prismatic     
        q   = [q;   d(ii)];
        qd  = [qd;  dd(ii)];
        qdd = [qdd; ddd(ii)];
    end
end

zero1x3=[0 0 0]

x=[]; R=[]; A=[];
for ii=1:length(a),
    x{ii}=[a(ii)*cos(th(ii)); a(ii)*sin(th(ii)); d(ii)];
    
    R{ii}=[cos(th(ii)), -cos(alf(ii))*sin(th(ii)),  sin(alf(ii))*sin(th(ii))
           sin(th(ii)),  cos(alf(ii))*cos(th(ii)), -sin(alf(ii))*cos(th(ii))
                     0,              sin(alf(ii)),              cos(alf(ii))];
                
    A{ii}=[        R{ii},  x{ii}
                 zero1x3,     1];
end


% Inspect the homogenous transformation matrices 
% representing the coordinates of the origin and 
% the relative rotation matrix of the frame i 
% with respect to the frames i-1

for ii=1:length(a),
    disp(['A_',num2str(ii),' ='])
    disp(A{ii})
end

% Generate the matrices of homogenous transformations representing
% the positions x^0_i and orientations R^0_i of the link 
% coordinate frames oixiyizi (i=1,2,...) relative 
% to the coordinate frame o0x0y0z0 of the base

T_0_{1}=A{1};
for ii=2:length(a),
    T_0_{ii} = simplify( T_0_{ii-1} * A{ii} );
end

for ii=1:length(a),
    disp(['T^0_',num2str(ii),'='])
    T_0_{ii}
end

% Create linear velocity Jacobian Jv and angular velocity Jacobian Jomega

o_0_0=[0;0;0];
z_0_0=[0;0;1];

J_v=[]; J_omega=[];

if sigma(1)==0,
    J_v=cross(z_0_0,T_0_{end}(1:3,4)-o_0_0);
    J_omega=z_0_0;
else
    J_v=z_0_0;
    J_omega=0*ones(3,1);
end

for ii=1:length(a)-1,
    if sigma(ii+1)==0,
        J_v=[J_v, cross(T_0_{ii}(1:3,3),T_0_{end}(1:3,4)-T_0_{ii}(1:3,4))];
        J_omega=[J_omega, T_0_{ii}(1:3,3)];
    else
        J_v=[J_v, T_0_{ii}(1:3,3)];
        J_omega=[J_omega, 0*ones(3,1)];
    end    
end

J_v=simplify(J_v)
%J_omega=simplify(J_omega)

J=[J_v; J_omega]

% Coordinates of the i-th link center of mass expressed 
% relative to the i-th coordinate frame

o_c_{1}=[0; 0; lc1];
o_c_{2}=[0; -lc2; 0];
o_c_{3}=[-(a3-lc3); 0; 0];

% Origins o_0_{i} (i=1,...,n) of the link coordinate frames expressed 
% relative to the coordinate frame of the base and coordinates o_0_c_{i} 
% of the i-th link center of mass expressed relative to the 
% coordinate frame of the base

o_0_=[];
o_0_c_=[];

for ii=1:length(a),
    o_0_{ii} = T_0_{ii}(1:3,4) ;
    o_0_c_{ii} = o_0_{ii} + T_0_{ii}(1:3,1:3)*o_c_{ii} ;
end

% Jacobians for the link-fixed frames centered at the centers of mass

for ii=1:length(a),    
  
    Jv_c_{ii}     = sym(0*ones(3,length(a)));
    Jomega_c_{ii} = sym(0*ones(3,length(a)));
    
    if sigma(1)==0,
        Jv_c_{ii}(:,1)    = simplify(cross ( z_0_0, o_0_c_{ii}-o_0_0 ));
        Jomega_c_{ii}(:,1)= z_0_0;
    else
        Jv_c_{ii}(:,1)    = z_0_0;
        Jomega_c_{ii}(:,1)= 0*ones(3,1);
    end
    
    for jj=2:ii,
        if sigma(jj)==0,
            Jv_c_{ii}(:,jj)    = simplify(cross( T_0_{jj-1}(1:3,3), o_0_c_{ii}-o_0_{jj-1} ));
            Jomega_c_{ii}(:,jj)= T_0_{jj-1}(1:3,3);
        else
            Jv_c_{ii}(:,jj)    = T_0_{jj-1}(1:3,3);
            Jomega_c_{ii}(:,jj)= 0*ones(3,1);
        end    
    end    
end

% Link inertial parameters
m=[m1; m2; m3];

I_{1}=[Ixx_1,    0,    0
           0,Iyy_1,    0
           0,    0,Izz_1];

I_{2}=[Ixx_2,    0,    0
           0,Iyy_2,    0
           0,    0,Izz_2];

I_{3}=[Ixx_3,    0,    0
           0,Iyy_3,    0
           0,    0,Izz_3];
   
       
% Elements of the inertia matrix
D_q=0;
for ii=1:length(a),
    D_q=simplify(D_q + m(ii)*transpose(Jv_c_{ii})*Jv_c_{ii} + transpose(Jomega_c_{ii})*T_0_{ii}(1:3,1:3)*I_{ii}*transpose(T_0_{ii}(1:3,1:3))*Jomega_c_{ii});
end

% Christoffel symbols
for kk=1:length(a),
    for ii=1:length(a),
        for jj=1:length(a),
            c_q{ii,jj,kk}=simplify(0.5*( diff(D_q(kk,jj),q(ii)) + diff(D_q(kk,ii),q(jj)) - diff(D_q(ii,jj),q(kk)) ));
        end
    end
end

% Matrix C_q appears in the term representing Coriolis and centripetal effects

C_q=sym(zeros(size(D_q)));

for kk=1:length(a),
    for jj=1:length(a),
        [kk,jj]
        for ii=1:length(a),
            C_q(kk,jj)=C_q(kk,jj)+c_q{ii,jj,kk}*qd(ii);
        end
    end
end

g_vec=[0; g; 0];

% Potential energy
P=0;
for ii=1:length(a),
    P=simplify(P+m(ii)*transpose(g_vec)*o_0_c_{ii});
end

% Elements of the gravity vector
g_q=[];
for ii=1:length(a),
    g_q=[g_q; simplify(diff(P,q(ii)))];
end

% Euler-Lagrange equations
Unf_dyn_no_cs = D_q*qdd + g_q;
display('``Euler-Lagrange equations'' without Christoffel symbols:')
tau_1 = Unf_dyn_no_cs(1)
tau_2 = Unf_dyn_no_cs(2)
tau_3 = Unf_dyn_no_cs(3)

Unf_dyn = D_q*qdd + C_q*qd + g_q;
display('Euler-Lagrange equations with Christoffel symbols:')
tau_1 = Unf_dyn(1)
tau_2 = Unf_dyn(2)
tau_3 = Unf_dyn(3)