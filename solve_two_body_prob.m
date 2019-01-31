function  [th,r,R_g,V_g] = solve_two_body_prob(t,a,e,p,t0,Cgp);
% This is where you'll sove for R and V (in Frame g) at each time step.

orbital_constants

%% Solving for E using Newton's Method
M = sqrt(mu1/a^3)*(t-t0);

iter = 0;
E=M;
E_next = M+1; %just to make sure while loop is entered
while (abs(E_next - E) > 0.00001) && (iter <100)
    E = E_next;
    E_next = E - eval_E(E,e,M)/eval_deriv_E(E,e,M);
    iter = iter+1;
end
E
iter


% For now, make something up %can delete this comment
sin_th = (sqrt(1-e^2)*sin(E)) / (1-e*cos(E));
cos_th = (cos(E)-e) / (1-e*cos(E));
th = atan2(sin_th,cos_th);

r = p/(1 + e*cos(th)); %OK


%% Compute R and V in frame ``p", the perifocal frame.
R_p = [r*cos(th) r*sin(th) 0].'; % m %need FTP before???????? NO
V_p = [-sin(th) cos(th)+e 0].'*sqrt(mu1/p); % m/s

% %Compute R and V in frame ``g", the ECI frame. 
R_g = Cgp*R_p; % m
V_g = Cgp*V_p; % m/s
