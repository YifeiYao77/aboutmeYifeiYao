import pandas as pd
obj=pd.Series([7.4,-3,2.7,8.9],index=['a','b','c','d'])
print(obj)
newobj=obj.reindex(['a','b','c','d','e'])
print(newobj)