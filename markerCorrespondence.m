
function correspondenceMatrix = markerCorrespondence(A1, A2, A3, B1, B2, B3)
% resolveMarkerCorrespondences - Resolve correspondences between three identical markers.
% INPUTS:
%   A1, A2, A3 - Coordinates of three points in the A image frame.
%   B1, B2, B3 - Coordinates of three points in the B image frame.
%
% OUTPUTS:
%   correspondenceMatrix - A 3x2 matrix representing the correspondence matrix.
%                         Each row and column corresponds to a point, and the

    % Points A1, A2, A3 are merged together into a 3x3 matrix such that row
    % 1 is A1, row 2 is A2 and so on.
    % The same logic is then applied to B1, B2, B3
    pointsA = [A1;A2;A3];
    pointsB = [B1;B2;B3];

    % Here we are initializing a 3x2 RME Matrix
    rmeMatrix = zeros(3, 3);

    % Here we are reconstructing or re-projecting each point (marker) in
    % image A frame with each point (marker) in image B frame. The RME
    % between marker is then computed and mapped into the appropriate
    % location in the RME matrix.

    % For example, for RME value at 1x1 is that of A1 and B1 and the value
    % at 2x3 is that of A2 and B3 and so on.

    for i = 1:3
        for j = 1:3
            [~, rem] = markerReconstruction(pointsA(i, :), pointsB(j, :)); 
            rmeMatrix(i, j) = rem;
        end
    end

    % Here we are initializing a 3x2 Correspondence Matrix
    correspondenceMatrix = zeros(size(rmeMatrix, 1), 2);

    % Here we are looping over each row in the RME matrix and finding the
    % lowest RME value (usually near zero) and entering the indexies of
    % the lowest value into the Correspondence Matrix.

    % For example, the indexies of lowest value in the first row of RME matrix will be
    % maped to he first row of Correspondence Matrix and so on.
   
    for i = 1:size(rmeMatrix, 1)
        [~, minIndex] = min(rmeMatrix(i, :));
        correspondenceMatrix(i, :) = [i, minIndex];
    end

end


