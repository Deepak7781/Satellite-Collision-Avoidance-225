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