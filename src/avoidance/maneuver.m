function keplerianElements = maneuver(pos, velocity)
    
    vhat = velocity/norm(velocity);
    
    detaV = 0.5; % m/s
     
    velocity_maneuver = velocity + detaV*vhat;

    [a, incl, ecc, RAAN, argp, nu] = ijk2keplerian(pos, velocity_maneuver);

    keplerianElements = [a, incl, ecc, RAAN, argp, nu];

end