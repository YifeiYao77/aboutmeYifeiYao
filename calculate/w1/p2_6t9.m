% 定义迭代函数 phi(x)（求解方程 x^3 - x^2 - 0.8 = 0 的根）
phi = @(x) (x.^2 + 0.8).^(1/3);

% 初始值
x0 = 1.5;
% 4位有效数字的相对误差限（核心修正：用相对误差代替固定绝对误差）
rel_tol = 0.5e-4;  % 4位有效数字对应的相对误差上限
% 迭代次数初始化
k = 0;
% 存储迭代值和误差
x_iter = x0;
err_iter = [];

fprintf('迭代次数\t迭代值\t\t绝对误差\t相对误差\n');
fprintf('%d\t\t%.6f\t\t-\t\t-\n', k, x0);

while true
    x1 = phi(x0);
    k = k + 1;
    
    % 计算绝对误差和相对误差（相对误差避免x0=0的情况）
    abs_err = abs(x1 - x0);
    rel_err = abs_err / max(abs(x1), abs(x0));  % 用max避免分母为0
    
    x_iter = [x_iter, x1];
    err_iter = [err_iter, rel_err];
    
    % 输出迭代过程（保留6位小数，便于观察）
    fprintf('%d\t\t%.6f\t\t%.6e\t%.6e\n', k, x1, abs_err, rel_err);
    
    % 核心修正：用相对误差判断4位有效数字（满足相对误差限则停止）
    if rel_err < rel_tol
        break;
    end
    
    % 防止迭代发散或死循环（添加最大迭代次数限制）
    if k >= 50
        fprintf('\n迭代达到最大次数50，可能发散！\n');
        break;
    end
    
    x0 = x1;
end

% 最终输出4位有效数字（用%.4g确保严格按有效数字计数）
fprintf('\n满足4位有效数字的近似根为：%.4g\n', x1);
fprintf('最终相对误差：%.6e（小于4位有效数字要求的%.6e）\n', rel_err, rel_tol);