function [rBW,rB,rEdges] = rotStamp(theta, BW)
%rotStamp Rotates a sherd based on ROI
%   ARGUMENTS:
%       theta - angle
%       BW - ROI
% 
%   RETURNS:
%       rBW - rotated BW
%       rB - Rotated boundary points
%       rEdges - edges

    % Rotate ROI
rBW = imrotate(BW, theta);

    % Isolate primary object (filter 3)
rB = bwboundaries(rBW, 8, 'noholes');  
[~,idx] = max(cellfun('length', rB));

    % Delete unecessary objects
rB = rB{idx};

    % Crop the sherd
[rBW, rB, rEdges] = croproi(rBW, rB, 0);
end

