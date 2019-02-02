function  [th,r,R_g,V_g] = solve_two_body_prob(t,a,e,p,t0,Cgp);
% This is where you'll sove for R and V (in Frame g) at each time step.

orbital_constants

M = sqrt(mu1/a^3)*(t-t0);

%% Solving for E using bisection -- This code is no longer in use
iter = 0;
xleft = 0;
xright = 10;
while ((xright-xleft)>=0.000001) && (iter<=100)  
    iter=iter+1;
    
    xroot = (xright+xleft)/2;
    
    mid_val = eval_E(xroot,e,M);
    left_val = eval_E(xleft,e,M);
    right_val = eval_E(xright,e,M);
    
    if(left_val*mid_val) < 0 %one is pos, one is neg. The mult of both is neg: therefore root is between xleft and xroot
        xright=xroot;
    else
        xleft=xroot;
    end
end
E_bisection = xroot;

%% Solving for E using Newton's Method

iter = 0;
E=M; % E=M at the apoapsis***** CHECK THIS
E_next = M+1; %just to make sure while loop is entered
while (abs(E_next - E) > 0.000001) && (iter <100)
    E = E_next;
    E_next = E - eval_E(E,e,M)/eval_deriv_E(E,e,M);
    iter = iter+1;
end
E;
iter;

%% Check difference between roots from bisection and Newton
errE = abs(E_bisection-E)

%% Calculating theta and r
sin_th = (sqrt(1-e^2)*sin(E)) / (1-e*cos(E));
cos_th = (cos(E)-e) / (1-e*cos(E));
th = atan2(sin_th,cos_th);

r = p/(1 + e*cos(th)); %OK


%% Compute R and V in frame ``p", the perifocal frame.
R_p = [r*cos(th) r*sin(th) 0].'; % m
V_p = [-sin(th) cos(th)+e 0].'*sqrt(mu1/p); % m/s

% %Compute R and V in frame ``g", the ECI frame. 
R_g = Cgp*R_p; % m
V_g = Cgp*V_p; % m/s
