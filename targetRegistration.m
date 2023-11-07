function pointCK = targetRegistration(pointCT, M1CT, M2CT, M3CT, M1CK, M2CK, M3CK)
% targetRegistration - Register a tumor target point from CT frame to CK frame.
%
% INPUTS:
%   pointCT - Target point in the CT frame.
%   M1CT, M2CT, M3CT - Three marker points in the CT frame.
%   M1CK, M2CK, M3CK - Three corresponding marker points in the CK frame.
%
% OUTPUTS:
%   pointCK - Registered target point in the CK frame (3x1 vector).

    % We need to generate the orthonormal frame (Oe, e1, e2, e3) for 
    % each frame using the given three grod truth markers.

    pointCT = [pointCT, 1];

    I = eye(3);

    [ov, v1, v2, v3] = OrthonormalFrame(M1CT, M2CT, M3CT);
    
    [oe, e1, e2, e3] = OrthonormalFrame(M1CK, M2CK, M3CK);

    % From the ground truth transformation sketch, we know that the
    % orthonormal basis for these two frames indentical and therefore there
    % is no rotation between them (ie. pure translation transformation)
    
   frametoHome = FrameTransformationToHome(oe-ov, [1;0;0], [0;1;0], [0;0;1]);
    
    pointCK = frametoHome * pointCT';

end

function [oe, e1, e2, e3] = OrthonormalFrame(A, B, C)
% INPUTS:
%   A: 3-element vector representing the first point.
%   B: 3-element vector representing the second point.
%   C: 3-element vector representing the third point.
%
% OUTPUTS:
%   oe: 3-element vector representing the center of gravity (centroid) of
%       the three points A, B, and C.
%   e1: 3-element unit vector pointing from A to B.
%   e2: 3-element unit vector orthogonal to e1 and e3.
%   e3: 3-element unit vector orthogonal to e1 and e2.

%   Note: The orthonormal frame consists of three unit vectors (e1, e2, e3)
%   forming a right-handed coordinate system with e1 pointing from A to B,
%   e2 orthogonal to e1 and e3, and e3 orthogonal to e1 and e2.


    % Substracting point A from B allows us to compute the direction and
    % magnitude of the vector pointing from A to B. However, all the vectors
    % in the orthonormal frame are unit vector and thats why we normalize
    % the resulted vectors

    i  = (B - A);
    e1 = i/norm(i);

    % Compute the third (e3) unit vector orthogonal to first (e1) unit vector using
    % cross product
    k = (cross(e1, C - A));
    e3 = k/norm(k);

      % Compute the remaining unit vector (e2) orthogonal to the first (e1) and third
    % (e3) unit vertacies

    % This allows us to find the 3 vector basis that forms and orthogonal
    %frame and also satisfies the right hand rule
    e2 = cross(e3, e1);

    % here we are computing the centre of gravity by taking the average of
    % the three given points. 
    oe = (A + B + C) / 3;

end

function FvToHome = FrameTransformationToHome(Ov, v1, v2, v3)
% FrameTransformationToHome - Compute the transformation from v frame to home frame.
%
% INPUTS:
%   Ov - The center (Ov) in the v frame, a 3x1 vector.
%   v1, v2, v3 - The base vectors of the v frame, each a 3x1 vector.
%
% OUTPUT:
%   FvToHome - The 4x4 homogeneous transformation matrix from v frame to home frame.

    R = [v1(1), v2(1), v3(1), 0;
         v1(2), v2(2), v3(2), 0;
         v1(3), v2(3), v3(3), 0;
         0, 0, 0, 1];

    T = [1, 0, 0, -Ov(1);
         0, 1, 0, -Ov(2);
         0, 0, 1, -Ov(3);
         0, 0, 0, 1];

    FvToHome = T^(-1) * R;
end

