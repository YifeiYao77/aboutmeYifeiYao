% 顺序高斯消元法
% 系数矩阵A和右端向量b
A = [2, -1, 3; 4, 2, 5; 1, 2, 0];  % 3阶系数矩阵
b = [1; 4; 7];                     % 右端常数项
n = size(A, 1);                     % 方程组阶数（行数）

%% 消元过程
for k = 1:n-1  % 第k次消元
    for i = k+1:n  % 对第k行以下的行消元
        m = A(i, k) / A(k, k);  % 消元乘数
        % 更新系数矩阵A的第i行（从第k列开始）
        A(i, k:n) = A(i, k:n) - m * A(k, k:n);
        % 更新右端向量b的第i个元素
        b(i) = b(i) - m * b(k);
    end
end

%% 回代过程
x = zeros(n, 1);  % 初始化解向量
x(n) = b(n) / A(n, n);  % 求最后一个解x(n)

% 从倒数第二行向上回代
for i = n-1:-1:1
    sum_val = 0;
    for j = i+1:n
        sum_val = sum_val + A(i, j) * x(j);  % 计算已求变量的和
    end
    x(i) = (b(i) - sum_val) / A(i, i);  % 求当前变量x(i)
end

% 输出结果
disp('解向量x：');
disp(x);