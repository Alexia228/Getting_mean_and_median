function [mean] = getting_mean(Current) %Current - структура с полями I,E,P,time. Все поля вычислены для положительной полуветви
%NOTE: I must be positive
I = Current.I;
E = Current.E.p;

mean = sum(I.*E)/sum(I);
end