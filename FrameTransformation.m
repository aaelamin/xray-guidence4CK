function [A, B] = FrameTransformation()

    angle_A = deg2rad(45);
    angle_B = deg2rad(-45);
    
    rotationMatrix_A = [cos(angle_A), -sin(angle_A), 0, 0;
                            sin(angle_A), cos(angle_A), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];
    
    rotationMatrix_B = [cos(angle_B), -sin(angle_B), 0, 0;
                            sin(angle_B), cos(angle_B), 0, 0;
                            0, 0, 1, 0;
                            0, 0, 0, 1];
    
    transformation_A = translationMatrix_A * rotationMatrix_A;
    transformation_B = translationMatrix_B * rotationMatrix_B;