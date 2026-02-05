
function [pos, velocity, maneuverStartTime, missDistance, tca] = preManeuver(tle_file)

    mission = mission_definition();
        
    scenario = createScenario(mission);
        
    YPSAT = createSat(scenario, mission);
        
    debris = createDebris(scenario, tle_file);
    
    [tca, missDistance, isRequired] = plan_avoidance_maneuver(YPSAT, debris);
    
    if isRequired
        fprintf("Avoidance Maneuver is Required\n");
        maneuverStartTime = tca - minutes(30);
        [pos, velocity] = states(YPSAT, maneuverTime, "CoordinateFrame","inertial");
    end
    
end