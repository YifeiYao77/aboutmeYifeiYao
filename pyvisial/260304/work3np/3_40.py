import numpy as np
a=np.array([[7,9,5,2],[9,4,3,1],[1,6,4,3]])
print('原数组：\n',a)
a.sort(axis=1)
print('横向排序后：\n',a)


