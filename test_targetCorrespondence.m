%Test 1: Project M1CK, M2CK and M3CK into detectror A and detector B
%        and commpute their coorespondence matrix

M1CK = [30, -30, 0 ];
M2CK = [-30, 0, 30];
M3CK = [0, -30, 60];

[A1, B1] = XrayProjection(M1CK);
[A2, B2] = XrayProjection(M2CK);
[A3, B3] = XrayProjection(M3CK);


test1_correspindeceMatrix = markerCorrespondence(A1, A2, A3, B1, B2, B3)


%Test 2: Swap M1CK and M2CK in image A and compute the correspondecne
%        matrix

test2_correspindeceMatrix = markerCorrespondence(A2, A1, A3, B1, B2, B3)


%Test 3: Project slightly different markers adn compute correspondence
% matrix

test3_M1CK = [30, -30, 0];
test3_M2CK = [-30, 0, 0];
test3_M3CK = [0, -30, 60];


[A4, B4] = XrayProjection(test3_M1CK);
[A5, B5] = XrayProjection(test3_M2CK);
[A6, B6] = XrayProjection(test3_M3CK);

test3_correspindeceMatrix = markerCorrespondence(A4, A5, A6, B4, B5, B6)
