import pandas as pd
v=[2,4,5,6]
idx1=range(10,14)
idx2="hello world haha eeeeeee".split()
s0=pd.Series(v)
s1=pd.Series(v,index=idx1)
t=pd.Series(v,index=idx2)
print(s0.index)
print(s1.index)
print(t.index)
print(s0[0])
print(s1[10])
print('default:',t.iloc[0],'lable:',t["hello"])
