function [rg1,vg1] = find_v_given_position_data(rg1,rg2,t1,t2)
% Find vg1 given rg1, rg2, t1, and t2.
% Once rg1 and vg1 are found, the orbital elements can be computed. 

orbital_constants

% Here is where you will write code to find vg1 given rg1, rg2, t1, and t2.

T_triangle = 0.5*norm( cross(rg1)*rg2 ); %triangle area between rg1, rg2, center of earth
delta_theta = asin( T_triangle /(0.5*norm(rg1)*norm(rg2)) ); %from same formula as above

m_numerator = mu1*((t2-t1)^2)
m_denom = ( 2 * sqrt(norm(rg1)*norm(rg2)) * cos(delta_theta/2) )^3
m_whole = m_numerator/m_denom


l_numerator = norm(rg1) + norm(rg2)
l_denom = 4 * sqrt(norm(rg1) * norm(rg2)) * cos(delta_theta/2)
l_whole = (l_numerator/l_denom) - 0.5



%eta must be between 1 and 2
iter = 0;
xleft = 1;
xright = 2;
while ((xright-xleft)>=0.0001) && (iter<=100)  
    iter=iter+1
    
    xroot = (xright+xleft)/2
    
    mid_val = eval_f(xroot,l_whole,m_whole);
    left_val = eval_f(xleft,l_whole,m_whole);
    right_val = eval_f(xright,l_whole,m_whole);
    
    if(left_val*mid_val) < 0 %one is pos, one is neg. The mult of both is neg: therefore root is between xleft and xroot
        xright=xroot;
    else
        xleft=xroot;
    end
end
finalroot = xroot

% 
%     function f = eval_f(x,l,m)
%         w = (m/(x^2))-l
%         g = 2*asin(sqrt(w))
%         W = (2*g - sin(2*g)) / (sin(g))^3
%         f = 1-x+(m/x^2)*W
%     end





% Some dummy values; delete these once you start writing your own code.
rg1 = [Re + 450*1000; Re + 550*1000; Re + 650*1000];
vg1 = [-2000; 1000; 4000];

end