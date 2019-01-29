% Plotting

close all
font_size = 15;
line_size = 15;
line_width = 2;

figure
plot3(r_g(:,1),r_g(:,2),r_g(:,3),'r','Linewidth',line_width);
hold on
grid on
[F_g1, F_g2, F_g3] = sphere(36);
colormap(white)
surf(F_g1*Re, F_g2*Re, F_g3*Re)
load coast.mat
[x_coast, y_coast, z_coast] = sph2cart(long*(pi/180), lat*(pi/180), Re);
plot3(x_coast, y_coast, z_coast, 'k')
axis('equal')
% title('Spacecraft Orbit')
xlabel('$g^1$ (m)','fontsize',font_size,'Interpreter','latex');
ylabel('$g^2$ (m)','fontsize',font_size,'Interpreter','latex');
zlabel('$g^3$ (m)','fontsize',font_size,'Interpreter','latex');
view([1 1 1])
print('plots/orbit','-depsc','-r720');



