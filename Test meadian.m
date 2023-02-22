%%Test of getting median function
clc
% cd("F:\_OneDrive\YandexDisk\YandexDisk\Компьютер MAINHOMEPC\OneDrive - Personal\_RF\_Проекты\Temp-FEloop\Matlab2");
addpath('include');


folder = "Output 2022_10_06/";


Sample.H = 85e-6; %m
Sample.S = 0.29/1000^2; %m^2
Sample.Gain = 20;

Save_pics = false;


figure('position', [536 363 747 570])
hold on

Temp_out = [];
Freq_out = [];
Span_out = [];
Coercive_p_out = [];
Coercive_n_out = [];
Eps_out = [];
Res_out = [];
k = 0;
for file_number = 20:25
    feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');
    
    % FIXME: find switch uniform
    
%     disp(round(feloop.period*100)/100)
    E = feloop.E;
    P = feloop.P;

    [Span, Coercive] = get_loop_prop(feloop);
    
    k = k + 1;
    Temp_out(k) = feloop.temp;
    Freq_out(k) = round(1/(2*feloop.period)*1000)/1000;
    Span_out(k) = (Span.p + Span.n)/2;
    Coercive_p_out(k) = Coercive.p;
    Coercive_n_out(k) = Coercive.n;
    [Eps_out(k), ~, Res_out(k)] = find_eps(feloop);
    
    Min_P_posotive = prctile(P.p,1); %1 - я процентиль - значит 1% из всего массива меньше данного числа, а 99% - больше
    P_p_shift = P.p + abs(Min_P_posotive);
    median_2 = prctile(P_p_shift,99);
    
%     P_p_shift = P.p + abs(P.p(1));
%     P_n_shift = P.n + P.n(1);

    cla
    plot(E.p,  P_p_shift, '.r')                          
%     plot(E.n, P_n_shift, '.b')                         
    set(gca, 'FontSize', 14)

    xlim([-5 18])
    ylim([-10 60])
%     ylim([-10 80])
    ylabel('P, uC/cm^2', 'FontSize', 14)
    xlabel('E, kV/cm', 'FontSize', 14)
    title(['f = ' num2str(Freq_out(k)) ' Hz'], 'FontSize', 18)
%     title(['|' num2str(file_number) '| T = ' num2str(feloop.temp) ' C'], 'FontSize', 18)
    grid on
         
    drawnow
    pause(0.1)
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear
clc
addpath(genpath('D:\Alexey'))
folder = "Output 2022_10_06/";

Sample.H = 85e-6; %m
Sample.S = 0.29/1000^2; %m^2
Sample.Gain = 20;

Save_pics = false;

figure('position', [536 363 747 570])
hold on

Temp_out = [];
Freq_out = [];
Span_out = [];
Coercive_p_out = [];
Coercive_n_out = [];
Eps_out = [];
Res_out = [];
k = 0;
for file_number = 20:25
    feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');
  
    
    k = k + 1;
    Temp_out(k) = feloop.temp;
    Freq_out(k) = round(1/(2*feloop.period)*1000)/1000;
    
    
    [Eps_out(k), ~, Res_out(k)] = find_eps(feloop);
    
    [median] = getting_median(feloop);
    
    
%     P_p_shift = P.p + abs(P.p(1));
%     P_n_shift = P.n + P.n(1);

%     cla
%     plot(E.p,  P_p_shift, '.r')                          
%     plot(E.n, P_n_shift, '.b')                         

%     ylim([-10 80])
    ylabel('P, uC/cm^2', 'FontSize', 14)
    xlabel('E, kV/cm', 'FontSize', 14)
    title(['f = ' num2str(Freq_out(k)) ' Hz'], 'FontSize', 18)
%     title(['|' num2str(file_number) '| T = ' num2str(feloop.temp) ' C'], 'FontSize', 18)
    
end


