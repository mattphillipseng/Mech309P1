function [T_hr,r_g,v_g] = plot_orbit(a,e,Omega,inc,omega_orbit,t0)
% Plot the orbit

orbital_constants

%% Compute various useful quantities
T = sqrt(((4*pi^2)/mu1)*a^3); %seconds
T_hr = T/3600; % hr
p = a*(1-e^2);

%% Find the DCM from the perifocal frame to the inertial frame
Cpg = C3(omega_orbit)*C1(inc)*C3(Omega);
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
plot_script_v2

end

