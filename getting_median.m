function [median] = getting_median(some_feloop)
 E = some_feloop.E;
 P = some_feloop.P;
 
 Min_P_posotive = prctile(P.p,1);
 P_p_shift = P.p + abs(Min_P_posotive); %Сдвигаем всю петлю вверх
 
 Max_P_shift = prctile(P_p_shift,99); %Находим min и max значения
 Min_P_shift = prctile(P_p_shift,1);
 
 median = 0.5 * (Max_P_shift - Min_P_shift); %Медиана
 
 
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