
% TLE file of the debris
tle_file = '\data\debris\iridium33_deb.tle';

mission = mission_definition();

scenario = createScenario(mission);

debris = createDebris(scenario,tle_file);
play(scenario);

% Debris Data
disp("Debris Information");
fprintf("Name of the Debris : %s\n",debris.Name);
fprintf("Orbit Propagator : %s\n", debris.OrbitPropagator);