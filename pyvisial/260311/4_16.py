import pandas as pd
data={'name':['张三','李四','王五','赵六'],
      'sex':['male','male','female','female'],
      'year':[2001,2003,2002,2000],
      'city':['北京','上海','北京','深圳']
      }
df=pd.DataFrame(data)

print(df)
print("表中所有值为:\n",df.values)
print("表中所有列为:\n",df.columns)
print("表中元素个数为:\n",df.size)
print("表的维度为:\n",df.ndim)
print("表的形状为:\n",df.shape)