
tle_file = '\data\debris\iridium33_deb.tle';

mission = mission_definition();
    
scenario = createScenario(mission);
    
YPSAT = createSat(scenario, mission);
    
debris = createDebris(scenario, tle_file);

[tca, missDistance, isRequired] = plan_avoidance_maneuver(YPSAT, debris);

if isRequired
    fprintf("Avoidance Maneuver is Required\n");
end


maneuverTime = tca - minutes(30);

[pos, vel] = states(YPSAT, maneuverTime, "CoordinateFrame","inertial");

disp(pos);
disp(vel);



vhat = vel/norm(vel);

detaV = 0.5; % m/s
 
vel_new = vel + detaV*vhat;

[a, ecc, incl, RAAN, argp, nu] = ijk2keplerian(pos, vel_new);

YPSAT_NEW = satellite(scenario, a, ecc, incl, RAAN, argp, nu,'Name','YPSAT');


[~,~,range_new,t_new] = aer(YPSAT_NEW, debris);
 
[minDist_new, idx2] = min(range_new);
 
tout_new = t_new(idx2);

disp(tout_new);
fprintf("Miss distance AFTER maneuver: %.1f m\n", minDist_new);


% Visualize the maneuver


debris.Orbit.LineColor = "red";
debris.MarkerColor = "red";

% Update the visualization for the new satellite
YPSAT.orbit.LineColor = "magenta";
YPSAT.MarkerColor = "magenta";

YPSAT_NEW.Orbit.LineColor = "green";
YPSAT_NEW.MarkerColor = "green";



play(scenario);