function [projection_A, projection_B] = XrayProjection(pointCK)
% X-ray projection function to project a point in CK space onto the two imaging detectors (A and B).
%
% INPUT:
%   pointCK: 3-element vector representing a point in CK space [x; y; z].

% OUTPUT:
%   projection_A: 3-element vector [x_A; y_A; z_A] representing the coordinates
%           of the projected point in Detector A's image frame.
%   pointB: 3-element vector [x_B; y_B; z_B] representing the coordinates
%           of the projected p

    % The following are given scalling factors that will assist in scalling
    % the projected point appropriatly

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

    % The detectors' centre given in the asssignemnt's pdf file
    detectorOrgin = [0, 0, 0];

    % Here we are calling a helper functions that takes in the point in CK
    % frame, the origin or centre of destination frame (really a point on
    % the destination frame) and the normal vector of the detector and
    % computes the projection from Home (3D CK frame) to destination (2D
    % detector frame)

    pointA = pointProjection(pointCK, detectorOrgin, normalVectorA);
    pointB = pointProjection(pointCK, detectorOrgin, normalVectorB);

    % Since coordinate z is typically zero or insignficant we extract the x
    % and y coordinates and scale them using the Source-Detector Distance
    % and Source-Axis Distance
    
    projection_A = pointA(1:2) * (SDD/SAD);
    projection_B = pointB(1:2) * (SDD/SAD);

 
end

function projection = pointProjection(Point, center, NormalVector)
% Inputs:
%   Point - 3D coordinates of the point to be projected.
%   center - 3D coordinates of the plane's center.
%   NormalVector - 3D normal vector of the plane.
%
% Output:
%   projection - 3D coordinates of the projected point

    % Calculate the direction vector from the center to the point
        V = Point - center;

        % Normalize the normal vector
        N_normalized = NormalVector / norm(NormalVector);

        % Calculate the dot product of V and the normalized normal vector
        dotProduct = dot(V, N_normalized);

        % Calculate the projected point
        projection = Point - dotProduct * N_normalized;

end