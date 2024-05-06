function Robotarm_Install()
%% Robotarm_Install()
% Installs the robotarm simulink library, RTScope and adds neccesary files
% to the MATLAB path
% 
% Control Systems Technology group
% Departement of Mechanical Engineering
% Eindhoven University of Technology
% 

% Get the current dir
current_dir = pwd;
mfilepath = mfilename('fullpath');
[lib_install_dir,~,~]  = fileparts(mfilepath);
% Change to the install script folder
cd(lib_install_dir)

% Opening the progress bar
wb = waitbar(0,'Adding files to path');
% Add the camera
addpath(genpath('./camera'));
% Add the calibration
addpath(genpath('./tooling/calibration'));
% Add Simulink library
addpath('./tooling/Simulink_Lib');

% Installing RTScope
waitbar(1/3,wb,'Installing RTScope');
cd('./tooling')
addpath(genpath('./RTScope/RTScope_engine'));
addpath(genpath('./RTScope/RTScope_UI'));

% Saving the path to make it permanent
savepath;

% Installing Simulink library
waitbar(2/3,wb,'Installing Simulink library');
cd('./Simulink_Lib')
slblocks;

waitbar(3/3,wb,'Installation completed.');
try close(wb); catch, end

% Go back to previous folder
cd(current_dir)
disp('Robotarm installation completed.');
end
