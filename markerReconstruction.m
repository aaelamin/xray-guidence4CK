function reconstructedPoint = markerReconstruction(pointA, pointB)
%
% INPUT:
%   PointA: 
%   pointB:
% OUTPUT:
%   reconstructedPoint: 
%   error:

    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);

    % We add 1 to the end of the point in order to make it a 1x4 vector
    % which will make it easier for future calculations

    pointA = [pointA, 1];
    pointB = [pointB, 1];

    % Since we are transforming point from the detector, destination frame
    % v, to CK frame, home frame (h), we inverse the tranformation frame
    % from home to destination in order to get 

    sa = [sin(angle_A)*100, cos(angle_A)*100, 100];
    sb = [sin(angle_B)*100, cos(angle_B)*100, 100];

    transformationMatrix = FrameTransformation;

    CKpointA = transformationMatrix^(-1) * pointA';
    CKpointB = transformationMatrix^(-1) * pointB';

    