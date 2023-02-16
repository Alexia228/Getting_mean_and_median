function [mean] = getting_mean(Current) %Current - структура с полями I,E,P,time. Все поля вычислены для положительной полуветви
 mean = sum(Current.I.*Current.E)/sum(Current.I);
end