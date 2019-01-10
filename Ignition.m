%% Initial clear workspace
clear variables
clc

%% Define needed parameters
% Sample time of each loop step
sampletime = 0.002; % 2 miliseconds

% P-gain for P closed loop control
kq1 = 0.1;
kq2 = 0.1;
kq3 = 0.1;
kd4 = 1e-2;

% Manage each joint velocity
Max_1 = 5; % deg/s
Max_2 = 5; % deg/s
Max_3 = 5; % deg/s
Max_4 = 10; % mm/s

% Manage maximum velocity in planar movements
Max_x = 0.1; % m/s
Max_y = 0.1; % m/s
Max_rot = 5; % deg/s

% Joints Limits
rotation_upper = 140;
rotation_lower = -140;
lift_upper = 75;
lift_lower = 0;
tilt_upper = -10;
tilt_lower = -175;
extension_upper = 1800;
extension_lower = 0;

%% Calling needed Simulink models
file_name = 'BCS_v1_2018a.slx';
open(file_name) 

run_joystick = 'Joystick_ReadAndSend_X3D.slx';
open(run_joystick) 

%% Calling Real-time Simulink
slrtexplr
