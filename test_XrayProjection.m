classdef test_XrayProjection < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testdetectorA_case1(test1)
            point = [1, 0, 0];
            [projectionA, ~] = XrayProjection(point);
            actSol = projectionA; 
            expSol = [0.5, 0.5, 0];
            test1.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end

        function testdetectorA_case2(test2)
            point = [0, 1, 0];
            [projectionA, ~] = XrayProjection(point);
            actSol = projectionA; 
            expSol = [0.5, 0.5, 0];
            test2.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end

         function testdetectorA_case3(test3)
            point = [0, 1, 1];
            [projectionA, ~] = XrayProjection(point);
            actSol = projectionA; 
            expSol = [0.5, 0.5, 0];
            test3.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end
        



        function testdetectorB_case1(test4)
            point = [1, 0, 0];
            [~, projectionB] = XrayProjection(point);
            actSol = projectionB; 
            expSol = [0.5, -0.5, 0];
            test4.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end

        function testdetectorB_case2(test5)
            point = [0, 1, 0];
            [~, projectionB] = XrayProjection(point);
            actSol = projectionB; 
            expSol = [-0.5, 0.5, 0];
            test5.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end

        function testdetectorB_case3(test6)
            point = [0, 1, 1];
            [~, projectionB] = XrayProjection(point);
            actSol = projectionB; 
            expSol = [-0.5, 0.5, 0];
            test6.verifyEqual(actSol, expSol, 'AbsTol', eps);
        end


    end

end