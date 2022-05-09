function [ret,x0,str,ts,xts]=s6_10(t,x,u,flag);
%S6_10	is the M-file description of the SIMULINK system named S6_10.
%	The block-diagram can be displayed by typing: S6_10.
%
%	SYS=S6_10(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes S6_10 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling S6_10 with a FLAG of zero:
%	[SIZES]=S6_10([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[5,43,486,341])
     open_system(sys)
end;
set_param(sys,'algorithm',     'RK-23')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     't_d')
set_param(sys,'Min step size', 'Tc/10')
set_param(sys,'Max step size', 'Tc')
set_param(sys,'Relative error','1e-8')
set_param(sys,'Return vars',   '')


%     Subsystem  'Subsystem2'.

new_system([sys,'/','Subsystem2'])
set_param([sys,'/','Subsystem2'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem2/start'])
set_param([sys,'/','Subsystem2/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem2'],...
		'Mask Display','q_d=[pi/4 -pi/2]',...
		'Mask Dialogue','eval(''clear all;c=0;i6_10;'')')


%     Finished composite block 'Subsystem2'.

set_param([sys,'/','Subsystem2'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[5,5,85,31])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'hide name',0,...
		'Font Name','Arial',...
		'position',[350,5,370,25])

add_block('built-in/To Workspace',[sys,'/','To Workspace4'])
set_param([sys,'/','To Workspace4'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','time',...
		'buffer','[4001,1,Ts]',...
		'position',[410,5,460,25])


%     Subsystem  'Subsystem3'.

new_system([sys,'/','Subsystem3'])
set_param([sys,'/','Subsystem3'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem3/start'])
set_param([sys,'/','Subsystem3/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem3'],...
		'Mask Display','q_d=[-pi -3pi/4]',...
		'Mask Dialogue','eval(''clear all;c=1;i6_10;'')')


%     Finished composite block 'Subsystem3'.

set_param([sys,'/','Subsystem3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[105,5,185,31])

add_block('built-in/Discrete State-Space',[sys,'/','Discrete State-Space1'])
set_param([sys,'/','Discrete State-Space1'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','K_d',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','K_d')
set_param([sys,'/','Discrete State-Space1'],...
		'position',[230,51,260,79])

add_block('built-in/Note',[sys,'/','dq'])
set_param([sys,'/','dq'],...
		'Font Name','Arial',...
		'position',[360,100,365,105])


%     Subsystem  ['gravity',13,'compensation'].

new_system([sys,'/',['gravity',13,'compensation']])
set_param([sys,'/',['gravity',13,'compensation']],'Location',[65,69,557,182])

add_block('built-in/Outport',[sys,'/',['gravity',13,'compensation/g']])
set_param([sys,'/',['gravity',13,'compensation/g']],...
		'orientation',2,...
		'position',[5,50,25,70])

add_block('built-in/Sum',[sys,'/',['gravity',13,'compensation/Sum5']])
set_param([sys,'/',['gravity',13,'compensation/Sum5']],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,29,120,51])

add_block('built-in/Gain',[sys,'/',['gravity',13,'compensation/Gain1']])
set_param([sys,'/',['gravity',13,'compensation/Gain1']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_m(1)',...
		'Mask Display','k_1',...
		'position',[160,18,185,52])

add_block('built-in/Fcn',[sys,'/',['gravity',13,'compensation/Fcn2']])
set_param([sys,'/',['gravity',13,'compensation/Fcn2']],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,25,250,45])

add_block('built-in/Gain',[sys,'/',['gravity',13,'compensation/Gain']])
set_param([sys,'/',['gravity',13,'compensation/Gain']],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_m(3)',...
		'Mask Display','k_2',...
		'position',[160,63,185,97])

add_block('built-in/Discrete State-Space',[sys,'/',['gravity',13,'compensation/Discrete State-Space2']])
set_param([sys,'/',['gravity',13,'compensation/Discrete State-Space2']],...
		'orientation',2,...
		'hide name',0,...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','eye(2,2)',...
		'X0','0',...
		'Sample time','Tc')
set_param([sys,'/',['gravity',13,'compensation/Discrete State-Space2']],...
		'Mask Display','Sampler',...
		'position',[400,44,450,76])

add_block('built-in/Demux',[sys,'/',['gravity',13,'compensation/Demux']])
set_param([sys,'/',['gravity',13,'compensation/Demux']],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[340,12,380,108])

add_block('built-in/Sum',[sys,'/',['gravity',13,'compensation/Sum2']])
set_param([sys,'/',['gravity',13,'compensation/Sum2']],...
		'orientation',2,...
		'hide name',0,...
		'position',[275,69,290,91])

add_block('built-in/Fcn',[sys,'/',['gravity',13,'compensation/Fcn1']])
set_param([sys,'/',['gravity',13,'compensation/Fcn1']],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,70,250,90])

add_block('built-in/Mux',[sys,'/',['gravity',13,'compensation/Mux']])
set_param([sys,'/',['gravity',13,'compensation/Mux']],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[50,21,80,99])

add_block('built-in/Inport',[sys,'/',['gravity',13,'compensation/q']])
set_param([sys,'/',['gravity',13,'compensation/q']],...
		'orientation',2,...
		'position',[465,50,485,70])
add_line([sys,'/',['gravity',13,'compensation']],[45,60;30,60])
add_line([sys,'/',['gravity',13,'compensation']],[155,80;150,80;150,45;125,45])
add_line([sys,'/',['gravity',13,'compensation']],[155,80;85,80])
add_line([sys,'/',['gravity',13,'compensation']],[100,40;85,40])
add_line([sys,'/',['gravity',13,'compensation']],[155,35;125,35])
add_line([sys,'/',['gravity',13,'compensation']],[335,35;255,35])
add_line([sys,'/',['gravity',13,'compensation']],[315,35;315,75;295,75])
add_line([sys,'/',['gravity',13,'compensation']],[205,35;190,35])
add_line([sys,'/',['gravity',13,'compensation']],[205,80;190,80])
add_line([sys,'/',['gravity',13,'compensation']],[270,80;255,80])
add_line([sys,'/',['gravity',13,'compensation']],[335,85;295,85])
add_line([sys,'/',['gravity',13,'compensation']],[395,60;385,60])
add_line([sys,'/',['gravity',13,'compensation']],[460,60;455,60])
set_param([sys,'/',['gravity',13,'compensation']],...
		'Mask Display','g(q)')


%     Finished composite block ['gravity',13,'compensation'].

set_param([sys,'/',['gravity',13,'compensation']],...
		'orientation',2,...
		'move name',0,...
		'Font Name','Arial',...
		'position',[230,188,260,222])


%     Subsystem  'arm'.

new_system([sys,'/','arm'])
set_param([sys,'/','arm'],'Location',[184,203,573,460])


%     Subsystem  'arm/Coriolis + centrifugal'.

new_system([sys,'/','arm/Coriolis + centrifugal'])
set_param([sys,'/','arm/Coriolis + centrifugal'],'Location',[34,46,585,216])

add_block('built-in/Inport',[sys,'/','arm/Coriolis + centrifugal/dq'])
set_param([sys,'/','arm/Coriolis + centrifugal/dq'],...
		'orientation',2,...
		'Port','2',...
		'position',[525,95,545,115])

add_block('built-in/Inport',[sys,'/','arm/Coriolis + centrifugal/q'])
set_param([sys,'/','arm/Coriolis + centrifugal/q'],...
		'orientation',2,...
		'position',[525,40,545,60])

add_block('built-in/Mux',[sys,'/','arm/Coriolis + centrifugal/Mux'])
set_param([sys,'/','arm/Coriolis + centrifugal/Mux'],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[40,92,70,123])

add_block('built-in/Sum',[sys,'/','arm/Coriolis + centrifugal/Sum'])
set_param([sys,'/','arm/Coriolis + centrifugal/Sum'],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,90,125,110])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product7'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product7'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,85,230,105])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product5'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product5'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,130,230,150])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/prdiuct 1'])
set_param([sys,'/','arm/Coriolis + centrifugal/prdiuct 1'],...
		'orientation',2,...
		'hide name',0,...
		'move name',0,...
		'position',[285,20,320,40])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product6'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product6'],...
		'orientation',2,...
		'hide name',0,...
		'position',[195,25,230,45])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain1'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain1'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','2',...
		'position',[150,83,175,107])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain2'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain2'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-1',...
		'position',[150,23,175,47])

