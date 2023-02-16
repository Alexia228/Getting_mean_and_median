%Создаёт данные для токовых петель(берёт производную)
function [Current] = current_from_charge(Some_feloop) 

global E
global P
global time



 E = Some_feloop.E.p(1:end/2); 
 P = Some_feloop.P.p(1:end/2);
 time = Some_feloop.ref.time.p(1:end/2);
 Current = diff(P)./diff(time);
plot(E(1:end-1), Current*Some_feloop.period)
end 