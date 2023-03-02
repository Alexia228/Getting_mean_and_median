clc
clear
RND = @(l, u) rand(1)*(u-l) + l;


%  Create test E-P uniform
start = 0;
stop = RND(3, 5);
span = stop-start;
mid_point = RND(start+0.2*span, stop - 0.3*span);
step = RND(0.001, 0.01);
amp = RND(2, 3);


k1 = amp/(mid_point - start);
k2 = amp/(stop - mid_point);

x1 = start : step : mid_point;
x2 = mid_point : step : stop;

y1 = k1*(x1 - mid_point);
y2 = k2*(x2 - mid_point);

x = [x1 x2];
y = [y1 y2] + 0.0;
mid_shift = -min(y);
y = y - min(y)

p = 1/2;

y_m = max(y)*p;
% y = y - y_m

clearvars x1 x2 y1 y2


plot(x, y)
hold on
plot(mid_point, mid_shift , 'x')
yline(y_m)


loop.E.p = x;
loop.P.p = y;
loop.I = y;

med = getting_median(loop);

yline(med)


getting_mean(loop)

y2 = y;
y2 = y2 - min(y2);

sum(y2.*x)/sum(y2)


















