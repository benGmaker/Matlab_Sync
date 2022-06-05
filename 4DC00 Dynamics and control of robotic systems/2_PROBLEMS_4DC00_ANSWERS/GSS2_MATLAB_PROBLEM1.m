% GSS 2
% Exercises for the course 4DC00 Dynamics and Control of Robotic Systems
% TU/e Eindhoven University of Technology

% The Robotics Toolbox (v9.10) and extra functions distributed via CANVAS
% must be already installed in your computer.
%
% Make sure also that you have already run the script  
% 
%   SetPathRobotics
% 
% contained in the main directory.
%
% Last modified: 1 May 2017

clc; close all; clear all

%**************************************************************************
% (a)  
disp('a')
%**************************************************************************

%***********************
% Define prism geometry

% Vertices (in homogeneous representation, one vertex per column)

P=[0  0  0  3  3  3 
   0  0  2  2  0  0 
   0  1  0  0  1  0  
   1  1  1  1  1  1]

Number_vertices = 6

% Edges

Edge_array=[1 2
            2 3
            3 1
            1 6
            2 5
            3 4
            4 5
            5 6
            6 4]

Number_of_edges = 9

% Plot the object in the original position

objplot(P,Edge_array,Number_vertices,Number_of_edges); 

% change the view point 

view(130,30)

disp('Prism in the original pose')
pause

%*************************************
% Transform 1 w.r.t xyz OF THE WORLD

T1=trotx(pi/2)

P1=T1*P

objplot(P1,Edge_array,Number_vertices,Number_of_edges,'m'); view(130,30)

disp('Prism rotated about the world''s x axis of 90 deg')
pause

%*************************************
% Transform 2 w.r.t. xyz OF THE WORLD

T2=transl(-2,0,0)

P2=T2*P1

objplot(P2,Edge_array,Number_vertices,Number_of_edges,'c'); view(130,30)

disp('Prism translated about the world''s x axis of -2 units (e.g., meters)')
pause

%*************************************
% Transform 3 w.r.t. xyz OF THE WORLD

T3=trotz(pi/2)

P3=T3*P2

objplot(P3,Edge_array,Number_vertices,Number_of_edges,'b'); view(130,30)

disp('Prism rotated about the world''s z axis of 90 deg')
pause

%**************************************************************************
% (b)  
disp('b')
%**************************************************************************

%****************************************
% Transforms 1-3 w.r.t. xyz 

T=trotz(pi/2)*transl(-2,0,0)*trotx(pi/2)

P3_oneshot = T*P

objplot(P3_oneshot,Edge_array,Number_vertices,Number_of_edges,'--k'); view(130,30)

P3_oneshot - P3

disp('Confirmation that multiplication is equivalent to composition')
pause

%**************************************************************************
% (c)   
disp('c')
%**************************************************************************

%***************
% Close figure

close all;

%***********************************
% Object in the original position

objplot(P,Edge_array,Number_vertices,Number_of_edges,'k'); view(130,30)

disp('Prism in the original pose')
pause


%*************************************
% Transform 3 w.r.t. xyz OF THE PRISM!

% rotation of pi/2 about the prisms z axis

P3_bodyFixed = trotz(pi/2)*P

objplot(P3_bodyFixed,Edge_array,Number_vertices,Number_of_edges,'c'); view(130,30)

disp('Prism rotated about the prism''s z-axis of 90 deg')
pause


%*************************************
% Transform 2 w.r.t. xyz OF THE PRISM!

% Translation of -2 about the prism's x axis

P2_bodyFixed = trotz(pi/2)*transl(-2,0,0)*P

objplot(P2_bodyFixed,Edge_array,Number_vertices,Number_of_edges,'m'); view(130,30)


disp('Prism translated about the prism''s x-axis of -2 units')
pause

%*************************************
% Transform 1 w.r.t. xyz OF THE PRISM!

% Rotation of pi/2 about the prisms x axis

P1_bodyFixed = trotz(pi/2) * transl(-2,0,0) * trotx(pi/2) * P

objplot(P1_bodyFixed, Edge_array, Number_vertices,Number_of_edges,'b'); view(130,30)

disp('Prism rotation about the prism''s x-axis of 90 deg')
pause


%**************************************************************************
% (d)  
disp('d')
%**************************************************************************

%***************
% Close figure

close all;

%***********************************
% Object in the original position

objplot(P,Edge_array,Number_vertices,Number_of_edges); view(130,30)

%******************
% Specify vector

vec=[1, -1, 0]/sqrt(2) % vector's magnitude MUST be one

plot3([0 5*vec(1)],[0 5*vec(2)],[0 5*vec(3)],'--c') % rotation axis visualization

Tvec=angvec2tr(90*pi/180, vec)

Pvec=Tvec*P

objplot(Pvec,Edge_array,Number_vertices,Number_of_edges,'b'); view(130,30)

disp('Rotation about the unit vector [1 -1 0]/sqrt(2) of 90 deg')