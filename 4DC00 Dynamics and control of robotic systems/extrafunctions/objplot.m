% Routine to plot wireframe view of object defined using
% vertex and edge arrays.
%
% USAGE:  OBJPLOT(vert, edge, nvert, nedge, s)
%
%
%      vert = object vertex array  [4 x nvert]
%      edge = object edge connectivity [nedge x 2]
%     nvert = number of vertices
%     nedge = number of edges
%
%         s = optional string containing line information
%
%             (eg. colour)
%
%

% In the generated view, the world axes are colour coded as follows:

%      X = RED 
%      Y = GREEN
%      Z = BLUE
%
% In addition, a small circle is plotted at the positive end of each axis.
%
%
%
% The view angles can be changed with the view() command
%
% CREATED
% unknown
%
% MODIFIED 
% AS 12 DEC 2016


function objplot(vert,edge,nvert,nedge,s)

% select yellow if colour not specified in s

if nargin<5 

   s = 'k';  % BLACK is the standard line color, if not otherwise set

end

% set some plotting limits

  as = 5; % axis scaling

  axis([-as as -as as -as as])

  axis('equal')


% Plot some axis lines centered at the origin

% x axis

  plot3([-as as], [0 0], [0 0],'r') % RED

  axis equal

  axis off

  hold on

  plot3(as,0,0,'ro')

  xlabel('X')

  ylabel('Y')

  zlabel('Z')

%y axis

  plot3([0 0],[-as as], [0 0],'g') % GREEN

  plot3(0,as,0,'go')

%z axis

  plot3([0 0],[0 0], [-as as],'b') % BLUE

  plot3(0,0,as,'bo')


for ie=1:nedge

  v1 = edge(ie,1);

  v2 = edge(ie,2);

  x = [vert(1,v1) vert(1,v2)];

  y = [vert(2,v1) vert(2,v2)];

  z = [vert(3,v1) vert(3,v2)];

  plot3(x,y,z,s)

end


% set view to first quadrant (default for uinew.m)

view(30,30)





