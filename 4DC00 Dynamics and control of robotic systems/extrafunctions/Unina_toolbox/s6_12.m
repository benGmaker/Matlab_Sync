function [ret,x0,str,ts,xts]=s6_12(t,x,u,flag);
%S6_12	is the M-file description of the SIMULINK system named S6_12.
%	The block-diagram can be displayed by typing: S6_12.
%
%	SYS=S6_12(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes S6_12 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling S6_12 with a FLAG of zero:
%	[SIZES]=S6_12([],[],[],0),  returns a vector, SIZES, which
%	contains the sizes of the state vector and other parameters.
%		SIZES(1) number of states
%		SIZES(2) number of discrete states
%		SIZES(3) number of outputs
%		SIZES(4) number of inputs
%		SIZES(5) number of roots (currently unsupported)
%		SIZES(6) direct feedthrough flag
%		SIZES(7) number of sample times
%
%	For the definition of other parameters in SIZES, see SFUNC.
%	See also, TRIM, LINMOD, LINSIM, EULER, RK23, RK45, ADAMS, GEAR.

% Note: This M-file is only used for saving graphical information;
%       after the model is loaded into memory an internal model
%       representation is used.

% the system will take on the name of this mfile:
sys = mfilename;
new_system(sys)
simver(1.3)
if (0 == (nargin + nargout))
     set_param(sys,'Location',[6,42,555,350])
     open_system(sys)
end;
set_param(sys,'algorithm',     'RK-23')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     't_d')
set_param(sys,'Min step size', 'Tc/10')
set_param(sys,'Max step size', 'Tc')
set_param(sys,'Relative error','1e-8')
set_param(sys,'Return vars',   '')


%     Subsystem  ['nonlinear',13,'compensation'].

new_system([sys,'/',['nonlinear',13,'compensation']])
set_param([sys,'/',['nonlinear',13,'compensation']],'Location',[17,260,403,446])

add_block('built-in/Outport',[sys,'/',['nonlinear',13,'compensation/y2']])
set_param([sys,'/',['nonlinear',13,'compensation/y2']],...
		'orientation',2,...
		'position',[10,90,30,110])

add_block('built-in/Discrete State-Space',[sys,'/',['nonlinear',13,'compensation/Discrete State-Space3']])
set_param([sys,'/',['nonlinear',13,'compensation/Discrete State-Space3']],...
		'orientation',2,...
		'hide name',0,...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','eye(2,2)',...
		'X0','0',...
		'Sample time','Tc')
set_param([sys,'/',['nonlinear',13,'compensation/Discrete State-Space3']],...
		'Mask Display','Sampler',...
		'position',[250,134,300,166])

add_block('built-in/State-Space',[sys,'/',['nonlinear',13,'compensation/viscous friction']])
set_param([sys,'/',['nonlinear',13,'compensation/viscous friction']],...
		'orientation',2,...
		'move name',0,...
		'A','[]',...
		'B','[]',...
		'C','[]',...
		'D','K',...
		'Mask Display','F_v',...
		'Mask Type','Matrix Gain')
set_param([sys,'/',['nonlinear',13,'compensation/viscous friction']],...
		'Mask Dialogue','Matrix Gain.|Gain matrix:',...
		'Mask Translate','K = @1;',...
		'Mask Help','Multiplies input vector by entered matrix to produce output vector (y=Au).')
set_param([sys,'/',['nonlinear',13,'compensation/viscous friction']],...
		'Mask Entries','F_v\/',...
		'position',[155,134,190,166])


%     Subsystem  ['nonlinear',13,'compensation/gravity'].

