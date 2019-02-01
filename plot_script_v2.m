% Plotting

%close all
font_size = 15;
line_size = 15;
line_width = 2;

figure
plot(t/3600,th_data/pi,'r','Linewidth',line_width);
%axis('equal')
% title('True Anomaly Over One Orbital Period')
xlabel('$Time$ (Hours)','fontsize',font_size,'Interpreter','latex');
ylabel('$\theta$ ($\pi$ rad) True Anomaly','fontsize',font_size,'Interpreter','latex');
%zlabel('$g^3$ (m)','fontsize',font_size,'Interpreter','latex');
%view([1 1 1])
print('plots/th_data','-depsc','-r720');



figure
plot(t/3600,r_data,'r','Linewidth',line_width);
%axis('equal')
% title('True Anomaly Over One Orbital Period')
xlabel('$Time$ (Hours)','fontsize',font_size,'Interpreter','latex');
ylabel('$r$, Radius from the Center of the Earth','fontsize',font_size,'Interpreter','latex');
%zlabel('$g^3$ (m)','fontsize',font_size,'Interpreter','latex');
%view([1 1 1])
print('plots/r_data','-depsc','-r720');