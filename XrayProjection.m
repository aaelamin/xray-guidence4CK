function [pointA, pointB] = XrayProjection(pointCK)
% X-ray projection function to project a point in CK space onto the two imaging detectors (A and B).
%
% INPUT:
%   pointCK: 3-element vector representing a point in CK space [x; y; z].

% OUTPUT:
%   pointA: 3-element vector [x_A; y_A; z_A] representing the coordinates
%           of the projected point in Detector A's image frame.
%   pointB: 3-element vector [x_B; y_B; z_B] representing the coordinates
%           of the projected p