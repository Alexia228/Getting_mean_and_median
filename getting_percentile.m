function out = getting_percentile(some_feloop, Prcn)
if Prcn > 1 || Prcn < 0
    error(' 0 <= Prcn <= 1')
end


E = some_feloop.E.p;
P = some_feloop.P;

Min_P_posotive = prctile(P.p,1);
P_p_shift = P.p - Min_P_posotive; %Сдвигаем всю петлю вверх

Max_P_shift = prctile(P_p_shift,99); %Находим min и max значения
Min_P_shift = prctile(P_p_shift,1);

y_median = Prcn * (Max_P_shift - Min_P_shift); %y_медиана
out = interp1(P_p_shift, E, y_median, 'spline') %Медиана через пересечение функции и y_медианы


%  cla
%
%  plot(E.p,  P_p_shift, '.r')
%  plot(E.p, median, '.b');
%  set(gca, 'FontSize', 14)
%
%  xlim([-5 18])
%  ylim([-10 60])
%  grid on
%  drawnow



end