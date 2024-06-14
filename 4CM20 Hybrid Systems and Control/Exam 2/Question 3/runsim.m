clear; clc;

% sim_prob = 0; % disturbance rejection
sim_prob = 1; % overshoot

if sim_prob == 1
    init_cond = [-1;0];
    stopTime = 0.5;
    amp_d = 0;
    Tsample = 1e-4;
else
    init_cond = [0;0];
    stopTime = 5;
    amp_d = 1;
    Tsample = 1e-4;
end

%% mass
Ap = [0, 1;0, 0];
Bp = [0;1];
Cp = eye(2);
Dp = [0;0];

%% PID
kp = 1e5;
kd = 1e2;
ki = 5e6;
high_gain = 2;

%% run
out= sim("massPID_variableGain.mdl");

%% plot
figure;
plot(out.PID); hold on;
plot(out.SwitchedPID);
legend({'PID','Switched PID'})