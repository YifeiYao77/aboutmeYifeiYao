import numpy as np
ar1=np.arange(6).reshape(3,2)
ar2=ar1*2
print('横向合并为：',np.concatenate((ar1,ar2),axis=1))
print('纵向合并为：',np.concatenate((ar1,ar2),axis=0))