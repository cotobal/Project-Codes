% Representation of the 2D iso-contours and 3D mesh of the velocity potential φ in both 4 
% quadrants, for graphic visualization of the method of mirror images

%% Code by Adrián Cotobal
clear all;
close all;
clc;
[x, y] = meshgrid (-10:.5:10,-10:.5:10);
xc=1;
yc=1;
figure('Renderer', 'painters', 'Position', [10 10 2000 1100]) 
for k=0:0.01:9
xc=k;
yc=1+log((xc+1)/2);
w = log((((x-xc).^2+(y-yc).^2).*((x+xc).^2+(y+yc).^2)).*(((x+xc).^2+(y-yc).^2).*((x-xc).^2+(y+yc).^2))); subplot(1,2,1)
    contour(x,y,w,40,'-');
    view(2)
subplot(1,2,2)
mesh(x,y,w, 'FaceColor', 'interp', 'EdgeColor', 'none')
    subplot(1,2,2)
axis([-10 10 -9 9 -6 20]);
axis square;
s = sprintf('(Xc=%0.2f)',k);
ht = text(-16,11,0,s,'Color','black','Fontsize',15); pause(0.006);
end