import pandas as pd
data={'name':['张三','李四','王五','赵六'],
      'sex':['male','male','female','female'],
      'year':[2001,2003,2002,2000],
      'city':['北京','上海','北京','深圳']
      }
df=pd.DataFrame(data)

print(df)
print("显示前两行:\n",df[:2])
print("显示2-3行:\n",df[1:3])
