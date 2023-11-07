% Test1: Run the registration module, computethe tumor target in CK frame,
% and run the registration on M1CT M2CT M3CT and demonstrate that your frame transform yields the
% correct M1CK M2CK M3CK points.

% Ground truth markers in CK frame
M1CK = [30, -30, 0 ];
M2CK = [-30, 0, 30];
M3CK = [0, -30, 60];
TCCK = [0, 30, 30];


pointCT = [-30, 20, 20];
M1CT = [0, -40, -10 ];
M2CT = [-60, -10, 20];
M3CT = [-30, -40, 50];

% Compute point in CK frame
poinCK = targetRegistration(pointCT, M1CT, M2CT, M3CT, M1CK, M2CK, M3CK)

M1CK_o = targetRegistration(M1CT, M1CT, M2CT, M3CT, M1CK, M2CK, M3CK)

M2CK_o = targetRegistration(M2CT, M1CT, M2CT, M3CT, M1CK, M2CK, M3CK)

M3CK_o = targetRegistration(M3CT, M1CT, M2CT, M3CT, M1CK, M2CK, M3CK)
