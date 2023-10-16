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

    % Since the origin of centre of gravity in both images of detector A
    % and detector B is at (0, 0, 0) I assumed that the transformation
    % frame will be purly rotational
    transformation_A = [cos(angle_A), -sin(angle_A), 0, 0;
                            sin(angle_A), cos(angle_A), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];

    
    transformation_B = [cos(angle_B), -sin(angle_B), 0, 0;
                            sin(angle_B), cos(angle_B), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];
    
  