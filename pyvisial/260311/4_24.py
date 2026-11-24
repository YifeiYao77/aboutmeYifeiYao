import pandas as pd
data={'name':['张三','李四','王五','赵六'],
      'sex':['male','male','female','female'],
      'year':[2001,2003,2002,2000],
      'city':['北京','上海','北京','深圳']
      }
df1=pd.DataFrame(data,columns=['name','year','sex','city'])
df5=df1.set_index('city')
print(df5)

