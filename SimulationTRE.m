function maxAllowedError = SimulationTRE()
% INPUTS:
%   None
%
% OUTPUTS:
%   maxAllowedError - maximum allowable marker segmentation error that still guarantees clinically acceptable target registration
%                     error for all targets within the envelop.

% Initialize parameters
    N = 100; 
    increment = 0.1; 
    maxTRE = 1.0; 
    Emax = 0;


    targetPointsCK = rand(N, 3);

    M1CK = [30, -30, 0 ];
    M2CK = [-30, 0, 30];
    M3CK = [0, -30, 60];
    
    [M1CT_A, M1CT_B] = XrayProjection(M1CK);
    [M2CT_A, M2CT_B] = XrayProjection(M2CK);
    [M3CT_A, M3CT_B] = XrayProjection(M3CK);

    while true
        % Apply segmentation error with random direction and magnitude Emax
        noiseA = Emax * (2*rand(1, 3));
        noiseB = Emax * (2*rand(1, 3));

        % Here we are spoiling the markers using EMax and random direction,
        M1CT_A_noise = M1CT_A + noiseA;
        M2CT_A_noise = M2CT_A + noiseA;
        M3CT_A_noise = M3CT_A + noiseA;
        M1CT_B_noise = M1CT_B + noiseB;
        M2CT_B_noise = M2CT_B + noiseB;
        M3CT_B_noise = M3CT_B + noiseB;

        % Reconstruct markers in the CK frame with noise
        [M1CK_noisy, ~] = markerReconstruction(M1CT_A_noise, M1CT_B_noise);
        [M2CK_noisy, ~] = markerReconstruction(M2CT_A_noise, M2CT_B_noise);
        [M3CK_noisy, ~] = markerReconstruction(M3CT_A_noise, M3CT_B_noise);

        maxTRE_current = 0;
        for i = 1:N
            pointCK = targetRegistration(targetPointsCK(i, :), M1CK, M2CK, M3CK, M1CK_noisy, M2CK_noisy, M3CK_noisy);
            TRE = norm(pointCK - targetPointsCK(i, :));
            maxTRE_current = max(maxTRE_current, TRE);
        end

        if maxTRE_current > maxTRE
            break;
        end
         Emax = Emax + increment;
       
    end
     maxAllowedError = Emax - increment;

end
