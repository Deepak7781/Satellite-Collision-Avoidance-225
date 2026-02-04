
function sat = createSat(scenario, mission)


% Orbit Definiton
semiMajorAxis = mission.semimajoraxis;
eccentricity = mission.eccentricity;
inclination = mission.inclination;
RAAN = mission.RAAN;
argumentOfPerigee = mission.argumentOfPerigee;
trueAnomaly = mission.trueAnomaly;

% Adding YPSAT to the scenario
sat = satellite(scenario, semiMajorAxis, eccentricity, inclination, RAAN, argumentOfPerigee, trueAnomaly,"Name","YPSAT");

end