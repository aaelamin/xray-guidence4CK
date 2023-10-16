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
    
    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);

    translationVector = [0, 0, 0, 1];

    translationMatrix = eye(4); 
    translationMatrix(1:4, 4) = -translationVector;
    rotationMatrix_A = [cos(angle_A), -sin(angle_A), 0, 0;
                            sin(angle_A), cos(angle_A), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];

    
    rotationMatrix_B = [cos(angle_B), -sin(angle_B), 0, 0;
                            sin(angle_B), cos(angle_B), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];

    transformation_A = translationMatrix * rotationMatrix_A;
    transformation_B = translationMatrix * rotationMatrix_B;
    
  