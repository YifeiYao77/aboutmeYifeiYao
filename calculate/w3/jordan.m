% 高斯-若当消元法（直接法）求解线性方程组 Ax = b
clear; clc;

% 系数矩阵与右端向量
A = [10,-2,-1;
    -2,10,-1;
    -1,-1,5];
b = [3;15;10];

aug = [A, b];       % 构造增广矩阵
n = size(A,1);

%% 高斯-若当消元（将系数矩阵化为单位矩阵）
for k = 1:n
    % 选主元（避免除以0）
    [~, pivot] = max(abs(aug(k:n, k)));
    pivot = pivot + k - 1;
    aug([k, pivot], :) = aug([pivot, k], :);  % 交换行
    
    % 归一化当前行
    aug(k, :) = aug(k, :) / aug(k, k);
    
    % 消去其他行的第k列元素
    for i = 1:n
        if i ~= k
            aug(i, :) = aug(i, :) - aug(i, k) * aug(k, :);
        end
    end
end

x = aug(:, end);    % 解向量

% 输出结果
fprintf('高斯-若当消元法结果：\n');
disp(x);