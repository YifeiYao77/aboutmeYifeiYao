import numpy as np
a=np.array([7,9,5,2,9,4,3,1,4,3])
print('原数组：',a)
print('排序后：',a.argsort())
print('显示较大的5个数：',a[a.argsort()][-5:])
