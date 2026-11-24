%二分法
f=@(x) x^3-x-1;%f(x)
a=1;b=1.5;%初始有限区间
eps=0.5e-3;%精度

while 1
    x=(a+b)/2;%取中点
    %判断有根子区间
    
    if f(a)*f(b)<0
        %异号代表在区间内
        b=x;%更新区间
    else
        a=x;
    end
%停止条件（迭代是否停止:误差<精度）
    if b-a<eps
        break;
    end
end

fprintf('x=%.3f \n',x);
 

