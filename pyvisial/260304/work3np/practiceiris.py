import numpy as np
import csv
ird=[]
with open("iris.csv") as csvfile:
    cr=csv.reader(csvfile)
    bh=next(cr)
    for row in cr:
        ird.append(row)
irl=[]
for r in ird:
    irl.append(tuple(row[1:]))
dt=np.dtype([("Sepal.Length",np.str_,40),("Sepal.Width",np.str_,40),("Petal.Length",np.str_,40),("Petal.Width",np.str_,40),("Species",np.str_,40)])
print(dt)
ird=np.array(irl,dtype=dt)
PL=ird["Petal.Length"].astype(float)
print(PL)
print(np.sort(PL))
print(np.unique(PL))
print(np.sum(PL))
print(np.mean(PL))
print(np.std(PL))
print(np.var(PL))
print(np.min(PL))
print(np.max(PL))