new_system([sys,'/',['nonlinear',13,'compensation/gravity']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity']],'Location',[72,102,517,215])

add_block('built-in/Mux',[sys,'/',['nonlinear',13,'compensation/gravity/Mux']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Mux']],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[50,21,80,99])

add_block('built-in/Fcn',[sys,'/',['nonlinear',13,'compensation/gravity/Fcn1']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Fcn1']],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,70,250,90])

add_block('built-in/Sum',[sys,'/',['nonlinear',13,'compensation/gravity/Sum2']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Sum2']],...
		'orientation',2,...
		'hide name',0,...
		'position',[275,69,290,91])

add_block('built-in/Demux',[sys,'/',['nonlinear',13,'compensation/gravity/Demux']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Demux']],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[340,12,380,108])

add_block('built-in/Gain',[sys,'/',['nonlinear',13,'compensation/gravity/Gain']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Gain']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_m(3)',...
		'Mask Display','k_2',...
		'position',[160,63,185,97])

add_block('built-in/Fcn',[sys,'/',['nonlinear',13,'compensation/gravity/Fcn2']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Fcn2']],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,25,250,45])

add_block('built-in/Gain',[sys,'/',['nonlinear',13,'compensation/gravity/Gain1']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Gain1']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_m(1)',...
		'Mask Display','k_1',...
		'position',[160,18,185,52])

add_block('built-in/Sum',[sys,'/',['nonlinear',13,'compensation/gravity/Sum5']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/Sum5']],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,29,120,51])

add_block('built-in/Outport',[sys,'/',['nonlinear',13,'compensation/gravity/g']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/g']],...
		'orientation',2,...
		'position',[5,50,25,70])

add_block('built-in/Inport',[sys,'/',['nonlinear',13,'compensation/gravity/q']])
set_param([sys,'/',['nonlinear',13,'compensation/gravity/q']],...
		'orientation',2,...
		'position',[410,50,430,70])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[405,60;385,60])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[335,85;295,85])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[270,80;255,80])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[205,80;190,80])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[205,35;190,35])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[335,35;255,35])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[315,35;315,75;295,75])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[155,35;125,35])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[100,40;85,40])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[155,80;85,80])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[155,80;150,80;150,45;125,45])
add_line([sys,'/',['nonlinear',13,'compensation/gravity']],[45,60;30,60])
set_param([sys,'/',['nonlinear',13,'compensation/gravity']],...
		'Mask Display','g(q)')


%     Finished composite block ['nonlinear',13,'compensation/gravity'].

set_param([sys,'/',['nonlinear',13,'compensation/gravity']],...
		'orientation',2,...
		'move name',0,...
		'position',[155,23,190,57])

add_block('built-in/Sum',[sys,'/',['nonlinear',13,'compensation/Sum4']])
set_param([sys,'/',['nonlinear',13,'compensation/Sum4']],...
		'orientation',2,...
		'hide name',0,...
		'inputs','+++',...
		'position',[60,77,80,123])


%     Subsystem  ['nonlinear',13,'compensation/Coriolis + centrifugal'].

new_system([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],'Location',[63,129,588,299])

add_block('built-in/Demux',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Demux2']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Demux2']],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[380,79,420,141])

add_block('built-in/Product',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product4']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product4']],...
		'orientation',2,...
		'hide name',0,...
		'position',[285,110,320,130])

add_block('built-in/Outport',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Cq']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Cq']],...
		'orientation',2,...
		'position',[5,105,25,125])

add_block('built-in/Gain',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain2']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain2']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-1',...
		'position',[150,28,175,52])

add_block('built-in/Gain',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain1']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain1']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','2',...
		'position',[150,88,175,112])

add_block('built-in/Product',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product6']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product6']],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,30,230,50])

add_block('built-in/Product',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/prdiuct 1']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/prdiuct 1']],...
		'orientation',2,...
		'hide name',0,...
		'move name',0,...
		'position',[285,25,320,45])

add_block('built-in/Product',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product5']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product5']],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,135,230,155])

add_block('built-in/Product',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product7']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Product7']],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,90,230,110])

add_block('built-in/Sum',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Sum']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Sum']],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,95,125,115])

add_block('built-in/Mux',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Mux']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Mux']],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[40,97,70,128])

add_block('built-in/Fcn',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Fcn1']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Fcn1']],...
		'orientation',2,...
		'hide name',0,...
		'Expr','sin(u(2))',...
		'position',[410,44,460,66])

add_block('built-in/Gain',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/Gain']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-a(1)*pi_m(3)',...
		'Mask Display','k_3',...
		'position',[370,43,395,67])

add_block('built-in/Inport',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/q']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/q']],...
		'orientation',2,...
		'position',[495,45,515,65])

