%%Test of getting median function
clc
addpath(genpath('D:\Alexey\PMN-20PT-2022'))
folder = "Output 2022_10_06/";


Sample.H = 85e-6; %m
Sample.S = 0.29/1000^2; %m^2
Sample.Gain = 20;

Save_pics = false;

figure('position', [536 363 747 570])
hold on

Temp_out = [];
file_number = 35;
feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');
[m] = getting_mean(feloop)