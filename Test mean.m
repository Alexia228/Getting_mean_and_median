%%Test of getting mean function
clear
clc
addpath(genpath('D:\Alexey\PMN-20PT-2022'))
addpath('D:\Alexey\Getting_mean_and_median')
folder = "Output 2022_10_06/";

Sample.H = 85e-6; %m
Sample.S = 0.29/1000^2; %m^2
Sample.Gain = 20;

% Save_pics = false;
% 
% figure('position', [536 363 747 570])
% hold on

Temp_out = [];
k = 0;
file_number = 20
feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');

[Current] = current_from_charge(feloop)
[mean] = getting_mean(Current) 

%%
x = [-30:0.1:30];
y = 30*normpdf(x,10)
plot(x,y)
mean2 = sum(y.*x)/sum(y); 