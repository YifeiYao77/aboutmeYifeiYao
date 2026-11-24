import csv
f=open('white_wine.csv','r',encoding="utf-8")
reader=csv.reader(f)
data=[]
for row in reader:
    data.append(row)
ql=[]
for row in data[1:]:
    ql.append(int(row[-1]))
qc=set(ql)
print("白葡萄酒一共有%d种等级，分别是：%r"%(len(qc), qc))
