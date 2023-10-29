classdef test_markerReconstruction < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function Home_test1(testCase1)
            point = [1, 0, 0];
            [pa, pb] = XrayProjection(point);
            actsolb = markerReconstruction(pa, pb);
            actSol = actsolb(1:3)';
            expSol = point;
            testCase1.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end
    end

end