function [rg1,vg1] = find_v_given_position_data(rg1,rg2,t1,t2)
% Find vg1 given rg1, rg2, t1, and t2.
% Once rg1 and vg1 are found, the orbital elements can be computed. 

orbital_constants

% Here is where you will write code to find vg1 given rg1, rg2, t1, and t2.

T_triangle = 0.5*norm( cross(rg1)*rg2 ); %triangle area between rg1, rg2, center of earth
delta_theta = asin( T_triangle /(0.5*norm(rg1)*norm(rg2)) ); %from same formula as above

m_numerator = mu1*((t2-t1)^2);
m_denom = ( 2 * sqrt(norm(rg1)*norm(rg2)) * cos(delta_theta/2) )^3;
m_whole = m_numerator/m_denom;


l_numerator = norm(rg1) + norm(rg2);
l_denom = 4 * sqrt(norm(rg1) * norm(rg2)) * cos(delta_theta/2);
l_whole = (l_numerator/l_denom) - 0.5;


%% Bisection
%eta must be between 1 and 2
%iter = 0;
% xleft = 1;
% xright = 2;
% while ((xright-xleft)>=0.00001) && (iter<=100)  
%     iter=iter+1
%     
%     xroot = (xright+xleft)/2
%     
%     mid_val = eval_f(xroot,l_whole,m_whole);
%     left_val = eval_f(xleft,l_whole,m_whole);
%     right_val = eval_f(xright,l_whole,m_whole);
%     
%     if(left_val*mid_val) < 0 %one is pos, one is neg. The mult of both is neg: therefore root is between xleft and xroot
%         xright=xroot;
%     else
%         xleft=xroot;
%     end
% end
% eta = xroot

%% Newton's Method
% eta MUST be between 1 and 2. 2 is the upper bound
% 1.5 is our initial guess
iter = 0;
eta=1.5;
eta_next = 2;
while (abs(eta_next - eta) > 0.00001) && (iter <100)
    eta = eta_next;
    eta_next = eta - eval_f(eta,l_whole,m_whole)/eval_deriv_f(eta,l_whole,m_whole);
    iter = iter+1;
end
eta
iter


p_num = (eta^2) * (norm( cross(rg1)*rg2 ))^2;
p_denom = mu1 * (t2-t1)^2;
p = p_num/p_denom;

%% Lagrange Coeffs
F_num = p - (norm(rg2)*(1-cos(delta_theta)));
F = F_num/p;

G_num = norm(rg1)*norm(rg2)*sin(delta_theta);
G_denom = sqrt(mu1*p);
G = G_num/G_denom;

%% Final Results
vg1 = (rg2-(F*rg1))/G

% Some dummy values; delete these once you start writing your own code.
rg1 = [Re + 450*1000; Re + 550*1000; Re + 650*1000];



end