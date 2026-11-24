import pandas as pd
import numpy as np
data={'fruit':['apple','banana','pear'],
      'price':['3元','4元','7元']}
df1=pd.DataFrame(data)
df2=pd.DataFrame(np.random.randn(3,3),
                 columns=['a','b','c'],
                 index=['x','y','z'])
print(df2)
s=df2.apply(np.mean)
print(s)
