%区间二分法
f = @(x) x.^3 - x.^2 - 1;  
a = 1; b = 2;                
tol = 0.5e-4;                
max_i = 50;               
i= 0;               
while i < max_i
    c = (a + b)/2;
    i = i + 1;
    if abs(b - a) < tol  % 区间长度满足精度
        break;
    end
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end
fprintf('=== 区间二分法 ===\n');
fprintf('近似根（4位有效数字）：%.4g\n', c);
fprintf('二分次数：%d\n\n', i);