add_block('built-in/Inport',[sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/dq']])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal/dq']],...
		'orientation',2,...
		'Port','2',...
		'position',[495,100,515,120])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[280,120;270,120;270,140;235,140])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[270,120;270,105;235,105])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[375,95;335,95;325,40])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[335,95;270,95;270,45;235,45])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[270,95;235,95])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[405,55;400,55])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[365,55;355,55;355,30;325,30])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[355,55;355,115;325,115])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[280,35;235,35])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[375,125;325,125])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[190,100;180,100])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[145,100;130,100])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[190,145;150,145;150,110;130,110])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[100,105;75,105])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[35,115;30,115])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[190,40;180,40])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[145,40;95,40;95,120;75,120])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[490,55;465,55])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[490,110;425,110])
add_line([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],[355,125;355,150;235,150])
set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],...
		'Mask Display','C(q,dq)dq')


%     Finished composite block ['nonlinear',13,'compensation/Coriolis + centrifugal'].

set_param([sys,'/',['nonlinear',13,'compensation/Coriolis + centrifugal']],...
		'orientation',2,...
		'move name',0,...
		'position',[135,80,190,115])

add_block('built-in/Discrete State-Space',[sys,'/',['nonlinear',13,'compensation/Discrete State-Space2']])
set_param([sys,'/',['nonlinear',13,'compensation/Discrete State-Space2']],...
		'orientation',2,...
		'hide name',0,...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','eye(2,2)',...
		'X0','0',...
		'Sample time','Tc')
set_param([sys,'/',['nonlinear',13,'compensation/Discrete State-Space2']],...
		'Mask Display','Sampler',...
		'position',[245,24,295,56])

add_block('built-in/Inport',[sys,'/',['nonlinear',13,'compensation/q']])
set_param([sys,'/',['nonlinear',13,'compensation/q']],...
		'orientation',2,...
		'Port','2',...
		'position',[330,30,350,50])

add_block('built-in/Inport',[sys,'/',['nonlinear',13,'compensation/dq']])
set_param([sys,'/',['nonlinear',13,'compensation/dq']],...
		'orientation',2,...
		'position',[330,140,350,160])
add_line([sys,'/',['nonlinear',13,'compensation']],[240,40;195,40])
add_line([sys,'/',['nonlinear',13,'compensation']],[245,150;195,150])
add_line([sys,'/',['nonlinear',13,'compensation']],[225,40;225,90;195,90])
add_line([sys,'/',['nonlinear',13,'compensation']],[225,150;225,105;195,105])
add_line([sys,'/',['nonlinear',13,'compensation']],[150,40;110,40;110,85;85,85])
add_line([sys,'/',['nonlinear',13,'compensation']],[55,100;35,100])
add_line([sys,'/',['nonlinear',13,'compensation']],[150,150;110,150;110,115;85,115])
add_line([sys,'/',['nonlinear',13,'compensation']],[325,40;300,40])
add_line([sys,'/',['nonlinear',13,'compensation']],[325,150;305,150])
add_line([sys,'/',['nonlinear',13,'compensation']],[130,100;85,100])
set_param([sys,'/',['nonlinear',13,'compensation']],...
		'Mask Display','n(q,dq)')


%     Finished composite block ['nonlinear',13,'compensation'].

set_param([sys,'/',['nonlinear',13,'compensation']],...
		'orientation',2,...
		'move name',0,...
		'Font Name','Arial',...
		'position',[360,192,410,228])

add_block('built-in/To Workspace',[sys,'/','To Workspace4'])
set_param([sys,'/','To Workspace4'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','time',...
		'buffer','[5001,1,Ts]',...
		'position',[485,5,535,25])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'hide name',0,...
		'Font Name','Arial',...
		'position',[435,5,455,25])

