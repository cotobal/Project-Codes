%% Code by Adrián Cotobal
clear all;
close all;
clc;
  [x, y] = meshgrid (-25:.5:25,-25:.5:25);
xc=1;
yc=1;
figure('Renderer', 'painters', 'Position', [10 10 2000 1100]) 
for k=0:0.01:9
xc=k;
yc=1+log((xc+1)/2);
w = log((((x-xc).^2+(y-yc).^2).*((x+xc).^2+(y+yc).^2)).*(((x+xc).^2+(y-yc).^2).*((x-xc).^2+(y+yc).^2))); subplot(1,2,1)
    contour(x,y,w,40,'-');
    view(2)
    axis([0 25 0 25 0 25]);
subplot(1,2,2)
mesh(x,y,w, 'FaceColor', 'interp', 'EdgeColor', 'none')
    subplot(1,2,2)
    view(8,21);
    axis([0 15 0 10 0 25]);
axis square;
s = sprintf('(Xc=%0.2f)',k);
ht = text(-6,11,0,s,'Color','black','Fontsize',15); pause(0.006);
end