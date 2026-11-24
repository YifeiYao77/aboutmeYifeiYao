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
for key in content_dict:
    print(key,":",len(content_dict[key]))
    