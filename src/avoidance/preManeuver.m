
tle_file = '\data\debris\iridium33_deb.tle';

mission = mission_definition();
    
scenario = createScenario(mission);
    
YPSAT = createSat(scenario, mission);
    
debris = createDebris(scenario, tle_file);

[tca, missDistance, isRequired] = plan_avoidance_maneuver(YPSAT, debris);

if isRequired
    fprintf("Avoidance Maneuver is Required\n");
end



% Visualize the maneuver


debris.Orbit.LineColor = "red";
debris.MarkerColor = "red";

% Update the visualization for the new satellite
YPSAT.orbit.LineColor = "magenta";
YPSAT.MarkerColor = "magenta";

YPSAT_NEW.Orbit.LineColor = "green";
YPSAT_NEW.MarkerColor = "green";



play(scenario);