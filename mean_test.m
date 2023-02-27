
RND = @(l, u) rand(1)*(u-l) + l;

clc

%  Create test E-P uniform
start = 0;
stop = RND(3, 5);
span = stop-start;

step = RND(0.001, 0.01);
amp = RND(0.4, 2);


mu = RND(start+0.1*span, stop - 0.1*span);
sigma = RND(0.05, 0.3);
x = start : step : stop;
y = amp*normpdf(x, mu, sigma);




plot(x, y)
hold on
plot(mu, 0, 'x')


loop.E.p = x;
loop.P.p = y;
loop.I = y;

mn = getting_mean(loop)

xline(mn)

















