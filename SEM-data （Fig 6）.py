import pandas as pd
from semopy import Model, calc_stats
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
import statsmodels.formula.api as smf
import statsmodels.api as sm
from pygam import LinearGAM, s
import matplotlib.pyplot as plt
from scipy import stats
import matplotlib.pyplot as plt
import matplotlib
import openpyxl
print(openpyxl.__version__)

excel_file = r'C:\Users\Sakurathos\Desktop\桌面原有数据表格\SEM3.xlsx'

# 1.创建物种丰度矩阵 (22个站点 × 35个物种)
abundance_data = pd.read_excel(excel_file, sheet_name='Abundance', index_col=0)
species_columns = ['A' + str(i) for i in range(1, 18)]  # A1-A17
sites_index = ['S' + str(i) for i in range(1, 23)]
abundance = pd.DataFrame(abundance_data, columns=species_columns, index=sites_index)
print(abundance)

# 2.创建功能性状矩阵 (35物种 × 6性状)
traits_data = pd.read_excel(excel_file, sheet_name='Traits', index_col=0)
trait_columns = ['BS', 'MP', 'COC', 'TIP', 'TL', 'AL']
traits = pd.DataFrame(traits_data, columns=trait_columns, index=species_columns)
print(traits)

# 3.计算功能性状加权平均值
def weighted_trait(abund, trait_df):
    sums = abund.sum(axis=1)
    sums[sums == 0] = 1e-6  # 避免除以零
    relative_abundance = abund.div(sums, axis=0)
    return relative_abundance.dot(trait_df)

functional_traits = weighted_trait(abundance, traits)

# 4.创建环境因子矩阵
env_data = pd.read_excel(excel_file, sheet_name='Environment', index_col=0)
env_columns = ['WT', 'DO', 'SCon', 'Con', 'pH', 'NH4_N']
env_factors = pd.DataFrame(env_data, columns=env_columns, index=sites_index)
print(env_factors)

# 5.创建群落结构矩阵
community_data = community_structure = pd.read_excel(excel_file, sheet_name='Community', index_col=0)
community_columns = ['Diversity', 'Evenness', 'Richness']
community_structure = pd.DataFrame(community_data, columns=community_columns, index=sites_index)



# 6.合并数据并进行标准化
sem_data = pd.concat([env_factors, functional_traits, community_structure], axis=1)
scaler = StandardScaler()
sem_data_scaled = pd.DataFrame(scaler.fit_transform(sem_data), columns=sem_data.columns, index=sem_data.index)

from statsmodels.stats.outliers_influence import variance_inflation_factor
X = sm.add_constant(sem_data[['COC', 'AL', 'TIP']])
VIF = [variance_inflation_factor(X.values, i) for i in range(X.shape[1])]
print("修正后的VIF值:", VIF)

# 7.模型描述
model_desc = """
Trait =~ COC + AL +TIP
Trait ~ DO
Diversity ~ Trait
"""

# 初始化模型
model = Model(model_desc)

model.fit(sem_data_scaled, obj="WLS")


# 输出结果
estimates = model.inspect(std_est=True)
print("完整参数估计：\n", estimates)

# 拟合指标
stats = calc_stats(model)
print("\n拟合指标：\n", stats[['CFI', 'RMSEA', 'TLI']])

# 9.绘制路径系数图
path_estimates = estimates[estimates['op'] == '~']

plt.figure(figsize=(10, 6))
plt.barh(path_estimates['lval'] + ' ~ ' + path_estimates['rval'], path_estimates['Est. Std'])
plt.xlabel('Standardized Estimate')
plt.title('Path Coefficients')
plt.grid(True)
plt.tight_layout()
plt.show()

print(stats.keys)
print("\n推荐核心拟合指标：\n", stats)

