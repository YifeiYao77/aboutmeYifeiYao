import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 读取Excel文件（已修复引擎，兼容.xls和.xlsx）
fdata = pd.read_excel(r"E:\mycode\pyvisial\260311\tips.xls")
print(fdata.head())
print(fdata.describe())

# 重命名列
fdata.rename(columns={'total_bill':'消费总额','tip':'小费','sex':'性别','smoker':'是否吸烟',
                      'day':'星期','time':'聚餐时间段','size':'人数'},inplace=True)
print(fdata.head())

# 计算人均消费
fdata['人均消费'] = round(fdata['消费总额']/fdata['人数'],2)
print(fdata.head())

# 筛选数据
result1 = fdata[(fdata['是否吸烟']=='Yes')&(fdata['性别']=='Male')&(fdata['人均消费']>15)]
print(result1)

# 绘制散点图
fdata.plot(kind='scatter',x='消费总额',y='小费',title='消费总额与小费关系')
plt.show()

# 不同性别平均小费
gender_tip = fdata.groupby('性别')['小费'].mean(numeric_only=True)
print(gender_tip)

# 不同星期平均小费柱状图
day_tip = fdata.groupby('星期')['小费'].mean(numeric_only=True)
day_tip.plot(kind='bar',title='不同星期平均小费',fontsize=12,rot=30)
plt.show()

# 性别+吸烟对小费的影响
gender_smoker_tip = fdata.groupby(['性别','是否吸烟'])['小费'].mean(numeric_only=True)
gender_smoker_tip.plot(kind='bar',title='性别+吸烟对平均小费的影响',fontsize=12,rot=30)
plt.show()

# 不同时间段平均小费
time_tip = fdata.groupby('聚餐时间段')['小费'].mean(numeric_only=True)
time_tip.plot(kind='bar',title='不同聚餐时间段平均小费',fontsize=15,rot=30)
plt.show()