clearvars;clc;close all
load check_setup_parameters.mat
syms t1;
s = tf('s');

open_system('CNC_Simulink', 'loadonly')

set_param('CNC_Simulink/Subsystem/Reference  generator/Fcn', 'Expression', '0')
set_param('CNC_Simulink/Subsystem/s', 'Expression', '0')
set_param('CNC_Simulink/Subsystem/ds', 'Expression', '0')
set_param('CNC_Simulink/Subsystem/dds', 'Expression', '0')
set_param('CNC_Simulink/Subsystem/Force', 'Expression', '0')

sim('CNC_Simulink');
clearvars
disp("Your version of Matlab is ready for the CNC challenge.")