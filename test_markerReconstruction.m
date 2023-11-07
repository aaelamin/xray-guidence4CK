% Test1: Project ground truth points used in XrayProjection and
%        reconstruct the origional points

pointCK_1 = [1, 0, 0];
pointCK_2 = [1, 0, 0];
pointCK_3 = [1, 0, 0];

[point_A1, point_B1] = XrayProjection(pointCK_1);
[point_A2, point_B2] = XrayProjection(pointCK_2);
[point_A3, point_B3] = XrayProjection(pointCK_3);

reconstructed_pointCK1 = markerReconstruction(point_A1, point_B1)
reconstructed_pointCK2 = markerReconstruction(point_A2, point_B2)
reconstructed_pointCK3 = markerReconstruction(point_A3, point_B3)



% Test2: Project ground truth markers and reconstruct them using projected
% markers

% Origional markrt
M1CK = [30, -30, 0 ];
M2CK = [-30, 0, 30];
M3CK = [0, -30, 60];

[A1, B1] = XrayProjection(M1CK);
[A2, B2] = XrayProjection(M2CK);
[A3, B3] = XrayProjection(M3CK);

reconstructed_M1CK = markerReconstruction(A1, B1)
reconstructed_M2CK = markerReconstruction(A2, B2)
reconstructed_M3CK = markerReconstruction(A3, B3)