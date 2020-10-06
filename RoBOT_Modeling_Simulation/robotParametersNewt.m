%{
Robot Parameters for Newt Robot

Input parameters for simulink model, used to populate workspace
Modified from msra-walking-robot from MathWorks -- Repository linked below
https://github.com/mathworks-robotics/msra-walking-robot
Created for AME 441aL Senior Design at University of Southern California
-------------------------------------------------------------
10-01-2020     Created     Elliott Hoppe
%}

actuatorType = 1; %determines if controlled by 1. motion, 2. torque 3. motor

%% Contact and friction parameters
% Borrowed directly from msra repository until more detailed data on NEWT
% friction characteristics is determined
contact_stiffness = 400/0.001;          % Approximated at weight (N) / desired displacement (m)
contact_damping = contact_stiffness/10; % Tuned based on contact stiffness value
mu_s = 0.9;     % Static friction coefficient: Around that of rubber-asphalt
mu_k = 0.8;     % Kinetic friction coefficient: Lower than the static coefficient
mu_vth = 0.1;   % Friction velocity threshold (m/s)

height_plane = 0.025; %Determines the height of the "ground" solid above Z=0
plane_z = height_plane; %Height of ground solid
plane_x = 3; %Width of ground solid
plane_y = 50; %Length of ground solid (robot walks in +y)
contact_point_radius = 0.0001; %units [m]

%% Robot Mechanical Parameters
% All dimensions measured in meters, kg, s

base_density = 1000; %kg/m^3 used for objects where inertia is irrelevant e.g. ground plane

torsoWidth = 1;
torsoLength = 1;
torsoHeight = 1;
torsoDensity = 500; %use density or mass to define torso mass
torsoMass = 1; %use density or mass to define torso mass
