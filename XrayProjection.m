function [pointA, pointB] = XrayProjection(pointCK)
% X-ray projection function to project a point in CK space onto the two imaging detectors (A and B).
%
% INPUT:
%   pointCK: 3-element vector representing a point in CK space [x; y; z].

% OUTPUT:
%   pointA: 3-element vector [x_A; y_A; z_A] representing the coordinates
%           of the projected point in Detector A's image frame.
%   pointB: 3-element vector [x_B; y_B; z_B] representing the coordinates
%           of the projected p


    SDD = 200;  % Source-Detector Distance
    SAD = 100;  % Source-Axis Distance 

    % Firstly, we calculate the angles detector A and B were rotated by.
    % this woudl make it easier to calculate normal vectors for each in the
    % next step
    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);

    % Since plane (detector) A was rotated 45 degrees about the positive
    % z-axis. The result is that Detector A's normal vector points in a
    % direction that is 45 degrees clockwise from the positive x-axis in the XY plane 

    % Since plane (detector) B was rotated 45 degrees about the positive
    % z-axis. The result is that Detector A's normal vector points in a
    % direction that is 45 degrees counterclockwise from the positive x-axis in the XY plane 

    % Since detectors A and B are essentially planes that exist in 2d space
    % we can represent them using x and y coordinates and that eliminates
    % the need for coordinate z which is why it is 0

    normalVectorA = [sin(angle_A), cos(angle_A), 0];
    normalVectorB = [sin(angle_B), cos(angle_B), 0];

    projection_A = dot(pointCK, normalVectorA) / norm(normal_A);
    
    projection_B = dot(pointCK, normalVectorB) / norm(normal_B);




