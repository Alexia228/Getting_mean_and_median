%Создаёт данные для токовых петель(берёт производную)
function [Current] = current_from_charge(Some_feloop) 

 E = Some_feloop.E.p(1:end/2); 
 P = Some_feloop.P.p(1:end/2);
 time = Some_feloop.ref.time.p(1:end/2);
 Current.I = diff(P)./diff(time);
 Current.I(end+1) = Current.I(end)
 Current.E = E; %Только E.p
 Current.P = P; %Только P.p
 Current.time = time
 
end 