% Function for detecting the window of conjuctions

function [tca, minRange] = detect_conjunctions(YPSAT, debris)
    % YPSAT: staellite object, debris: satellite object
    
    % Finding the range between YPSAT and debris
    [~, ~, range, tout] = aer(YPSAT, debris);
    
    [minRange,idx] = min(range);
    tca = tout(idx);
end