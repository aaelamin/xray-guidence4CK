function [reconstructedPoint, rem] = markerReconstruction(point_detectorA, point_detectorB)
%
% INPUT:
%   PointA: 
%   pointB:
% OUTPUT:
%   reconstructedPoint: 
%   error:

    addpath("/Users/elamin/Courses/CISC 330/Assignment-1/Questions")
    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);

    % We add 1 to the end of the point in order to make it a 1x4 vector
    % which will make it easier for future calculations

    point_detectorA = [point_detectorA, 1];
    point_detectorB = [point_detectorB, 1];

    % Since we are transforming point from the detector, destination frame
    % v, to CK frame, home frame (h), we inverse the tranformation frame
    % from home to destination in order to get point in Home frame (CK
    % frame)

    [transformation_CKtoA, transformation_CKtoB] = FrameTransformation();
    pointCK_A = transformation_CKtoA^(-1) * point_detectorA';
    pointCK_B = transformation_CKtoB^(-1) * point_detectorB';

    %s0, repersents the initial position of the x-ray source before it was
    % rotated to project x-rays to detector A and detector B. X and Y
    % coordinates are both 0 since we assume that the x-ray source is
    % directly above the tarhet point in the home frame.

    % Since the target point falls in the middle between the x-ray source
    % (given 200) and the detectors, we can assume that the x-ray source is +100 above
    % (z direction) the target point 

    sa = [sin(angle_A), cos(angle_A), 100, 1];
    sb = [sin(angle_B), cos(angle_B), 100, 1];

    va = (sa' - pointCK_A) / norm(sa' - pointCK_A);
    vb = (sb' - pointCK_B) / norm(sb' - pointCK_B);

    [reconstructedPoint, rem] = IntersectTwoLines(pointCK_A(1:3), va(1:3), pointCK_B(1:3), vb(1:3));
    
    

end