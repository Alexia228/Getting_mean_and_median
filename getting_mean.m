function [mean] = getting_mean(Some_feloop)
    E = Some_feloop.E;
    P = Some_feloop.P;
    cla
    plot(E.p, P.p, '.r')
    plot(E.n, P.n, '.b')
    
    xlim([-18 18])
    ylim([-40 40])
%     title(['T = ' num2str(Some_feloop.temp) ' °C'], 'FontSize', 18)   
%     drawnow
    mean = 6;
end