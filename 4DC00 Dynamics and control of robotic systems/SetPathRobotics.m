% SetPathRobotics.m

% TIP: Make sure you modify the paths below 
% to point to the right folders in your computer!
% 
% This file should be run everytime you want to use the 
% toolbox. We suggest you do NOT add the Robotic Toolbox’s folders
% to the MATLAB path, as this might generate some conflicts with 
% other toolboxes.

% Remove this line when you have set the variable folder below
%error('** 4DC00 - Change the path to match the correct folder on your laptop **')

% Add directories of the Robotics Toolbox to the path
% [[ Linux/Mac users might need to use "/" in place of "\" ]]
% Substitute "C:\" with the correct path on your machine

folder = pwd;

addpath ( folder )
addpath ( fullfile(folder, 'extrafunctions') ) % GSS 2 objplot
addpath ( fullfile(folder, 'extrafunctions', 'Unina_toolbox' ) ) % GSS 13
addpath ( fullfile(folder, 'rvctools') )

startup_rvc % set the path for the Robotics Toolbox v9.10

disp ('The path for the files used in the couse 4DC00 is set!')