add_block('built-in/Outport',[sys,'/','arm/Coriolis + centrifugal/Cdq'])
set_param([sys,'/','arm/Coriolis + centrifugal/Cdq'],...
		'orientation',2,...
		'position',[5,100,25,120])

add_block('built-in/Gain',[sys,'/','arm/Coriolis + centrifugal/Gain'])
set_param([sys,'/','arm/Coriolis + centrifugal/Gain'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','-a(1)*pi_l(3)',...
		'Mask Display','k_3',...
		'position',[380,38,405,62])

add_block('built-in/Fcn',[sys,'/','arm/Coriolis + centrifugal/Fcn1'])
set_param([sys,'/','arm/Coriolis + centrifugal/Fcn1'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','sin(u(2))',...
		'position',[430,39,480,61])

add_block('built-in/Product',[sys,'/','arm/Coriolis + centrifugal/Product4'])
set_param([sys,'/','arm/Coriolis + centrifugal/Product4'],...
		'orientation',2,...
		'hide name',0,...
		'position',[285,105,320,125])

add_block('built-in/Demux',[sys,'/','arm/Coriolis + centrifugal/Demux2'])
set_param([sys,'/','arm/Coriolis + centrifugal/Demux2'],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[440,74,480,136])
add_line([sys,'/','arm/Coriolis + centrifugal'],[520,105;485,105])
add_line([sys,'/','arm/Coriolis + centrifugal'],[145,35;95,35;95,115;75,115])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,35;180,35])
add_line([sys,'/','arm/Coriolis + centrifugal'],[35,110;30,110])
add_line([sys,'/','arm/Coriolis + centrifugal'],[100,100;75,100])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,140;150,140;150,105;130,105])
add_line([sys,'/','arm/Coriolis + centrifugal'],[145,95;130,95])
add_line([sys,'/','arm/Coriolis + centrifugal'],[190,95;180,95])
add_line([sys,'/','arm/Coriolis + centrifugal'],[280,115;270,115;270,135;235,135])
add_line([sys,'/','arm/Coriolis + centrifugal'],[435,90;335,90;325,35])
add_line([sys,'/','arm/Coriolis + centrifugal'],[335,90;270,90;270,40;235,40])
add_line([sys,'/','arm/Coriolis + centrifugal'],[435,120;325,120])
add_line([sys,'/','arm/Coriolis + centrifugal'],[355,120;355,145;235,145])
add_line([sys,'/','arm/Coriolis + centrifugal'],[280,30;235,30])
add_line([sys,'/','arm/Coriolis + centrifugal'],[375,50;355,50;355,25;325,25])
add_line([sys,'/','arm/Coriolis + centrifugal'],[355,50;355,110;325,110])
add_line([sys,'/','arm/Coriolis + centrifugal'],[425,50;410,50])
add_line([sys,'/','arm/Coriolis + centrifugal'],[520,50;485,50])
add_line([sys,'/','arm/Coriolis + centrifugal'],[270,90;235,90])
add_line([sys,'/','arm/Coriolis + centrifugal'],[270,115;270,100;235,100])
set_param([sys,'/','arm/Coriolis + centrifugal'],...
		'Mask Display','C(q,dq)dq')


