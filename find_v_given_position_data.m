function [rg1,vg1] = find_v_given_position_data(rg1,rg2,t1,t2)
% Find vg1 given rg1, rg2, t1, and t2.
% Once rg1 and vg1 are found, the orbital elements can be computed. 

orbital_constants

% Here is where you will write code to find vg1 given rg1, rg2, t1, and t2.

T_triangle = 0.5*norm( cross(rg1)*rg2 ); %triangle area between rg1, rg2, center of earth
delta_theta = asin( T_triangle /(0.5*norm(rg1)*norm(rg2)) ); %from same formula as above

m = (mu1*(t2-t1)^2) / (2*sqrt(norm(rg1)*norm(rg2)*cos(delta_theta/2)))^3;
l = ( (norm(rg1)+norm(rg2)) / (4*sqrt(norm(rg1)*norm(rg2))*cos(delta_theta/2)) ) -0.5;

%precursors to get eta=... formula
eta = 

w = (m/eta^2)-l;
g = 2*asin(sqrt(w));
W = (2*g - sin(2*g)) / (sin(g))^3;





% Some dummy values; delete these once you start writing your own code.
rg1 = [Re + 450*1000; Re + 550*1000; Re + 650*1000];
vg1 = [-2000; 1000; 4000];

end