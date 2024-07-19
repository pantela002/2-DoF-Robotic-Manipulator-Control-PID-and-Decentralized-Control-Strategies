function [X,dX] = forward_kinematics(q, dq, J)

global l

% Cartesian position
x = l*sin(q(1)) + l*sin(q(1)+q(2));% calculates Cartesian X
z = l*cos(q(1)) + l*cos(q(1)+q(2));% calculates Cartesian Z
X = [x; z];

% Cartesian velocity
dX =  J*dq;

% calculates Cartesian velocities in X and Z direction
% dX = [dx; dz];