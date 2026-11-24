import csv
f=open('white_wine.csv','r',encoding="utf-8")
reader=csv.reader(f)
data=[]
for row in reader:
    data.append(row)
for i in range(5):
    print(data[i])
f.close()
