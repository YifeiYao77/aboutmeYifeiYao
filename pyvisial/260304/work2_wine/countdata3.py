import csv
f=open('white_wine.csv','r',encoding="utf-8")
reader=csv.reader(f)
data=[]
for row in reader:
    data.append(row)
content_dict={}
for row in data[1:]:
    q=int(row[-1])
    if q not in content_dict.keys():
        content_dict[q]=[row]
    else:
        content_dict[q].append(row)
ml=[]
for key,value in content_dict.items():
    s=0
    for row in value:
        s+=float(row[0])
    ml.append((key,s/len(value)))
for i in ml:
    print(i[0],":",i[1])
    