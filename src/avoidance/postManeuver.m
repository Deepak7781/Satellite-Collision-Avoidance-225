
debrisFile = 'data/debris/iridium33_deb.tle';

[pos, velocity, maneuverStartTime, missDistanceBeforeManeuver, TCA] = preManeuver(debrisFile); 

% YPSAT_NEW = satellite(scenario, a, ecc, incl, RAAN, argp, nu,'Name','YPSAT');
% 
% 
% [~,~,range_new,t_new] = aer(YPSAT_NEW, debris);
% 
% [minDist_new, idx2] = min(range_new);
% 
% tout_new = t_new(idx2);
% 
% disp(tout_new);
% fprintf("Miss distance AFTER maneuver: %.1f m\n", minDist_new);