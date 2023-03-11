function out = getting_percentile_2(feloop, Prcn)
%На вход прилетает петля и Prcn - процентиль от 0 до 1
%
%
%
if Prcn > 1 || Prcn < 0
    error(' 0 <= Prcn <= 1')
end

% E = feloop.E.p;
% P = feloop.P.p;
E = feloop.E.p(1:end/2); 
P = feloop.P.p(1:end/2);
 
Min_P = prctile(P, 1); %FIXME: magic constant
P_p_shift = P - Min_P; %Сдвигаем началом к нуля

Max_P_shift = prctile(P_p_shift,99); %Находим min и max значения %FIXME: magic constant
Min_P_shift = prctile(P_p_shift,1); %FIXME: magic constant

y_Prcn = Prcn * (Max_P_shift - Min_P_shift) + Min_P_shift; %y_процентиль
P_p_shift_down = P_p_shift - y_Prcn; %Сдвигаем всё вниз, чтобы y_процентиль обнулилась

[~, ind] = min(abs(P_p_shift_down)); %Находим индекс околонулевого элемента

left_border = ind - 3;            %Отступаем от околонулевого элемента на 3 туда и обратно
right_border = ind + 3;

if left_border < 1              %Проверка условий выхода за границы массива слева и справа
    left_border = 1;
end

if right_border > numel(P_p_shift_down)
    right_border = numel(P_p_shift_down);
end

Part_of_loop = P_p_shift_down(left_border : right_border) ; %Часть точек петли
grid_x1 = E(left_border : right_border); %Сетка для построения апроксимации

fitting_line = polyfit(grid_x1, Part_of_loop, 1); %Фиттинг

out = -fitting_line(2)/fitting_line(1);  %Нахождение нуля 1


end
