import pandas as pd
data={'name':['张三','李四','王五','赵六'],
      'sex':['male','male','female','female'],
      'year':[2001,2003,2002,2000],
      'city':['北京','上海','北京','深圳']
      }
df=pd.DataFrame(data)

print("显示前两列:\n",df.iloc[:,2])
print("显示第1行和第3行:\n",df.iloc[[1,3]])