%     Finished composite block 'arm/Coriolis + centrifugal'.

set_param([sys,'/','arm/Coriolis + centrifugal'],...
		'orientation',2,...
		'move name',0,...
		'position',[130,20,185,55])


%     Subsystem  'arm/gravity'.

new_system([sys,'/','arm/gravity'])
set_param([sys,'/','arm/gravity'],'Location',[45,250,482,363])

add_block('built-in/Inport',[sys,'/','arm/gravity/q'])
set_param([sys,'/','arm/gravity/q'],...
		'orientation',2,...
		'position',[415,50,435,70])

add_block('built-in/Mux',[sys,'/','arm/gravity/Mux'])
set_param([sys,'/','arm/gravity/Mux'],...
		'orientation',2,...
		'hide name',0,...
		'inputs','2',...
		'position',[50,21,80,99])

add_block('built-in/Fcn',[sys,'/','arm/gravity/Fcn1'])
set_param([sys,'/','arm/gravity/Fcn1'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,70,250,90])

add_block('built-in/Sum',[sys,'/','arm/gravity/Sum2'])
set_param([sys,'/','arm/gravity/Sum2'],...
		'orientation',2,...
		'hide name',0,...
		'position',[270,70,290,90])

add_block('built-in/Demux',[sys,'/','arm/gravity/Demux'])
set_param([sys,'/','arm/gravity/Demux'],...
		'orientation',2,...
		'hide name',0,...
		'outputs','2',...
		'position',[340,12,380,108])

