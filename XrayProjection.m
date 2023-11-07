function [projection_detectorA, projection_detectorB] = XrayProjection(pointCK)
% X-ray projection function to project a point in CK space onto the two imaging detectors (A and B).
%
% INPUT:
%   pointCK: 3-element vector representing a point in CK space.

% OUTPUT:
%   projection_detectorA: 3-element vector representing the coordinates
%           of the projected point in Detector A's image frame.
%   projection_detectorB: 3-element vector representing the coordinates
%           of the projected point in Detector B's image frame.


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

    normalVector_detectorA = [sin(angle_A), cos(angle_A), 0];
    normalVector_detectorB = [sin(angle_B), cos(angle_B), 0];


    % Here we are calling a helper functions that takes in the point in CK
    % frame, and the normal vector of the detector and computes the 
    % projection from Home (3D CK frame) to destination (2D detector frame)

    pointA = pointProjection(pointCK, normalVector_detectorA);
    pointB = pointProjection(pointCK, normalVector_detectorB);

    % Since coordinate z is typically zero or insignficant we extract the x
    % and y coordinates and scale them using the Source-Detector Distance
    % and Source-Axis Distance
    
    projection_detectorA = pointA;
    projection_detectorB = pointB;

 
end

function projection_CKtoDetector = pointProjection(PointCK, NormalVector)
% Inputs:
%   PointCK - 3D coordinates of the point in CK frame.
%   NormalVector - 3D normal vector of the plane.
%
% Output:
%   projection - 3D coordinates of the projected point

        
        projection_CKtoDetector = dot(PointCK, NormalVector) / norm(NormalVector)^2 * NormalVector;


end
