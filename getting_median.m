%TODO: 
% 1. Реализовать прогонку массива P.p через функцию unique для корректной
% работы функции interp1. При этом исключить соответсвующие элементы из E.p
% ([x, ind] = unique(x); y = y(ind);)
%
% 2. Проверить, что после первого пункта в E.p осталось больше одного элемента
% 

%FIXME: replace by getting_percentile(some_feloop, 0.5)

function median = getting_median(some_feloop)
 E = some_feloop.E.p;
 P = some_feloop.P;
 
 Min_P_posotive = prctile(P.p,1);
 P_p_shift = P.p - Min_P_posotive; %Сдвигаем всю петлю вверх

 Max_P_shift = prctile(P_p_shift,99); %Находим min и max значения
 Min_P_shift = prctile(P_p_shift,1);
 
  y_median = 0.5 * (Max_P_shift - Min_P_shift); %y_медиана
  median = interp1(P_p_shift, E, y_median, 'spline') %Медиана через пересечение функции и y_медианы
 
 
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