add_block('built-in/To Workspace',[sys,'/','To Workspace3'])
set_param([sys,'/','To Workspace3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','e',...
		'buffer','[5001,1,Ts]',...
		'position',[155,210,205,230])


%     Subsystem  'inertia'.

new_system([sys,'/','inertia'])
set_param([sys,'/','inertia'],'Location',[126,311,463,402])

add_block('built-in/MATLAB Fcn',[sys,'/',['inertia/invB',13,'']])
set_param([sys,'/',['inertia/invB',13,'']],...
		'hide name',0,...
		'MATLAB Fcn','iner(u(3))*u(1:2)',...
		'Output Width','2',...
		'Mask Display','B(q)',...
		'position',[230,30,280,60])

add_block('built-in/Discrete State-Space',[sys,'/','inertia/Discrete State-Space3'])
set_param([sys,'/','inertia/Discrete State-Space3'],...
		'hide name',0,...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','eye(2,2)',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','Sampler',...
		'position',[45,10,95,40])

add_block('built-in/Discrete State-Space',[sys,'/','inertia/Discrete State-Space2'])
set_param([sys,'/','inertia/Discrete State-Space2'],...
		'hide name',0,...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','eye(2,2)',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','Sampler',...
		'position',[45,50,95,80])

add_block('built-in/Outport',[sys,'/','inertia/y1'])
set_param([sys,'/','inertia/y1'],...
		'position',[305,35,325,55])

add_block('built-in/Fcn',[sys,'/','inertia/Fcn'])
set_param([sys,'/','inertia/Fcn'],...
		'hide name',0,...
		'Expr','cos(u(2))',...
		'position',[115,54,165,76])

add_block('built-in/Mux',[sys,'/','inertia/Mux'])
set_param([sys,'/','inertia/Mux'],...
		'hide name',0,...
		'inputs','[2,1]',...
		'position',[185,7,210,83])

add_block('built-in/Inport',[sys,'/','inertia/q'])
set_param([sys,'/','inertia/q'],...
		'Port','2',...
		'position',[5,55,25,75])

add_block('built-in/Inport',[sys,'/','inertia/u'])
set_param([sys,'/','inertia/u'],...
		'position',[5,15,25,35])
add_line([sys,'/','inertia'],[170,65;180,65])
add_line([sys,'/','inertia'],[285,45;300,45])
add_line([sys,'/','inertia'],[215,45;225,45])
add_line([sys,'/','inertia'],[30,65;40,65])
add_line([sys,'/','inertia'],[100,65;110,65])
add_line([sys,'/','inertia'],[30,25;40,25])
add_line([sys,'/','inertia'],[100,25;180,25])
set_param([sys,'/','inertia'],...
		'Mask Display','B(q)u')


%     Finished composite block 'inertia'.

set_param([sys,'/','inertia'],...
		'move name',0,...
		'Font Name','Arial',...
		'position',[230,112,280,148])

add_block('built-in/Sum',[sys,'/','Sum2'])
set_param([sys,'/','Sum2'],...
		'hide name',0,...
		'Font Name','Arial',...
		'position',[305,121,320,154])


%     Subsystem  'arm'.

new_system([sys,'/','arm'])
set_param([sys,'/','arm'],'Location',[5,203,394,460])

add_block('built-in/Inport',[sys,'/','arm/tau'])
set_param([sys,'/','arm/tau'],...
		'position',[10,140,30,160])

add_block('built-in/Sum',[sys,'/','arm/Sum'])
set_param([sys,'/','arm/Sum'],...
		'hide name',0,...
		'inputs','--+-',...
		'position',[85,109,105,176])

add_block('built-in/Outport',[sys,'/','arm/dq'])
set_param([sys,'/','arm/dq'],...
		'position',[355,105,375,125])


%     Subsystem  'arm/resolved acc'.

new_system([sys,'/','arm/resolved acc'])
set_param([sys,'/','arm/resolved acc'],'Location',[137,197,432,294])

add_block('built-in/Inport',[sys,'/',['arm/resolved acc/tau-tau''']])
set_param([sys,'/',['arm/resolved acc/tau-tau''']],...
		'position',[10,20,30,40])

add_block('built-in/Inport',[sys,'/','arm/resolved acc/q'])
set_param([sys,'/','arm/resolved acc/q'],...
		'Port','2',...
		'position',[10,60,30,80])

add_block('built-in/Outport',[sys,'/','arm/resolved acc/ddq'])
set_param([sys,'/','arm/resolved acc/ddq'],...
		'position',[260,40,280,60])

add_block('built-in/MATLAB Fcn',[sys,'/',['arm/resolved acc/invB',13,'']])
set_param([sys,'/',['arm/resolved acc/invB',13,'']],...
		'hide name',0,...
		'MATLAB Fcn','inv(iner_l(u(3)))*u(1:2)',...
		'Output Width','2',...
		'Mask Display','inv(B(q))',...
		'position',[185,38,240,62])

add_block('built-in/Mux',[sys,'/','arm/resolved acc/Mux'])
set_param([sys,'/','arm/resolved acc/Mux'],...
		'hide name',0,...
		'inputs','[2,1]',...
		'position',[140,12,165,88])

add_block('built-in/Fcn',[sys,'/','arm/resolved acc/Fcn'])
set_param([sys,'/','arm/resolved acc/Fcn'],...
		'hide name',0,...
		'Expr','cos(u(2))',...
		'position',[50,59,105,81])
add_line([sys,'/','arm/resolved acc'],[170,50;180,50])
add_line([sys,'/','arm/resolved acc'],[35,30;135,30])
add_line([sys,'/','arm/resolved acc'],[245,50;255,50])
add_line([sys,'/','arm/resolved acc'],[35,70;45,70])
add_line([sys,'/','arm/resolved acc'],[110,70;135,70])
set_param([sys,'/','arm/resolved acc'],...
		'Mask Display','inv(B(q))')


%     Finished composite block 'arm/resolved acc'.

set_param([sys,'/','arm/resolved acc'],...
		'move name',0,...
		'position',[130,135,185,175])

add_block('built-in/Outport',[sys,'/',['arm/q',13,'']])
set_param([sys,'/',['arm/q',13,'']],...
		'Port','2',...
		'position',[355,145,375,165])

add_block('built-in/Integrator',[sys,'/','arm/Integrator1'])
set_param([sys,'/','arm/Integrator1'],...
		'hide name',0,...
		'Initial','q_i',...
		'position',[265,140,290,170])

add_block('built-in/Integrator',[sys,'/','arm/Integrator'])
set_param([sys,'/','arm/Integrator'],...
		'hide name',0,...
		'Initial','[0 0]',...
		'position',[205,140,230,170])

add_block('built-in/State-Space',[sys,'/','arm/friction'])
set_param([sys,'/','arm/friction'],...
		'orientation',2,...
		'move name',0,...
		'A','[]',...
		'B','[]',...
		'C','[]',...
		'D','K',...
		'Mask Display','F_v',...
		'Mask Type','Matrix Gain',...
		'Mask Dialogue','Matrix Gain.|Gain matrix:')
set_param([sys,'/','arm/friction'],...
		'Mask Translate','K = @1;',...
		'Mask Help','Multiplies input vector by entered matrix to produce output vector (y=Au).',...
		'Mask Entries','F_v\/',...
		'position',[140,79,175,111])


%     Subsystem  'arm/gravity'.

new_system([sys,'/','arm/gravity'])
set_param([sys,'/','arm/gravity'],'Location',[45,250,482,363])

add_block('built-in/Outport',[sys,'/','arm/gravity/g'])
set_param([sys,'/','arm/gravity/g'],...
		'orientation',2,...
		'position',[5,50,25,70])

add_block('built-in/Sum',[sys,'/','arm/gravity/Sum5'])
set_param([sys,'/','arm/gravity/Sum5'],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,29,120,51])

