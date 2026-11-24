% 插值节点
x = [1,3,2];  % 节点的x坐标
y = [1,2,-1]; % 对应节点的y坐标
N = length(x); % 节点个数（n+1个节点，对应n次插值多项式）
x_new = 1.5;  % 待插值的点

% 拉格朗日插值计算
L = 0;  % 初始化插值结果
for k = 1:N
    lk = 1;  % 初始化第k个基函数
    % 计算第k个拉格朗日基函数 lk(x_new)
    for i = 1:N
        if i ~= k  % 跳过i=k的情况
            lk = lk * (x_new - x(i)) / (x(k) - x(i));
        end
    end
    L = L + lk * y(k);  % 累加基函数×对应y值
end

% 输出插值结果
disp(['x=',num2str(x_new),'处的插值结果为：',num2str(L)]);