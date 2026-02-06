function [pos, velocity, maneuverStartTime, missDistance, tca] = preManeuver(tle_file)
    % Calculates the position and velocity at maneuverStartTime

    % Mission Definition
    mission = mission_definition();
    
    % Creating a scenario
    scenario = createScenario(mission); 

    % Adding Satellite
    YPSAT = createSat(scenario, mission);
    
    % Adding Debris
    debris = createDebris(scenario, tle_file);
    
    [tca, missDistance, isRequired] = plan_avoidance_maneuver(YPSAT, debris);
    
    if isRequired
        fprintf("Avoidance Maneuver is Required\n");
        maneuverStartTime = tca - minutes(30);
        [pos, velocity] = states(YPSAT, maneuverStartTime, "CoordinateFrame","inertial");
        play(scenario)
    end
    
end