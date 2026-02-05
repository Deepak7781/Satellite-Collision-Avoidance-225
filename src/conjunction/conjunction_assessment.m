

tle_file = '\data\debris\iridium33_deb.tle';

mission = mission_definition();

scenario = createScenario(mission);

YPSAT = createSat(scenario, mission);

debris = createDebris(scenario, tle_file);

[tca, minRange] = detect_conjunctions(YPSAT, debris);

disp(tca);
disp(minRange);

play(scenario)