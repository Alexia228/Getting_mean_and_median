function [mean] = getting_mean(Some_feloop) 
 E = Some_feloop.E.p(1:end/2); 
 P = Some_feloop.P.p(1:end/2);
 time = Some_feloop.ref.time.p(1:end/2);

 Current = diff(P)./diff(time)
 Current(end+1) = Current(end)
 
 mean = sum(Current.*E)/sum(Current);
    
end