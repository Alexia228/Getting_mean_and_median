clc
clear
addpath('include');

folder = "Data/";

Sample.H = 35e-6; %m
Sample.S = 0.126e-6; %m^2
Sample.Gain = 20;

figure('position', [536 200 747 570])
set(gca, 'FontSize', 14)
ylabel('P, uC/cm^2', 'FontSize', 14)
xlabel('E, kV/cm', 'FontSize', 14)

grid on
hold on

Temp_out = [];

k = 0;
for file_number = 21:80
    feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');
   
    [Ec1,Ec2,Loop_span] = getting_info(feloop);
    EcP(file_number-20) = Ec1;
    EcN(file_number-20) = Ec2;
    loop_span(file_number-20) = Loop_span
    
  
    E = feloop.E;
    P = feloop.P;
    
    k = k + 1;
    Temp_out(k) = feloop.temp;
    
    cla
    plot(E.p, P.p, '.r')
    plot(E.n, P.n, '.b')
    
    xlim([-18 18])
    ylim([-40 40])
    title(['T = ' num2str(feloop.temp) ' °C'], 'FontSize', 18)
    
    
    drawnow
    
    
   
    
   %pause(0.1)
end


clearvars k P E file_number folder 

%%
%  [M,I] = min(abs(feloop.P.p))
%  for k = I-3 : I+3
%      Part_of_loop(1,k-271) = (feloop.P.p(k))
%  end
%  grid on
%  hold on
%  grid_x1 = [1,2,3,4,5,6,7];
%  plot(grid_x1,Part_of_loop,'o')
%  
%  fitting_line = polyfit(grid_x1,Part_of_loop,1);
%  grid_x2 = 0 : 10;
%  y1 = fitting_line(1)*grid_x2+fitting_line(2);
%  
%  Ec_positive = -fitting_line(2)/fitting_line(1)
%  plot(Ec_positive,0, 'o');
%  plot(grid_x2,y1);



 




















