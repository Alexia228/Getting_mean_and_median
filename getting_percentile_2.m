function out = getting_percentile_2(some_feloop, Prcn)
%На вход прилетает петля и Prcn - процентиль от 0 до 1
%
%
%
if Prcn > 1 || Prcn < 0
    error(' 0 <= Prcn <= 1')
end

E = some_feloop.E.p;
P = some_feloop.P.p;

Min_P_positive = prctile(P,1);
P_p_shift_up = P - Min_P_positive; %Сдвигаем всю петлю вверх

Max_P_shift = prctile(P_p_shift_up,99); %Находим min и max значения
Min_P_shift = prctile(P_p_shift_up,1);

y_Prcn = Prcn * (Max_P_shift - Min_P_shift); %y_процентиль
P_p_shift_down = P_p_shift_up - y_Prcn %Сдвигаем всё вниз, чтобы y_процентиль обнулилась

[~,I] = min(abs(P_p_shift_down)); %Находим индекс околонулевого элемента

left_border = I - 3;            %Отступаем от околонулевого элемента на 3 туда и обратно
right_border = I + 3;

if left_border < 1              %Проверка условий выхода за границы массива слева и справа
left_border = 1;
end

if right_border > numel(P_p_shift_down)
right_border = numel(P_p_shift_down);
end

Part_of_loop = P_p_shift_down(left_border : right_border) ; %Часть точек петли
grid_x1 = E(left_border : right_border); %Сетка для построения апроксимации
           

fitting_line = polyfit(grid_x1,Part_of_loop,1); %Фиттинг

out = -fitting_line(2)/fitting_line(1);  %Нахождение нуля 1


end