add_block('built-in/Gain',[sys,'/','arm/gravity/Gain1'])
set_param([sys,'/','arm/gravity/Gain1'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_l(1)',...
		'Mask Display','k_1',...
		'position',[160,18,185,52])

add_block('built-in/Fcn',[sys,'/','arm/gravity/Fcn2'])
set_param([sys,'/','arm/gravity/Fcn2'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,25,250,45])

add_block('built-in/Gain',[sys,'/','arm/gravity/Gain'])
set_param([sys,'/','arm/gravity/Gain'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_l(3)',...
		'Mask Display','k_2',...
		'position',[160,63,185,97])

add_block('built-in/Demux',[sys,'/','arm/gravity/Demux'])
set_param([sys,'/','arm/gravity/Demux'],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[340,12,380,108])

add_block('built-in/Sum',[sys,'/','arm/gravity/Sum2'])
set_param([sys,'/','arm/gravity/Sum2'],...
		'orientation',2,...
		'hide name',0,...
		'position',[270,70,290,90])

add_block('built-in/Fcn',[sys,'/','arm/gravity/Fcn1'])
set_param([sys,'/','arm/gravity/Fcn1'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,70,250,90])

add_block('built-in/Mux',[sys,'/','arm/gravity/Mux'])
set_param([sys,'/','arm/gravity/Mux'],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[50,21,80,99])

add_block('built-in/Inport',[sys,'/','arm/gravity/q'])
set_param([sys,'/','arm/gravity/q'],...
		'orientation',2,...
		'position',[415,50,435,70])
add_line([sys,'/','arm/gravity'],[45,60;30,60])
add_line([sys,'/','arm/gravity'],[155,80;85,80])
add_line([sys,'/','arm/gravity'],[155,80;150,80;150,45;125,45])
add_line([sys,'/','arm/gravity'],[100,40;85,40])
add_line([sys,'/','arm/gravity'],[155,35;125,35])
add_line([sys,'/','arm/gravity'],[335,35;255,35])
add_line([sys,'/','arm/gravity'],[315,35;315,75;295,75])
add_line([sys,'/','arm/gravity'],[205,35;190,35])
add_line([sys,'/','arm/gravity'],[205,80;190,80])
add_line([sys,'/','arm/gravity'],[265,80;255,80])
add_line([sys,'/','arm/gravity'],[335,85;295,85])
add_line([sys,'/','arm/gravity'],[410,60;385,60])
set_param([sys,'/','arm/gravity'],...
		'Mask Display','g(q)')


%     Finished composite block 'arm/gravity'.

set_param([sys,'/','arm/gravity'],...
		'orientation',2,...
		'move name',0,...
		'position',[140,218,175,252])


%     Subsystem  'arm/Coriolis + centrifugal'.

new_system([sys,'/','arm/Coriolis + centrifugal'])
set_param([sys,'/','arm/Coriolis + centrifugal'],'Location',[8,287,559,457])

add_block('built-in/Demux',[sys,'/','arm/Coriolis + centrifugal/Demux2'])
set_param([sys,'/','arm/Coriolis + centrifugal/Demux2'],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[440,74,480,136])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product4'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product4'],...
		'orientation',2,...
		'hide name',0,...
		'position',[285,105,320,125])

