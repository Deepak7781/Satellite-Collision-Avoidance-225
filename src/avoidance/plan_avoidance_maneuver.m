
function [tca, missDistance, isRequired] = plan_avoidance_maneuver(YPSAT, debris)
% Function to check if the avoidance maneuver is required or not
   
    
    [tca, missDistance] = detect_conjunctions(YPSAT, debris);
    
    safeDistance = 40e3;
    
    if missDistance < safeDistance
        isRequired = true;
    end
end