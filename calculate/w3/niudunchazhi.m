clc; clear; close all;

%% 例4-12
% 插值节点
x = [1,2,3];  % 节点的x坐标
y = [1,3,2];  % 节点的y坐标
N = length(x);  % 插值节点数
x_new = 1.5;   % 待插值点

%% 构造差商表
ff = zeros(N,N);  % 差商表初始化
ff(:,1) = y';     % 差商表第1列是y值

for j = 2:N       % 列循环（计算j阶差商）
    for i = j:N   % 行循环（第i行的j阶差商）
        ff(i,j) = (ff(i,j-1) - ff(i-1,j-1)) / (x(i) - x(i-j+1));
    end
end

disp('差商表：');
disp(ff);

coef = diag(ff);  % 差商表对角线元素（牛顿插值多项式的系数）

%% 插值计算
N_new = coef(1);  % 初始值为0阶差商
for k = 2:N       % 累加各阶差商对应的项
    factor = 1;
    for m = 1:k-1  % 计算(x_new - x(1))(x_new - x(2))...(x_new - x(k-1))
        factor = factor * (x_new - x(m));
    end
    N_new = N_new + coef(k) * factor;
end

%% 输出结果
fprintf('在x = %.6f处的插值结果为：%.6f\n', x_new, N_new);