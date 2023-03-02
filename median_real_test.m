clc
addpath('include');
addpath('D:\Alexey\Getting_mean_and_median');

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
for file_number = 20:28
    feloop = open_dwm_fe_loop(Sample, folder, file_number, 'align');
    
    Prcn_50 = getting_percentile_2(feloop, 0.5);
    Prcn_90 = getting_percentile_2(feloop, 0.9);
    
    E = feloop.E;
    P = feloop.P;

    [Span, Coercive] = get_loop_prop(feloop);
    
    k = k + 1;
    Temp_out(k) = feloop.temp;
    Freq_out(k) = round(1/(2*feloop.period)*1000)/1000;
    Span_out(k) = (Span.p + Span.n)/2;
    
    [Eps_out(k), ~, Res_out(k)] = find_eps(feloop);

    cla
    plot(E.p, P.p, '.r')
    xline(Prcn_50, 'ro')
    xline(Prcn_90, 'bo')
%      plot(feloop.init.E.p, feloop.init.P.p, '.k')
%      plot(feloop.ref.E.p, feloop.ref.P.p, '.b')
    plot(E.n, P.n, '.b')
    set(gca, 'FontSize', 14)
    
    xlim([-18 18])
    ylim([-40 40])
%     ylim([-10 80])
    ylabel('P, uC/cm^2', 'FontSize', 14)
    xlabel('E, kV/cm', 'FontSize', 14)
    title(['f = ' num2str(Freq_out(k)) ' Hz'], 'FontSize', 18)
%     title(['|' num2str(file_number) '| T = ' num2str(feloop.temp) ' C'], 'FontSize', 18)
    grid on
    
    
    drawnow
    pause(0.1)
    
end

clearvars E P Span Coercive max_file_number
clearvars pic_folder pic_filename k file_number folder


