% 高斯赛德尔迭代法求解线性方程组 Ax = b


% 系数矩阵与右端向量
A = [10,-2,-1;
    -2,10,-1;
    -1,-1,5];
b = [3;15;10];

n = size(A,1);      % 方程组维度
eps = 1e-3;         % 精度要求
niter = 100;        % 最大迭代次数

%% 构造高斯赛德尔迭代矩阵
L = tril(A,-1);     % 严格下三角矩阵
D = diag(diag(A));  % 对角矩阵
U = triu(A,1);      % 严格上三角矩阵
GS = -inv(D+L)*U;   % 高斯赛德尔迭代矩阵
f = inv(D+L)*b;     % 常数项向量

%% 迭代求解
x0 = zeros(n,1);    % 初始解向量
for k = 1:niter
    x1 = GS * x0 + f;
    % 判断是否满足精度
    if norm(x1-x0, inf) < eps
        break;
    end
    x0 = x1;
end

% 输出结果
fprintf('高斯赛德尔迭代结果：\n');
disp(x1);