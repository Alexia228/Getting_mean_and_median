%% Тест на I-E петлях
clear
clc
load('D:\Alexey\Getting_mean_and_median\feloop_for_error.mat')

%На 28 петле 99 процентиль - чо то не то!!!!!

Sample.H = 85e-6; %m
Sample.S = 0.29/1000^2; %m^2
Sample.Gain = 20;

Save_pics = false;

figure('position', [536 363 747 570])
hold on
     
    E = feloop.E.p(1:end/2);
    P = feloop.P.p(1:end/2);
    time = feloop.ref.time.p(1:end/2);
   
    Prcn_99 = getting_percentile_2(feloop, 0.99); % 99 процентиль явно должна быть не такой!!!!!!
    
    Current_1 = current_from_charge(feloop);  
    mean = getting_mean(Current_1);
    
    feloop_out = feloop;
    Freq_out = round(1/(2*feloop.period)*1000)/1000;
    
    Size = size(time, 1);
    Med_size = round(Size*0.00045);
    Move_size = round(Size*0.0045);
    if Med_size == 0
        Med_size = 1;
    end
    if Move_size == 0
        Move_size = 1;
    end
    
    E = medfilt1(E, Med_size);
    E = movmean(E, Move_size);
    P = medfilt1(P, Med_size);
    P = movmean(P, Move_size);
    
    Current = diff(P)./diff(time);
    Current = medfilt1(Current, Med_size);
    Current = movmean(Current, Move_size);
    Current(Current<0) = 0;
    
    cla
    plot(E(1:end-1), Current*feloop.period);
    xline(Prcn_99, 'ro')
  
    ylabel('P, uC/cm^2', 'FontSize', 14)
    xlabel('E, kV/cm', 'FontSize', 14)
    title(['f = ' num2str(Freq_out(k)) ' Hz'], 'FontSize', 18)
    

    grid on
    drawnow
    pause(0.1)
