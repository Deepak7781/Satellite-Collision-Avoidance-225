function keplerianElements = maneuver(pos, velocity)
    
    vhat = velocity/norm(velocity);
    
    detaV = 0.5; % m/s
     
    velocity_maneuver = velocity + detaV*vhat;

    keplerianElements = ijk2keplerian(pos, velocity_maneuver);

end