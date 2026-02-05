function mission = mission_definition()

mission.startDate = datetime(2025, 12, 21);
mission.endDate = datetime(2025, 12, 28);
mission.duration = mission.endDate - mission.startDate;

mission.durationInDays = days(mission.duration);

% Orbital Elements
mission.orbitAltitude = 546; % Altitude in kilometers
mission.semimajoraxis = (6371 + mission.orbitAltitude)*1e3; % semi-major axis in m
mission.inclination = 97.4; % Inclination in degrees
mission.eccentricity = 0.001; % Eccentricity of the orbit
mission.orbitPeriod = 2 * pi * sqrt((mission.semimajoraxis)^3 / 398600); % Orbital period in seconds
mission.orbitPeriodInHours = mission.orbitPeriod/3600;

mission.orbitVelocity = (2 * pi * (mission.orbitAltitude + 6371)) / mission.orbitPeriod; % Velocity in km/s

mission.RAAN = 337.5; % Right Ascension of Ascending Node in degrees
mission.argumentOfPerigee = 0;
mission.trueAnomaly = 180; 

end