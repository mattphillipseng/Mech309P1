% Plotting
% This script uses r_g and ref_h primarily

%% Times to plot, time steps
T = sqrt(((4*pi^2)/mu1)*a^3); %Orbital period, seconds
t = linspace(0,T,1000); % times to plot


%% Processing Data
% Getting time steps
for lv1 = 1:length(t)
   
end

%close all
font_size = 15;
line_size = 15;
line_width = 2;

% figure
% plot(t/3600,th_data/pi,'r','Linewidth',line_width);
% % title('Relative error of angular momentum as a function of time')
% xlabel('$Time$ (Hours)','fontsize',font_size,'Interpreter','latex');
% ylabel('Relative Error for Angular Momentum','fontsize',font_size,'Interpreter','latex');
% print('plots/energy','-depsc','-r720');