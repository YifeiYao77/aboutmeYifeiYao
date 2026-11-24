% 不动点迭代法
phi = @(x) (x.^2 + 1).^(1/3);  
x0 = 1.5;                        
tol = 0.5e-4;                   
max_i = 50;                   
i = 0;                   
x_prev = x0;
% 核心迭代逻辑
while i < max_i
    x_curr = phi(x_prev);
    i = i + 1;
    % 相对误差判断精度
    rel_err = abs(x_curr - x_prev)/max(abs(x_curr), eps);
    if rel_err < tol
        break;
    end
    x_prev = x_curr;
end

% 输出结果
fprintf('=== 不动点迭代法 ===\n');
fprintf('近似根（4位有效数字）：%.4g\n', x_curr);
fprintf('迭代次数：%d\n\n', i);