add_block('built-in/Gain',[sys,'/','arm/gravity/Gain'])
set_param([sys,'/','arm/gravity/Gain'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_l(3)',...
		'Mask Display','k_2',...
		'position',[160,63,185,97])

add_block('built-in/Fcn',[sys,'/','arm/gravity/Fcn2'])
set_param([sys,'/','arm/gravity/Fcn2'],...
		'orientation',2,...
		'hide name',0,...
		'Expr','cos(u)',...
		'position',[210,25,250,45])

add_block('built-in/Gain',[sys,'/','arm/gravity/Gain1'])
set_param([sys,'/','arm/gravity/Gain1'],...
		'orientation',2,...
		'hide name',0,...
		'Gain','g*pi_l(1)',...
		'Mask Display','k_1',...
		'position',[160,18,185,52])

add_block('built-in/Sum',[sys,'/','arm/gravity/Sum5'])
set_param([sys,'/','arm/gravity/Sum5'],...
		'orientation',2,...
		'hide name',0,...
		'position',[105,29,120,51])

add_block('built-in/Outport',[sys,'/','arm/gravity/g'])
set_param([sys,'/','arm/gravity/g'],...
		'orientation',2,...
		'position',[5,50,25,70])
add_line([sys,'/','arm/gravity'],[410,60;385,60])
add_line([sys,'/','arm/gravity'],[335,85;295,85])
add_line([sys,'/','arm/gravity'],[265,80;255,80])
add_line([sys,'/','arm/gravity'],[205,80;190,80])
add_line([sys,'/','arm/gravity'],[205,35;190,35])
add_line([sys,'/','arm/gravity'],[335,35;255,35])
add_line([sys,'/','arm/gravity'],[315,35;315,75;295,75])
add_line([sys,'/','arm/gravity'],[155,35;125,35])
add_line([sys,'/','arm/gravity'],[100,40;85,40])
add_line([sys,'/','arm/gravity'],[155,80;150,80;150,45;125,45])
add_line([sys,'/','arm/gravity'],[155,80;85,80])
add_line([sys,'/','arm/gravity'],[45,60;30,60])
set_param([sys,'/','arm/gravity'],...
		'Mask Display','g(q)')


%     Finished composite block 'arm/gravity'.

set_param([sys,'/','arm/gravity'],...
		'orientation',2,...
		'move name',0,...
		'position',[140,218,175,252])

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

add_block('built-in/Integrator',[sys,'/','arm/Integrator'])
set_param([sys,'/','arm/Integrator'],...
		'hide name',0,...
		'Initial','[0 0]',...
		'position',[205,140,230,170])

add_block('built-in/Integrator',[sys,'/','arm/Integrator1'])
set_param([sys,'/','arm/Integrator1'],...
		'hide name',0,...
		'Initial','q_i',...
		'position',[265,140,290,170])

add_block('built-in/Outport',[sys,'/',['arm/q',13,'']])
set_param([sys,'/',['arm/q',13,'']],...
		'Port','2',...
		'position',[355,145,375,165])


%     Subsystem  'arm/resolved acc'.

new_system([sys,'/','arm/resolved acc'])
set_param([sys,'/','arm/resolved acc'],'Location',[144,206,434,303])

add_block('built-in/Fcn',[sys,'/','arm/resolved acc/Fcn'])
set_param([sys,'/','arm/resolved acc/Fcn'],...
		'hide name',0,...
		'Expr','cos(u(2))',...
		'position',[50,59,105,81])

add_block('built-in/Mux',[sys,'/','arm/resolved acc/Mux'])
set_param([sys,'/','arm/resolved acc/Mux'],...
		'hide name',0,...
		'inputs','[2,1]',...
		'position',[140,12,165,88])

add_block('built-in/MATLAB Fcn',[sys,'/',['arm/resolved acc/invB',13,'']])
set_param([sys,'/',['arm/resolved acc/invB',13,'']],...
		'hide name',0,...
		'MATLAB Fcn','inv(iner_l(u(3)))*u(1:2)',...
		'Output Width','2',...
		'Mask Display','inv(B(q))',...
		'position',[185,38,240,62])

add_block('built-in/Outport',[sys,'/','arm/resolved acc/ddq'])
set_param([sys,'/','arm/resolved acc/ddq'],...
		'position',[260,40,280,60])

add_block('built-in/Inport',[sys,'/','arm/resolved acc/q'])
set_param([sys,'/','arm/resolved acc/q'],...
		'Port','2',...
		'position',[10,60,30,80])

add_block('built-in/Inport',[sys,'/',['arm/resolved acc/tau-tau''']])
set_param([sys,'/',['arm/resolved acc/tau-tau''']],...
		'position',[10,20,30,40])
add_line([sys,'/','arm/resolved acc'],[110,70;135,70])
add_line([sys,'/','arm/resolved acc'],[35,70;45,70])
add_line([sys,'/','arm/resolved acc'],[245,50;255,50])
add_line([sys,'/','arm/resolved acc'],[35,30;135,30])
add_line([sys,'/','arm/resolved acc'],[170,50;180,50])
set_param([sys,'/','arm/resolved acc'],...
		'Mask Display','inv(B(q))u')


%     Finished composite block 'arm/resolved acc'.

set_param([sys,'/','arm/resolved acc'],...
		'move name',0,...
		'position',[130,135,185,175])

add_block('built-in/Outport',[sys,'/','arm/dq'])
set_param([sys,'/','arm/dq'],...
		'position',[355,105,375,125])

add_block('built-in/Sum',[sys,'/','arm/Sum'])
set_param([sys,'/','arm/Sum'],...
		'hide name',0,...
		'inputs','--+-',...
		'position',[85,109,105,176])

add_block('built-in/Inport',[sys,'/','arm/tau'])
set_param([sys,'/','arm/tau'],...
		'position',[10,140,30,160])
add_line([sys,'/','arm'],[125,40;50,40;50,135;80,135])
add_line([sys,'/','arm'],[35,150;80,150])
add_line([sys,'/','arm'],[295,155;310,155;310,200;115,200;125,165])
add_line([sys,'/','arm'],[310,155;310,30;190,30])
add_line([sys,'/','arm'],[235,155;243,155;243,95;180,95])
add_line([sys,'/','arm'],[190,155;200,155])
add_line([sys,'/','arm'],[235,155;260,155])
add_line([sys,'/','arm'],[110,145;125,145])
add_line([sys,'/','arm'],[310,200;310,235;180,235])
add_line([sys,'/','arm'],[135,95;65,95;65,120;80,120])
add_line([sys,'/','arm'],[135,235;65,235;65,165;80,165])
add_line([sys,'/','arm'],[243,115;350,115])
add_line([sys,'/','arm'],[243,95;243,45;190,45])
add_line([sys,'/','arm'],[310,155;350,155])
set_param([sys,'/','arm'],...
		'Mask Display','inv(B(q))(tau-tau'')')


%     Finished composite block 'arm'.

set_param([sys,'/','arm'],...
		'move name',0,...
		'Font Name','Arial',...
		'position',[255,111,350,149])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','+-',...
		'position',[80,110,95,150])

