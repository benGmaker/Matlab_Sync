README.TXT file for use of

MODELING AND CONTROL OF ROBOT MANIPULATORS TOOLBOX

to accompany "Solutions Manual to Modeling and Control of Robot
Manipulators" by L. Sciavicco & B. Siciliano, McGraw-Hill, NY, 1996.
This Toolbox shall re retrieved by instructors only.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Solutions to programming problems are accompanied by results of computer
implementations in MATLAB (version 4.2b) with SIMULINK (version 1.3a).
The Control System Toolbox (version 3.0b) is used.

The M-files of the toolbox are not aimed at providing a complete robot
manipulator modeling and control toolbox, but only at giving the code
written to solve the end-of-chapter problems. Nonetheless, the software
has been developed in a modular fashion which should allow direct
expansion to more complex problems as well as ease of changing the
problems data.

For the problems solved in MATLAB, the solution is contained in an
M-file where the first letter is an "s", followed by the problem number,
e.g., "s5_1.m" is the M-file to execute for solving Problem 5.1.

On the other hand, the problems requiring simulation of dynamic systems
have been solved in SIMULINK, and the main file contains the description
of the SIMULINK system, e.g., "s3_17.m" is the M-file description of the
SIMULINK system for solving Problem 3.17. Each problem of this kind
requires the initialization of certain variables prior to starting
simulation. This is performed in an M-file where the first letter is an
"i", followed by the problem number, e.g., "i6_10.m" is the M-file
containing variables initialization for Problem 6.10.

For both MATLAB- and SIMULINK-based problems, the output plots of
relevant variables are obtained by executing an M-file where the first
letter is a "p", followed by the problem number, e.g., "p7_4.m" is the
M-file for plotting the output variables of Problem 7.4.

Variables initialization and plot can be activated by double clicking
respectively on the upper-left block and the lower-right block in the
SIMULINK block diagram.

If a single problem requires simulation of two different systems, then
two M-files have been created where letters "a" and "b" have been used
to distinguish them, e.g., "s3_18a.m" and "s3_18b.m" are the M-files for
solving Problem 3.18 with two different algorithms; accordingly, the
M-files for plotting output variables have been named "p3_18a.m" and
"p3_18b.m".

The above M-files are supplemented by other function and script M-files
which are needed to solve the programming problems, where a single
M-file may be called by multiple M-files for different problems.

Below is a list of all the M-files in the toolbox:

adap        iner_l      p5_2        p8_3        s6_13
dagcj_p     invjs_a     p5_3        param       s6_14
dj_a        invj_a      p5_5        poly_5      s6_15
d_min       inv_d       p5_6        s3_17       s6_16
i3_17       inv_k2d     p5_7        s3_18a      s7_4
i3_18       inv_k2u     p5_8        s3_18b      s7_5
i6_10       inv_k3u     p5_9        s4_6        s7_6
i6_11       js_a        p6_10       s5_1        s8_2
i6_12       j_a         p6_11       s5_2        s8_3
i6_13       j_adq       p6_12       s5_3        spline_c
i6_14       j_p         p6_13       s5_5        trapez
i6_15       lin_par     p6_14       s5_6        tra_1
i6_16       load_m      p6_15       s5_7        tra_2
i7_4        p3_17       p6_16       s5_8        tra_3
i7_5        p3_18a      p7_4        s5_9        tra_6
i7_6        p3_18b      p7_5        s6_10       tra_7
i8_2        p4_6        p7_6        s6_11       trjs_a
i8_3        p5_1        p8_2        s6_12       trj_a
iner                                

These M-files are User Contributed Routines which are being
redistributed by The MathWorks, upon request, on an "as is" basis. A
User Contributed Routine is not a product of The MathWorks, Inc. and The
MathWorks assumes no responsability for any errors that may exist in
these routines.

If you would like to view this information from within MATLAB, copy the
contents of the diskette into a subdirectory or folder of your MATLAB
directory or folder and make sure that the directory or folder is on
your MATLAB path.  From within MATLAB, "cd" to that directory or folder
and enter "type readme" at the MATLAB prompt.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Should you have any questions, please contact the authors:

Bruno Siciliano & Luigi Villani
Dipartimento di Informatica e Sistemistica
Universita` degli Studi di Napoli Federico II
Via Claudio 21, 80125 Napoli, Italy
E-mail: {siciliano,villani}@disna.dis.unina.it
Fax: +39 81 768-3186
Tel: +39 81 768-3179 x-3635
