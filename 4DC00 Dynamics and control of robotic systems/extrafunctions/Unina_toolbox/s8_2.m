function [ret,x0,str,ts,xts]=s8_2(t,x,u,flag);
%S8_2	is the M-file description of the SIMULINK system named S8_2.
%	The block-diagram can be displayed by typing: S8_2.
%
%	SYS=S8_2(T,X,U,FLAG) returns depending on FLAG certain
%	system values given time point, T, current state vector, X,
%	and input vector, U.
%	FLAG is used to indicate the type of output to be returned in SYS.
%
%	Setting FLAG=1 causes S8_2 to return state derivatives, FLAG=2
%	discrete states, FLAG=3 system outputs and FLAG=4 next sample
%	time. For more information and other options see SFUNC.
%
%	Calling S8_2 with a FLAG of zero:
%	[SIZES]=S8_2([],[],[],0),  returns a vector, SIZES, which
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
     set_param(sys,'Location',[8,77,556,369])
     open_system(sys)
end;
set_param(sys,'algorithm',     'Linear')
set_param(sys,'Start time',    '0.0')
set_param(sys,'Stop time',     't_d')
set_param(sys,'Min step size', 'Tc')
set_param(sys,'Max step size', 'Tc')
set_param(sys,'Relative error','1e-8')
set_param(sys,'Return vars',   '')


%     Subsystem  'Subsystem4'.

new_system([sys,'/','Subsystem4'])
set_param([sys,'/','Subsystem4'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem4/start'])
set_param([sys,'/','Subsystem4/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem4'],...
		'Mask Display','variables\ninitialization',...
		'Mask Dialogue','eval(''clear all;i8_2;'')')


%     Finished composite block 'Subsystem4'.

set_param([sys,'/','Subsystem4'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[5,5,100,51])

add_block('built-in/Gain',[sys,'/','Gain7'])
set_param([sys,'/','Gain7'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Gain','C_i',...
		'Mask Display','C_i',...
		'position',[50,107,90,143])

add_block('built-in/Step Fcn',[sys,'/',['V''_c']])
set_param([sys,'/',['V''_c']],...
		'Font Name','Arial',...
		'Time','0.0001',...
		'position',[5,115,25,135])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn'])
set_param([sys,'/','Transfer Fcn'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Numerator','[G_v]',...
		'Denominator','[T_v 1]',...
		'position',[115,107,160,143])

add_block('built-in/Gain',[sys,'/','Gain5'])
set_param([sys,'/','Gain5'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Gain','k_v',...
		'Mask Display','k_v',...
		'position',[315,215,345,245])

add_block('built-in/Sum',[sys,'/','Sum1'])
set_param([sys,'/','Sum1'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','+--',...
		'position',[200,118,215,162])

add_block('built-in/Gain',[sys,'/','Gain3'])
set_param([sys,'/','Gain3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Gain','k_t',...
		'Mask Display','k_t',...
		'position',[315,125,345,155])

add_block('built-in/Sum',[sys,'/','Sum2'])
set_param([sys,'/','Sum2'],...
		'hide name',0,...
		'Font Name','Arial',...
		'inputs','+-',...
		'position',[370,132,385,168])

add_block('built-in/To Workspace',[sys,'/','To Workspace3'])
set_param([sys,'/','To Workspace3'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','curr',...
		'buffer','[5001,1,Ts]',...
		'position',[370,58,420,82])

add_block('built-in/To Workspace',[sys,'/','To Workspace2'])
set_param([sys,'/','To Workspace2'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','omega',...
		'buffer','[5001,1,Ts]',...
		'Mask Display','',...
		'position',[490,138,540,162])

add_block('built-in/Gain',[sys,'/','Gain4'])
set_param([sys,'/','Gain4'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Gain','F_m',...
		'Mask Display','F_m',...
		'position',[410,180,440,210])


%     Subsystem  'Subsystem8'.

new_system([sys,'/','Subsystem8'])
set_param([sys,'/','Subsystem8'],'Location',[355,393414,500,393509])

add_block('built-in/Note',[sys,'/','Subsystem8/start'])
set_param([sys,'/','Subsystem8/start'],...
		'position',[55,45,60,50])
set_param([sys,'/','Subsystem8'],...
		'Mask Display','plot',...
		'Mask Dialogue','eval(''p8_2;'')')


%     Finished composite block 'Subsystem8'.

set_param([sys,'/','Subsystem8'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Drop Shadow',4,...
		'position',[470,255,540,286])

add_block('built-in/Clock',[sys,'/','Clock'])
set_param([sys,'/','Clock'],...
		'hide name',0,...
		'Font Name','Arial',...
		'position',[420,10,440,30])

add_block('built-in/To Workspace',[sys,'/','To Workspace1'])
set_param([sys,'/','To Workspace1'],...
		'hide name',0,...
		'Font Name','Arial',...
		'mat-name','time',...
		'buffer','[5001,1,Ts]',...
		'position',[490,8,540,32])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn1'])
set_param([sys,'/','Transfer Fcn1'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Denominator','[L_a 0]',...
		'Mask Display','',...
		'position',[235,122,275,158])

add_block('built-in/Transfer Fcn',[sys,'/','Transfer Fcn2'])
set_param([sys,'/','Transfer Fcn2'],...
		'hide name',0,...
		'Font Name','Arial',...
		'Denominator','[I_m 0]',...
		'Mask Display','',...
		'position',[405,132,445,168])

add_block('built-in/Gain',[sys,'/','Gain1'])
set_param([sys,'/','Gain1'],...
		'orientation',2,...
		'hide name',0,...
		'Font Name','Arial',...
		'Gain','R_a',...
		'Mask Display','R_a',...
		'position',[240,170,270,200])
add_line(sys,[95,125;110,125])
add_line(sys,[165,125;195,125])
add_line(sys,[220,140;230,140])
add_line(sys,[280,140;310,140])
add_line(sys,[350,140;365,140])
add_line(sys,[390,150;400,150])
add_line(sys,[405,195;355,195;365,160])
add_line(sys,[280,140;295,140;295,185;275,185])
add_line(sys,[235,185;180,185;180,155;195,155])
add_line(sys,[310,230;170,230;170,140;195,140])
add_line(sys,[445,20;485,20])
add_line(sys,[450,150;465,150;465,195;445,195])
add_line(sys,[295,140;295,70;365,70])
add_line(sys,[30,125;45,125])
add_line(sys,[465,150;485,150])
add_line(sys,[465,195;465,230;350,230])

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