add_block('built-in/To Workspace',[sys,'/','To Workspace5'])
set_param([sys,'/','To Workspace5'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','q',...
		'buffer','[4001,1,Ts]',...
		'position',[410,130,460,150])

add_block('built-in/Constant',[sys,'/','Constant'])
set_param([sys,'/','Constant'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Value','q_d',...
		'position',[5,107,30,133])

add_block('built-in/Sum',[sys,'/','Sum'])
set_param([sys,'/','Sum'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','-++',...
		'position',[210,106,230,154])

add_block('built-in/Discrete State-Space',[sys,'/','Discrete State-Space3'])
set_param([sys,'/','Discrete State-Space3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'A','0',...
		'B','0',...
		'C','zeros(2,1)',...
		'D','K_p',...
		'X0','0',...
		'Sample time','Tc',...
		'Mask Display','K_p')
set_param([sys,'/','Discrete State-Space3'],...
		'position',[130,116,160,144])


%     Subsystem  'Subsystem8'.

new_system([sys,'/','Subsystem8'])
set_param([sys,'/','Subsystem8'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem8/start'])
set_param([sys,'/','Subsystem8/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem8'],...
		'Mask Display','plot',...
		'Mask Dialogue','eval(''p6_10;'')')


%     Finished composite block 'Subsystem8'.

set_param([sys,'/','Subsystem8'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[390,255,460,286])
add_line(sys,[235,130;250,130])
add_line(sys,[355,120;370,120;370,65;265,65])
add_line(sys,[225,65;175,65;175,115;205,115])
add_line(sys,[100,130;125,130])
add_line(sys,[375,15;405,15])
add_line(sys,[165,130;205,130])
add_line(sys,[225,205;175,205;175,145;205,145])
add_line(sys,[35,120;75,120])
add_line(sys,[355,140;405,140])
add_line(sys,[370,140;370,205;265,205])
add_line(sys,[370,205;370,240;55,240;55,140;75,140])

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
