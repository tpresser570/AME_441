% Walking Robot Startup Script
%
% Copyright 2017-2019 The MathWorks, Inc.

%% Clear everything
clc
clear
close all

%% Add folders to the path
addpath(genpath('LIPM'), ...                    % Linear inverted pendulum model (LIPM) files
        genpath('ModelingSimulation'), ...      % Modeling and simulation files
        genpath('Optimization'), ...            % Optimization files
        genpath('ControlDesign'), ...           % Control design files
        genpath('ReinforcementLearning'), ...   % Reinforcement learning files
        genpath('Libraries'),...                % Other dependencies
        genpath('RoBOT_Modeling_Simulation'));

%% Load basic robot parameters from prelim NEWT parameters file
lowFiRobotParametersNEWT

%% Open the README file
edit README.md