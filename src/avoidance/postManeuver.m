
function missDistanceAfterManeuver = postManeuver(debrisFile)
    % Getting details before the maneuver
    [pos, velocity, maneuverStartTime, ~, TCA] = preManeuver(debrisFile); 
    
    % Performing the maneuver
    keplerianElements = maneuver(pos, velocity);
    
    % Unpacking the keplerian elements after maneuver
    
    a = keplerianElements(1); % Semimajor axis
    ecc = keplerianElements(2); % Eccentricity
    incl = keplerianElements(3); % Inclination
    RAAN = keplerianElements(4); % Right Ascension of Ascending Node
    argp = keplerianElements(5); % Argument of Periapsis
    nu = keplerianElements(6); % True Anomaly
    
    % Creating a new scenario - The satrt time of the scenario is going to be
    % the maneuver start time
    
    % mission definition
    mission = mission_definition();
    maneuverScenario = satelliteScenario(maneuverStartTime, mission.endDate, 20);
    
    % Add the YPSAT
    YPSAT_maneuver = satellite(maneuverScenario, a, ecc, incl, RAAN, argp, nu,'Name','YPSAT');
    debris = satellite(maneuverScenario, debrisFile);
    
    % Compute Range
    [~,~,range,t] = aer(YPSAT_maneuver, debris);
     
    % Find the distance between YPSAT and debris at TCA (in premaneuver)
    idx = datefind(TCA, t);
    % Compute the miss distance at TCA
    missDistanceAfterManeuver = range(idx);

end