add_block('built-in/Fcn',[sys,'/','arm/Coriolis + centrifugal/Fcn1'])
set_param([sys,'/','arm/Coriolis + centrifugal/Fcn1'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','sin(u(2))',...
		'position',[430,39,480,61])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-a(1)*pi_l(3)',...
		'Mask Display','k_3',...
		'position',[380,38,405,62])

add_block('built-in/Outport',[sys,'/','arm/Coriolis + centrifugal/Cdq'])
set_param([sys,'/','arm/Coriolis + centrifugal/Cdq'],...
		'orientation',2,...
		'position',[5,100,25,120])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain2'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain2'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-1',...
		'position',[150,23,175,47])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain1'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain1'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','2',...
		'position',[150,83,175,107])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product6'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product6'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,25,230,45])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/prdiuct 1'])
set_param([sys,'/','arm/Coriolis + centrifugal/prdiuct 1'],...
		'orientation',2,...
		'hide name',0,...
		'move name',0,...
		'position',[285,20,320,40])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product5'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product5'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,130,230,150])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product7'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product7'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,85,230,105])

add_block('built-in/Sum',[sys,'/','arm/Coriolis + centrifugal/Sum'])
set_param([sys,'/','arm/Coriolis + centrifugal/Sum'],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,90,125,110])

add_block('built-in/Mux',[sys,'/','arm/Coriolis + centrifugal/Mux'])
set_param([sys,'/','arm/Coriolis + centrifugal/Mux'],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[40,92,70,123])

add_block('built-in/Inport',[sys,'/','arm/Coriolis + centrifugal/q'])
set_param([sys,'/','arm/Coriolis + centrifugal/q'],...
		'orientation',2,...
		'position',[525,40,545,60])

add_block('built-in/Inport',[sys,'/','arm/Coriolis + centrifugal/dq'])
set_param([sys,'/','arm/Coriolis + centrifugal/dq'],...
		'orientation',2,...
		'Port','2',...
		'position',[525,95,545,115])
