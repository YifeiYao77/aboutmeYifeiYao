import pandas as pd
import numpy as np

# 读取数据（假设文件名为 testdata.xls）
data = pd.read_excel('testdata.xls')
# 例4-56：transform方法（按性别和是否吸烟分组，计算血小板计数的组内均值）
r1=data.groupby(['性别', '是否吸烟'])['血小板计数'].transform('mean').sample(5)
print(r1)
# 例4-57：apply方法（按性别和是否吸烟分组，计算血小板计数的均值）
r2=data.groupby(['性别', '是否吸烟'])['血小板计数'].apply(np.mean)
print(r2)
