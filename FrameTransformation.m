function [transformation_A, transformation_B] = FrameTransformation()
%
% INPUTS:
%
%   None
%
% OUTPUTS:
% 
%   Transformation_A: A 4x4 homogeneous transformation matrix detector A.
%   Transformation_B: A 4x4 homogeneous transformation matrix detector B.
%
    % Firstly, we calculate the angles detector A and B were rotated by.
    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);
    
    % a 4x4 homogeneous translation matrix has a the form of [1, 0, 0, -ovx
    %                                                         0, 1, 0, -ovy 
    %                                                         0, 0, 1, -ovz 
    %                                                         0, 0, 0, 1 ]
    % where ovx, ovy, ovx represent the origin of the detination frame we
    % want to translate to. 
    % We know the destination frame (detector A and B) has a centre or orgin
    % (Ov) of (0, 0, 0) so we sub in those values into the 4x4 homogeneous
    % translation matrix to obtttain matrix below

    translationMatrix = [1, 0, 0, 0;
                         0, 1, 0, 0;
                         0, 0, 1, 0;
                         0, 0, 0, 1];


    % Detector A was rotated by 45 degrees clockwise about z axis and the
    % 4x4 homogeneous rotational matrix is a representation of that

    rotationMatrix_A = [cos(angle_A), -sin(angle_A), 0, 0;
                            sin(angle_A), cos(angle_A), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];

    % Detector B was rotated by 45 degrees counter clockwise about z axis and the
    % 4x4 homogeneous rotational matrix is a representation of that

    rotationMatrix_B = [cos(angle_B), -sin(angle_B), 0, 0;
                            sin(angle_B), cos(angle_B), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];

    % Since we are creating a homogeneous transformation matrix from the CK
    % frame, which is the home frame "h", to the detectors' frames, which
    % are destination frame "v". We multiply the homogeneous translation matrix
    % with the homogeneous rotation matrix to get the homogeneous transformation matrix

    transformation_A = translationMatrix * rotationMatrix_A;
    transformation_B = translationMatrix * rotationMatrix_B;
    
  