add_line([sys,'/','arm/Coriolis + centrifugal'],[280,115;270,115;270,135;235,135])
add_line([sys,'/','arm/Coriolis + centrifugal'],[270,115;270,100;235,100])
add_line([sys,'/','arm/Coriolis + centrifugal'],[435,90;335,90;325,35])
add_line([sys,'/','arm/Coriolis + centrifugal'],[335,90;270,90;270,40;235,40])
add_line([sys,'/','arm/Coriolis + centrifugal'],[270,90;235,90])
add_line([sys,'/','arm/Coriolis + centrifugal'],[520,50;485,50])
add_line([sys,'/','arm/Coriolis + centrifugal'],[425,50;410,50])
add_line([sys,'/','arm/Coriolis + centrifugal'],[375,50;355,50;355,25;325,25])
add_line([sys,'/','arm/Coriolis + centrifugal'],[355,50;355,110;325,110])
add_line([sys,'/','arm/Coriolis + centrifugal'],[280,30;235,30])
add_line([sys,'/','arm/Coriolis + centrifugal'],[435,120;325,120])
add_line([sys,'/','arm/Coriolis + centrifugal'],[355,120;355,145;235,145])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,95;180,95])
add_line([sys,'/','arm/Coriolis + centrifugal'],[145,95;130,95])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,140;150,140;150,105;130,105])
add_line([sys,'/','arm/Coriolis + centrifugal'],[100,100;75,100])
add_line([sys,'/','arm/Coriolis + centrifugal'],[35,110;30,110])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,35;180,35])
add_line([sys,'/','arm/Coriolis + centrifugal'],[145,35;95,35;95,115;75,115])
add_line([sys,'/','arm/Coriolis + centrifugal'],[520,105;485,105])
set_param([sys,'/','arm/Coriolis + centrifugal'],...
		'Mask Display','C(q,dq)dq')


%     Finished composite block 'arm/Coriolis + centrifugal'.

set_param([sys,'/','arm/Coriolis + centrifugal'],...
		'orientation',2,...
		'move name',0,...
		'position',[130,20,185,55])
add_line([sys,'/','arm'],[295,155;310,155;310,200;115,200;125,165])
add_line([sys,'/','arm'],[310,155;350,155])
add_line([sys,'/','arm'],[235,155;243,155;243,95;180,95])
add_line([sys,'/','arm'],[243,95;243,45;190,45])
add_line([sys,'/','arm'],[243,115;350,115])
add_line([sys,'/','arm'],[135,235;65,235;65,165;80,165])
add_line([sys,'/','arm'],[135,95;65,95;65,120;80,120])
add_line([sys,'/','arm'],[310,200;310,235;180,235])
add_line([sys,'/','arm'],[110,145;125,145])
add_line([sys,'/','arm'],[235,155;260,155])
add_line([sys,'/','arm'],[190,155;200,155])
add_line([sys,'/','arm'],[35,150;80,150])
add_line([sys,'/','arm'],[310,155;310,30;190,30])
add_line([sys,'/','arm'],[125,40;50,40;50,135;80,135])
set_param([sys,'/','arm'],...
		'Mask Display','inv(B(q))(tau-tau'')')


%     Finished composite block 'arm'.

set_param([sys,'/','arm'],...
		'move name',0,...
		'Font Name','Arial',...
		'position',[340,121,435,159])

