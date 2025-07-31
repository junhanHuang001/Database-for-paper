#install.packages("vegan")
#install.packages("ggplot2")

library(vegan)
library(ggplot2)

#接下来期望通过NMDS，评估五种处理组中群落的物种组成差异水平。
##########################################################################
############################################################################
#otu <- read.csv('YBI.csv', row.names = 1)
theme(text = element_text(family = "Times New Roman"))

otu <- read.csv('C:/users/Sakurathos/Desktop/数据大全/自然城市-冬季物种分布.csv', header = TRUE, sep = ',', row.names = 1, fileEncoding = "UTF-8")
otu
# 将数据转换为矩阵格式，用于vegan包的分析
species_matrix <- as.matrix(otu)
# 创建Bray-Curtis距离矩阵
bray_curtis_matrix <- vegdist(otu, method = "bray", binary = FALSE, na.action = na.omit)
# 基于Bray-Curtis距离矩阵进行UPGMA聚类
?hclust
upgma_tree <- hclust(bray_curtis_matrix, method = "complete")
hclust_data <- list(
  merge = upgma_tree$merge,  # 合并矩阵
  height = upgma_tree$height,  # 高度向量
  order = upgma_tree$order,   # 树状图的叶顺序
  labels = upgma_tree$labels   # 标签
)
hclust_data

print(upgma_tree)
# 绘制UPGMA树状图
plot(upgma_tree, main = "UPGMA Dendrogram", sub = "", cex = 0.9, hang = 0.03)
rect.hclust(upgma_tree, k = 3, border = "red")



read.delim
nmds_otu <- metaMDS(otu, distance = 'bray', k = 3)#NMDS 排序，定义 2 个维度，详情 ?metaMDS
nmds_otu$stress#应力函数值，一般不大于 0.2 为合理
#样方得分
nmds_otu_site <- data.frame(nmds_otu$points)
#write.table(nmds_otu_site, 'nmds_otu_site.txt', sep = '\t', col.names = NA, quote = FALSE)

#物种得分，这种模式下可直接计算出物种得分，具体怎么算出来的，问作者吧……
#nmds_otu_species <- data.frame(nmds_otu$species)
#write.table(nmds_otu_species, 'nmds_otu_species.txt', sep = '\t', col.names = NA, quote = FALSE)

###ggplot2作图
#添加分组信息
nmds_otu_site$name <- rownames(nmds_otu_site)
nmds_otu_site$group <- c(rep('urban river', 3),rep('disorderly points', 1),rep('urban river', 7),rep('disorderly points', 1),rep('urban river', 10),rep('natural river', 22))
nmds_otu_site

p_winter <- ggplot(data = nmds_otu_site, aes(MDS1, MDS2)) +
  geom_point(aes(color = group)) +
  stat_ellipse(aes(fill = group), geom = 'polygon', level = 0.95, alpha = 0.1, show.legend = FALSE) +	#添加置信椭圆，注意不是聚类
  scale_color_manual(values = c('pink3', 'red3', 'orange3', 'green3', 'blue3')) +
  scale_fill_manual(values = c('pink3', 'red3', 'orange3', 'green3', 'blue3')) +
  theme(panel.grid.major = element_line(color = 'gray', size = 0.2), panel.background = element_rect(color = 'black', fill = 'transparent'), 
        plot.title = element_text(hjust = 0.5), legend.position = 'right') +
  geom_vline(xintercept = 0, color = 'gray', size = 0.5) +
  geom_hline(yintercept = 0, color = 'gray', size = 0.5) +
  labs(x = 'NMDS1', y = 'NMDS2', title = 'NMDS analysis in winter') +
  annotate('text', label = paste('Stress =', round(nmds_otu$stress, 4)), x = 0.4, y = 0.4, size = 4, colour = 'black')	#标注应力函数值



otu <- read.csv('C:/users/Sakurathos/Desktop/数据大全/自然城市-夏季物种分布.csv', header = TRUE, sep = ',', row.names = 1, fileEncoding = "UTF-8")
otu
# 将数据转换为矩阵格式，用于vegan包的分析
species_matrix <- as.matrix(otu)
# 创建Bray-Curtis距离矩阵
bray_curtis_matrix <- vegdist(otu, method = "bray", binary = FALSE, na.action = na.omit)
# 基于Bray-Curtis距离矩阵进行UPGMA聚类
upgma_tree <- hclust(bray_curtis_matrix, method = "complete")
hclust_data <- list(
  merge = upgma_tree$merge,  # 合并矩阵
  height = upgma_tree$height,  # 高度向量
  order = upgma_tree$order,   # 树状图的叶顺序
  labels = upgma_tree$labels   # 标签
)
hclust_data

print(upgma_tree)
# 绘制UPGMA树状图
plot(upgma_tree, main = "UPGMA Dendrogram", sub = "", cex = 0.9, hang = 0.03)
rect.hclust(upgma_tree, k = 2, border = "red")



read.delim
nmds_otu <- metaMDS(otu, distance = 'bray', k = 3)#NMDS 排序，定义 2 个维度，详情 ?metaMDS
nmds_otu$stress#应力函数值，一般不大于 0.2 为合理
#样方得分
nmds_otu_site <- data.frame(nmds_otu$points)
#write.table(nmds_otu_site, 'nmds_otu_site.txt', sep = '\t', col.names = NA, quote = FALSE)

#物种得分，这种模式下可直接计算出物种得分，具体怎么算出来的，问作者吧……
#nmds_otu_species <- data.frame(nmds_otu$species)
#write.table(nmds_otu_species, 'nmds_otu_species.txt', sep = '\t', col.names = NA, quote = FALSE)

###ggplot2作图
#添加分组信息
nmds_otu_site$name <- rownames(nmds_otu_site)
nmds_otu_site$group <- c(rep('urban river', 22),rep('natural river', 22))
nmds_otu_site

p_summer <- ggplot(data = nmds_otu_site, aes(MDS1, MDS2)) +
  geom_point(aes(color = group)) +
  stat_ellipse(aes(fill = group), geom = 'polygon', level = 0.95, alpha = 0.1, show.legend = FALSE) +	#添加置信椭圆，注意不是聚类
  scale_color_manual(values = c('pink3', 'red3', 'orange3', 'green3', 'blue3')) +
  scale_fill_manual(values = c('pink3', 'red3', 'orange3', 'green3', 'blue3')) +
  theme(panel.grid.major = element_line(color = 'gray', size = 0.2), panel.background = element_rect(color = 'black', fill = 'transparent'), 
        plot.title = element_text(hjust = 0.5), legend.position = 'right') +
  geom_vline(xintercept = 0, color = 'gray', size = 0.5) +
  geom_hline(yintercept = 0, color = 'gray', size = 0.5) +
  labs(x = 'NMDS1', y = 'NMDS2', title = 'NMDS analysis in summer') +
  annotate('text', label = paste('Stress =', round(nmds_otu$stress, 4)), x = 0.4, y = 0.4, size = 4, colour = 'black')	#标注应力函数值
p_summer
p_winter
pdf("nmds_analysis_combined.pdf", width = 18, height = 5.5)  # 创建一个PDF文件
grid.arrange(p_summer, p_winter, ncol = 2)  # 将两个图并排显示
dev.off()  # 关闭PDF设备
getwd()
