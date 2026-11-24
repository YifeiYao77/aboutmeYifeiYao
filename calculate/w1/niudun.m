% 牛顿迭代法
f = @(x) x.^3 - x.^2 - 1; 
df = @(x) 3*x.^2 - 2*x;      
x0 = 1.5;                    
tol = 0.5e-4;                
max_i = 20;               
i= 0;                
x_prev = x0;

while i < max_i
    f_prev = f(x_prev);
    df_prev = df(x_prev);
    if abs(df_prev) < eps  % 避免导数为0
        error('迭代点导数为0，迭代失败！');
    end
    x_curr = x_prev - f_prev/df_prev;
    i = i + 1;
    % 相对误差判断精度
    rel_err = abs(x_curr - x_prev)/max(abs(x_curr), eps);
    if rel_err < tol
        break;
    end
    x_prev = x_curr;
end
fprintf('=== 牛顿迭代法 ===\n');
fprintf('近似根（4位有效数字）：%.4g\n', x_curr);
fprintf('迭代次数：%d\n', i);