add_block('built-in/To Workspace',[sys,'/','To Workspace6'])
set_param([sys,'/','To Workspace6'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','q',...
		'buffer','[5001,1,Ts]',...
		'position',[485,140,535,160])


%     Subsystem  'Subsystem8'.

new_system([sys,'/','Subsystem8'])
set_param([sys,'/','Subsystem8'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem8/start'])
set_param([sys,'/','Subsystem8/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem8'],...
		'Mask Display','plot',...
		'Mask Dialogue','eval(''p6_12;'')')


%     Finished composite block 'Subsystem8'.

set_param([sys,'/','Subsystem8'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[465,270,535,301])

add_block('built-in/From Workspace',[sys,'/',['From',13,'Workspace']])
set_param([sys,'/',['From',13,'Workspace']],...
		'hide name',0,...
		'Font Name','Arial',...
		'matl_expr','[T,q_d]',...
		'position',[5,153,55,177])

add_block('built-in/From Workspace',[sys,'/',['From',13,'Workspace2']])
set_param([sys,'/',['From',13,'Workspace2']],...
		'hide name',0,...
		'Font Name','Arial',...
		'matl_expr','[T,ddq_d]',...
		'position',[5,83,55,107])

add_block('built-in/From Workspace',[sys,'/',['From',13,'Workspace3']])
set_param([sys,'/',['From',13,'Workspace3']],...
		'hide name',0,...
		'Font Name','Arial',...
		'matl_expr','[T,dq_d]',...
		'position',[5,118,55,142])

add_block('built-in/Sum',[sys,'/','Sum3'])
set_param([sys,'/','Sum3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','+++',...
		'position',[185,83,205,157])

add_block('built-in/Discrete State-Space',[sys,'/','Discrete State-Space'])
set_param([sys,'/','Discrete State-Space'],...
		'hide name',0,...
		'Font Name','Arial',...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','K_d',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','K_d')
set_param([sys,'/','Discrete State-Space'],...
		'position',[130,104,160,136])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','-+',...
		'position',[95,100,110,140])

add_block('built-in/Discrete State-Space',[sys,'/','Discrete State-Space5'])
set_param([sys,'/','Discrete State-Space5'],...
		'hide name',0,...
		'Font Name','Arial',...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','K_p',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','K_p')
set_param([sys,'/','Discrete State-Space5'],...
		'position',[130,159,160,191])

add_block('built-in/Sum',[sys,'/','Sum4'])
set_param([sys,'/','Sum4'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','+-',...
		'position',[95,155,110,195])


%     Subsystem  'Subsystem4'.

new_system([sys,'/','Subsystem4'])
set_param([sys,'/','Subsystem4'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem4/start'])
set_param([sys,'/','Subsystem4/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem4'],...
		'Mask Display','compensated\nload mass',...
		'Mask Dialogue','eval(''clear all;c=1;i6_12;pi_l=pi_m;'')')


%     Finished composite block 'Subsystem4'.

set_param([sys,'/','Subsystem4'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[120,5,215,41])


%     Subsystem  'Subsystem5'.

new_system([sys,'/','Subsystem5'])
set_param([sys,'/','Subsystem5'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem5/start'])
set_param([sys,'/','Subsystem5/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem5'],...
		'Mask Display','noncompensated\nload mass',...
		'Mask Dialogue','eval(''clear all;c=0;i6_12;'')')


%     Finished composite block 'Subsystem5'.

set_param([sys,'/','Subsystem5'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[5,5,100,41])

add_block('built-in/Note',[sys,'/','dq'])
set_param([sys,'/','dq'],...
		'Font Name','Arial',...
		'position',[440,104,445,111])
add_line(sys,[460,15;480,15])
add_line(sys,[325,140;335,140])
add_line(sys,[210,120;225,120])
add_line(sys,[165,120;180,120])
add_line(sys,[115,120;125,120])
add_line(sys,[115,175;125,175])
add_line(sys,[440,150;480,150])
add_line(sys,[60,95;180,95])
add_line(sys,[355,210;290,210;300,145])
add_line(sys,[285,130;300,130])
add_line(sys,[440,130;450,130;450,200;415,200])
add_line(sys,[465,150;465,220;415,220])
add_line(sys,[60,130;90,130])
add_line(sys,[60,165;90,165])
add_line(sys,[115,175;115,220;150,220])
add_line(sys,[450,130;450,60;70,60;70,110;90,110])
add_line(sys,[465,220;465,250;70,250;70,185;90,185])
add_line(sys,[165,175;170,175;180,145])
add_line(sys,[215,250;225,140])

drawnow

% Return any arguments.
if (nargin | nargout)
	% Must use feval here to access system in memory
	if (nargin > 3)
		if (flag == 0)
			eval(['[ret,x0,str,ts,xts]=',sys,'(t,x,u,flag);'])
		else
			eval(['ret =', sys,'(t,x,u,flag);'])
		end
	else
		[ret,x0,str,ts,xts] = feval(sys);
	end
else
	drawnow % Flash up the model and execute load callback
end
