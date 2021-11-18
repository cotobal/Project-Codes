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
    w = atan((y-yc)./(x-xc))+atan((y-yc)./(x+xc))+atan((y+yc)./(x+xc))+atan((y+yc)./(x-xc));
    subplot(1,2,1)
    contour(x,y,w,40,'-');
    view(2)
subplot(1,2,2)
mesh(x,y,w, 'FaceColor', 'interp', 'EdgeColor', 'none')
axis([-10 10 -9 9 -10 10]);
axis square;
s = sprintf('(Xc=%0.2f)',k);
ht = text(-16,11,0,s,'Color','black','Fontsize',15); pause(0.006);
end