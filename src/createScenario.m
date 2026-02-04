function scenario = createScenario(mission)
    
    % Unpack the scenario details
    startTime = mission.startDate;
    endTime = mission.endDate;
    sampleTime = 20;
    
    % Creating the scenario
    scenario = satelliteScenario(startTime, endTime, sampleTime);


end