clc
clear
RND = @(l, u) rand(1)*(u-l) + l;

clc

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
y_shift = y - min(y)
y_med = (max(y) - min(y)) * 0.5
median = interp1(y_shift, x, y_med)
clearvars x1 x2 y1 y2


plot(x, y_shift)
hold on
plot(mid_point, - min(y), 'x')


loop.E.p = x;
loop.P.p = y;
loop.I = y;

med = getting_median(loop);
xline(med, 'r')

pr_v = 0.1;
prcn = getting_percentile(loop, pr_v)
xline(prcn, 'r')

% yline(y_med,'go')
% xline(median,'go')



















