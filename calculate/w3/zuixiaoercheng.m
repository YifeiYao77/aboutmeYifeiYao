%% 最小二乘：polyfit函数
x = [0, 0.2, 0.4, 0.6, 0.8];   % 自变量数据
y = [0.9, 1.9, 2.8, 3.3, 4.2]; % 因变量数据

% 1. 用polyfit做1次（线性）拟合：pp为拟合多项式的系数（pp(1)是斜率，pp(2)是截距）
pp = polyfit(x, y, 1);

% 2. 用拟合多项式预测新的x值对应的y值
x_fit = linspace(min(x), max(x), 50); % 生成更密集的x点用于绘图
y_fit = polyval(pp, x_fit);           % 预测对应的y值

% 3. 绘图：对比原始数据与拟合曲线
figure;
plot(x, y, 'bo', 'MarkerSize', 8);  % 原始数据点（蓝色圆点）
hold on;
plot(x_fit, y_fit, 'r-', 'LineWidth', 2); % 拟合曲线（红色实线）
xlabel('x');
ylabel('y');
title('最小二乘线性拟合结果');
legend('原始数据', '线性拟合曲线');
grid on;

% 4. 输出拟合结果
fprintf('拟合的线性方程：y = %.4f x + %.4f\n', pp(1), pp(2));