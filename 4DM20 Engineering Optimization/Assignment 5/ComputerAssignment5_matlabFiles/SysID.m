%% Load Data

load('DynSysData.mat')

u = out.simout.Data(:,1); % Input data
y = out.simout.Data(:,2); % Output data

%% Data fitting

... Write your code here

%% Predict using the identified model
y_model(1) = y(1);
for t =1:numel(y)-1
    y_model(t+1)= ...; % Write your code here
end

%% Plotting

figure(1)
clf
subplot(121)
set(gca,'FontSize',14) 
plot(out.tout,out.simout.Data(:,1),'linewidth',2)
ylabel('Input $u$',Interpreter='latex')
xlabel('Time [s]',Interpreter='latex')
xlim([0,out.tout(end)])
box on
grid on

subplot(122)
set(gca,'FontSize',14) 
hold all
plot(out.tout,out.simout.Data(:,2),'linewidth',2)
plot(out.tout,y_model','r','linewidth',2)
ylabel('Output $y$',Interpreter='latex')
xlabel('Time [s]',Interpreter='latex')
xlim([0,out.tout(end)])
box on
grid on
