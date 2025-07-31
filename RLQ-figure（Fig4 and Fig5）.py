import matplotlib
matplotlib.rcParams['pdf.fonttype'] = 42
import matplotlib.pyplot as plt
import matplotlib  # 新增
matplotlib.rcParams['font.family'] = 'Times New Roman'  # 全局设置字体

# 新 RLQ 分析结果
rlq_new_l1 = {
    'WT':   [0.74600173,  0.39074499],
    'DO':   [0.31647044, -0.13637742],
    'Scon': [0.09236856, -0.63967663],
    'Con':  [0.19182357, -0.59987937],
    'pH':   [0.14414910, -0.23168610],
    'NH4+-N': [0.52651750, -0.07745736]
}
rlq_new_c1 = {
    'BS':   [0.2260430,  0.5722997],
    'MP':  [-0.3045591,  0.1187460],
    'COC': [-0.4047849, -0.5291864],
    'TIP': [0.4935548,  0.1549013],
    'TL':  [-0.4739239,  0.2915832],
    'AL':  [0.4733892, -0.5189596]
}

# 原 RLQ 分析结果
rlq_old_l1 = {
    'WT':   [0.3097585,  0.2841652],
    'DO':   [-0.7841045, 0.3070979],
    'Scon': [-0.2854587, -0.3248801],
    'Con':  [-0.2756516, -0.3061246],
    'pH':   [0.2902587,  0.4196286],
    'NH4+-N': [0.2179663, -0.6705173]
}
rlq_old_c1 = {
    'BS': [0.3586475, 0.0728546],
    'MP': [0.1962857, 0.6269781],
    'COC': [-0.4769514, 0.2755233],
    'TIP': [0.5583342, 0.1034495],
    'TL': [0.0406840, 0.6914917],
    'AL': [0.5403416, -0.1918725]
}

fig, axes = plt.subplots(1, 2, figsize=(15, 7))

# ------- 左图：新数据 -------
ax = axes[0]
for var, coords in rlq_new_l1.items():
    ax.arrow(0, 0, coords[0], coords[1], head_width=0.03, head_length=0.03, fc='blue', ec='blue', length_includes_head=True)
    ax.text(coords[0]*1.1, coords[1]*1.1, var, color='blue', ha='center', va='center')
for trait, coords in rlq_new_c1.items():
    ax.arrow(0, 0, coords[0], coords[1], head_width=0.03, head_length=0.03, fc='red', ec='red', length_includes_head=True)
    ax.text(coords[0]*1.1, coords[1]*1.1, trait, color='red', ha='center', va='center')
ax.axhline(0, color='black', lw=0.5)
ax.axvline(0, color='black', lw=0.5)
ax.set_xlabel('RLQ Axis 1')
ax.set_ylabel('RLQ Axis 2')
ax.set_title('RLQ Biplot (新数据)')
ax.set_aspect('equal', adjustable='datalim')

# ------- 右图：原数据 -------
ax = axes[1]
for var, coords in rlq_old_l1.items():
    ax.arrow(0, 0, coords[0], coords[1], head_width=0.03, head_length=0.03, fc='blue', ec='blue', length_includes_head=True)
    ax.text(coords[0]*1.1, coords[1]*1.1, var, color='blue', ha='center', va='center')
for trait, coords in rlq_old_c1.items():
    ax.arrow(0, 0, coords[0], coords[1], head_width=0.03, head_length=0.03, fc='red', ec='red', length_includes_head=True)
    ax.text(coords[0]*1.1, coords[1]*1.1, trait, color='red', ha='center', va='center')
ax.axhline(0, color='black', lw=0.5)
ax.axvline(0, color='black', lw=0.5)
ax.set_xlabel('RLQ Axis 1')
ax.set_ylabel('RLQ Axis 2')
ax.set_title('RLQ Biplot (原数据)')
ax.set_aspect('equal', adjustable='datalim')

plt.tight_layout()
plt.savefig('C:/Users/Sakurathos/Desktop/新建文件夹 (3)/0609-英文数据/RLQ分析/heatmap_compare.pdf', format='pdf')
plt.show()
