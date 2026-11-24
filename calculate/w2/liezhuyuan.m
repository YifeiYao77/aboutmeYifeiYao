% 列主元高斯消元法（匹配统一思路：分开A和b，无增广矩阵）
% 系数矩阵A和右端向量b（与顺序消元用同一矩阵，方便对比）
A = [2, -1, 3; 4, 2, 5; 1, 2, 0];  % 3阶系数矩阵
b = [1; 4; 7];                     % 右端常数项
n = size(A, 1);                     % 方程组阶数（行数）

%% 消元过程（核心：选列主元→交换行→消元）
for k = 1:n-1  % 第k次消元（处理第k列主元）
    % 1. 选列主元：找到第k列从第k行开始的最大元素所在行
    [max_abs, max_row] = max(abs(A(k:n, k)));  % 找绝对值最大的元素及局部索引
    max_row = max_row + k - 1;  % 转换为全局行索引（因为A(k:n,k)是局部切片）
    
    % 2. 交换主元行与当前第k行（同时交换A和b的对应行）
    if max_row ~= k  % 主元行不是当前行时才交换
        % 交换A的行
        temp_A = A(k, :);
        A(k, :) = A(max_row, :);
        A(max_row, :) = temp_A;
        % 交换b的元素
        temp_b = b(k);
        b(k) = b(max_row);
        b(max_row) = temp_b;
    end
    
    % 3. 检查主元是否为0（列主元后仍为0则矩阵奇异，无唯一解）
    if A(k, k) == 0
        error('系数矩阵奇异，无唯一解！');
    end
    
    % 4. 消元操作（和顺序消元完全一致）
    for i = k+1:n
        m = A(i, k) / A(k, k);  % 消元乘数
        A(i, k:n) = A(i, k:n) - m * A(k, k:n);  % 更新A的第i行
        b(i) = b(i) - m * b(k);                  % 更新b的第i个元素
    end
end

%% 回代过程
x = zeros(n, 1);  % 初始化解向量
x(n) = b(n) / A(n, n);  % 最后一个解直接求解

% 从倒数第二行向上回代
for i = n-1:-1:1
    sum_val = 0;
    for j = i+1:n
        sum_val = sum_val + A(i, j) * x(j);  % 累加已求变量的乘积和
    end
    x(i) = (b(i) - sum_val) / A(i, i);  % 求解当前变量
end

% 输出结果
disp('列主元高斯消元法解向量x：');
disp(x);