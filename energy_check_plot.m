% Plotting
% This script uses r_g, v_g and ref_h primarily

%% Times to plot, time steps
T = sqrt(((4*pi^2)/mu1)*a^3); %Orbital period, seconds
t = linspace(0,T,1000); % times to plot


%% Processing Data
for lv1 = 1:length(t)
   this_r = [r_g(lv1,1);r_g(lv1,2);r_g(lv1,3)];
   this_v = [v_g(lv1,1);v_g(lv1,2);v_g(lv1,3)];
   
   this_h_vect = cross(this_r)*this_v;
   this_h = norm(this_h_vect); % magnitude of angular velocity vector
   
   abs_err_h = abs(this_h-ref_h); % absolute error
   rel_err_h = abs_err_h/ref_h; % relative error
   
   % Storing data to an array for plotting
   abs_errors(lv1) = abs_err_h;
   rel_errors(lv1) = rel_err_h;
   
end

%close all
font_size = 15;
line_size = 15;
line_width = 2;

figure
stairs(t/3600,abs_errors,'r','Linewidth',line_width);
% title('Absolute Error in Angular Momentum as a Function of Time')
xlabel('$Time$ (Hours)','fontsize',font_size,'Interpreter','latex');
ylabel('Relative Error for Angular Momentum $\frac{m^2}{s}$','fontsize',font_size,'Interpreter','latex');
print('plots/energy_abs','-depsc','-r720');

figure
stairs(t/3600,rel_errors,'r','Linewidth',line_width);
% title('Relative Error in Angular Momentum as a Function of Time')
xlabel('$Time$ (Hours)','fontsize',font_size,'Interpreter','latex');
ylabel('Relative Error for Angular Momentum $\frac{m^2}{s}$','fontsize',font_size,'Interpreter','latex');
print('plots/energy_rel','-depsc','-r720');