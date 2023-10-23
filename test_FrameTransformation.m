classdef test_FrameTransformation < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Tests with the same case number have the same given point to
        % transform. For intence, "testdetectorA_case1" and "testdetectorB_case1"
        % both transform the point [1, 0, 0]

        function testdetectorA_case1(test1)
            point = [1, 0, 0];
            [frametransformation_A, ~] = FrameTransformation;
            actSol = frametransformation_A * [point, 1]';
            expSol = [0.7071; 0.7071; 0; 1];
            test1.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 

        function testdetectorA_case2(test2)
            point = [0, 1, 0];
            [frametransformation_A, ~] = FrameTransformation;
            actSol = frametransformation_A * [point, 1]';
            expSol = [-0.7071; 0.7071; 0; 1];
            test2.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 

        function testdetectorA_case3(test3)
            point = [0, 1, 1];
            [frametransformation_A, ~] = FrameTransformation;
            actSol = frametransformation_A * [point, 1]';
            expSol = [-0.7071; 0.7071; 1; 1];  
            test3.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 

        function testdetectorB_case1(test4)
            point = [1, 0, 0];
            [~, frametransformation_B] = FrameTransformation;
            actSol = frametransformation_B * [point, 1]';
            expSol = [0.7071; -0.7071; 0; 1 ];
            test4.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 


        function testdetectorB_case2(test5)
            point = [0, 1, 0];
            [~, frametransformation_B] = FrameTransformation;
            actSol = frametransformation_B * [point, 1]';
            expSol = [0.7071; 0.7071; 0; 1];
            test5.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 

        function testdetectorB_case3(test6)
            point = [0, 1, 1];
            [~, frametransformation_B] = FrameTransformation;
            actSol = frametransformation_B * [point, 1]';
            expSol = [0.7071; 0.7071; 1; 1]; 
            test6.verifyEqual(actSol, expSol, 'AbsTol', eps)
        end 


    
        
        
        
    end

end