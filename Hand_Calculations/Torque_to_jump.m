%{
Curve of torque over RoBOT height
Made for AME 441 aL
Fall 2020
Elliott Hoppe
elliotth@usc.edu

All values derived from hand calculation in OneNote Leg Design>Torque for
Flipping
%}

clc
clear all

global m g l tau

%% Assume Constant Vertical Accel of Body

m = 1;
a_y = 8.3019;
g = 9.81;
l = 0.22;

c_1 = ((a_y+g)*m/2)^2;

y = linspace(0.150,0.438,30);
tauVar = sqrt(c_1./(l^2-(y./2).^2));
figure
plot(y,tauVar)

%% Assume Constant Torque of Motor
% Use arbitrary values of torque to see how quickly RoBOT could
% successfully rise from a squatting position based on the motion of the
% hip and knee extension alone

tau = 25;                               %Arbitrary guess value for inital torque

tspan = [0 1];
x0 = [0.075 0];

figure
hold on

mVec = [1,1.5,2,3,5,10]

for i = 1:length(mVec)
    m = mVec(i)
    [t,x] = ode45(@dxdt,tspan,x0);
    plot(t,x(:,1));
    xlabel('Time [s]');
    ylabel('Height at Knee');
end
legend(['Mass = ',num2str(mVec(1))],['Mass = ',num2str(mVec(2))],['Mass = ',num2str(mVec(3))],['Mass = ',num2str(mVec(4))],['Mass = ',num2str(mVec(5))]);
title('Time trace of standing from squat with varied mass')
ylim([0,0.45]);
hold off


function xDot = dxdt(t,x)

global m g l tau
xDot = [x(2); (2/m)*(tau*sqrt(l^2-(x(1)/2)^2))-g];

end
