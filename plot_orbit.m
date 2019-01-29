function [T_hr] = plot_orbit(a,e,Omega,inc,omega_orbit,t0)
% Plot the orbit

orbital_constants

%% Compute various useful quantities

T = 8.5e3; % Made up number
T_hr = T/3600; % hr,
p = 7e6; % Made up number

%% Find the DCM from the perifocal frame to the inertial frame
Cpg = eye(3); % Made up, need to be changed. 
Cgp = Cpg';

%% Plot orbit
t = linspace(0,T,1000); % times to plot

for lv1 = 1:length(t)
    
    % Compute th, r, r_g, and v_g
    [th,r,R_g,V_g] = solve_two_body_prob(t(lv1),a,e,p,t0,Cgp);
    
    % Store all the position and velocity data resolved in the ``g" frame.
    r_g(lv1,:) = R_g';
    v_g(lv1,:) = V_g';
    
    % Store theta and r data. 
    th_data(lv1) = th;
    r_data(lv1) = r;
    
end

plot_script_v1

% return

end

