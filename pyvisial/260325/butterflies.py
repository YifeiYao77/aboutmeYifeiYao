# 自动生成蝴蝶形状遮罩图 (自动创建 data 文件夹 + myimg.jpg)
import numpy as np
from PIL import Image, ImageDraw
import os

# 自动创建 data 文件夹
if not os.path.exists("data"):
    os.mkdir("data")

# 创建白色背景画布
width, height = 800, 800
img = Image.new('RGB', (width, height), 'white')
draw = ImageDraw.Draw(img)

# 画蝴蝶形状（对称翅膀）
draw.ellipse((200, 100, 400, 500), fill='black')  # 左翅膀
draw.ellipse((400, 100, 600, 500), fill='black')  # 右翅膀
draw.ellipse((350, 300, 450, 600), fill='black')  # 身体

# 保存为蝴蝶遮罩图
img.save("data/myimg.jpg")
print("✅ 蝴蝶背景图已生成：data/myimg.jpg")