function  [th,r,R_g,V_g] = solve_two_body_prob(t,a,e,p,t0,Cgp);
% This is where you'll sove for R and V (in Frame g) at each time step.

orbital_constants

%% Solving for E using Newton's Method
M = sqrt(mu1/a^3)*(t-t0);

iter = 0;
E=M;
E_next = M+1; %just makes the initial guess different
while (abs(E_next - E) > 0.00001) && (iter <100)
    E = E_next;
    E_next = E - eval_E(E,e,M)/eval_deriv_E(E,e,M);
    iter = iter+1;
end
E
iter


% For now, make something up
sin_th = (a*sqrt(1-e^2)*sin(E))/r;
cos_th = (a*(cos(E)-e))/r;
th = atan2(sin_th,cos_th);

r = p/(1 + e*cos(th)); %OK

%% Calculating FTP
% eccentricity vector, requires:
    %v vector:
    %h vector: r cross v
    %r vector:
    %r vector norm: 
    %mu:
% eccentricity: we have this
% angular momentum vector
% angular momemntum

%%
%ecc_vect = 



%% Perifocal Ref Frame
%p_1 = 



%% Compute R and V in frame ``p", the perifocal frame.
R_p = [r*cos(th) r*sin(th) 0].'; % m %need FTP before????????
V_p = [-sin(th) cos(th)+e 0].'*sqrt(mu1/p); % m/s

% %Compute R and V in frame ``g", the ECI frame. 
R_g = Cgp*R_p; % m
V_g = Cgp*V_p; % m/s
