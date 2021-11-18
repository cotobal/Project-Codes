clc;
clear;

%% materials

%natural rubber = polyisoprene (non synthetic)
Temp_polyisoprene = 160+273.15 ; %kelvin
Temp_air = 20+273.15; %assumption
polyisopreneAtm = 1; %atm
%type of metal (P20 steel plate used)
k_p20 = 29; %w/mk
width_p20 = 0.810; %m
lenght_p20 = 1.100; %m
height_p20 = 0.085; %m
%walls insultaion: 
k_fiberglass = 0.04; %w/mk fiberglass with aluminium foil

%% Q change
width_Area = width_p20*height_p20;
lenght_Area = lenght_p20*height_p20;
top_Area = lenght_p20*width_p20;
%no insulation heat loss on width_Area
m= 8.65; %g/s
Cv_air = 0.718;% kJ/kg
U= Cv_air*Temp_air;
p=1.225;%air density
T_gradient = 1; %obtained with Ansys
q = -k_p20*T_gradient;
Tref=(1/m)*U*p*Temp_air*width_Area;
h=q/(Temp_polyisoprene-Tref);
Q_loss_width_Area_NO = h*width_Area*(Temp_polyisoprene-Temp_air);
Q_loss_length_Area_NO = h*lenght_Area*(Temp_polyisoprene-Temp_air);
Q_loss_top_Area_NO = h*top_Area*(Temp_polyisoprene-Temp_air);

fprintf('Q lost in the width Area without isolation is %d \n',Q_loss_width_Area_NO);
fprintf('Q lost in the lenght Area without isolation is %d \n',Q_loss_length_Area_NO);
fprintf('Q lost in the top and bottom Area without isolation is %d \n',Q_loss_top_Area_NO);

%introducing thickness w of insulator
% 1-(Qinsulator/QnoInsulator)=0.3
w_100percent_covered = ((7/3)*k_fiberglass*h)*1000;
fprintf('width of insulator if it was fully covered: %d mm\n',w_100percent_covered);

%top part
total_Area_a = 4*width_Area + 4*lenght_Area + 4*top_Area;
insulated_Area_a = (100*(total_Area_a-3*top_Area))/(total_Area_a);
% a to be 30%: 1-(Qinsulator/QnoInsulator)=0.3/0.365595
% a to be 30%: 1-(Qinsulator/QnoInsulator)=0.820579
w_a = ((4.573485)*k_fiberglass*h)*1000;
fprintf('width of insulator of top 2 plates to obtain 30 percent: %d mm\n',w_a);

%moving plate b
total_Area_b = 2*width_Area + 2*lenght_Area + 2*top_Area;
insulated_Area_b = (100*(total_Area_a-top_Area))/(total_Area_a);
% a to be 30%: 1-(Qinsulator/QnoInsulator)=0.3/0.788532
% a to be 30%: 1-(Qinsulator/QnoInsulator)=0.3804538888
w_b = ((1.628439)*k_fiberglass*h)*1000;
fprintf('width of insulator of moving plate to obtain 30 percent: %d mm\n',w_b);










