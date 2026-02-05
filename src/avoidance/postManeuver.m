
debrisFile = 'data/debris/iridium33_deb.tle';

% Getting details before the maneuver
[pos, velocity, maneuverStartTime, missDistanceBeforeManeuver, TCA] = preManeuver(debrisFile); 

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

% Compute Ranges
[~,~,range,t] = aer(YPSAT_maneuver, debris);
 
