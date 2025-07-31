library(vegan)
library(labdsv)
# 读入数据
otu_summer <- read.csv('C:/users/Sakurathos/Desktop/数据大全/自然城市-夏季物种分布.csv', header = TRUE, sep = ',', row.names = 1, fileEncoding = "UTF-8")
otu_winter <- read.csv('C:/users/Sakurathos/Desktop/数据大全/自然城市-冬季物种分布.csv', header = TRUE, sep = ',', row.names = 1, fileEncoding = "UTF-8")

bray_summer <- vegdist(otu_summer, method = "bray", binary = FALSE, na.rm = TRUE)
tree_summer <- hclust(bray_summer, method = "complete")
bray_winter <- vegdist(otu_winter, method = "bray", binary = FALSE, na.rm = TRUE)
tree_winter <- hclust(bray_winter, method = "complete")

pdf("UPGMA_compare_final.pdf", width = 20, height = 7)
par(mfrow = c(1, 2), family = "Times")

# 夏季
plot(tree_summer, main = "UPGMA Dendrogram (Summer)", sub = " ", 
     xlab = "", ylab = "", cex = 0.9, hang = 0.03, font.main = 1, font.lab = 1, font.sub = 1)
rect.hclust(tree_summer, k = 2, border = "red")

# 冬季
plot(tree_winter, main = "UPGMA Dendrogram (Winter)", sub = " ", 
     xlab = "", ylab = "", cex = 0.9, hang = 0.03, font.main = 1, font.lab = 1, font.sub = 1)
rect.hclust(tree_winter, k = 3, border = "red")

dev.off()
par(mfrow = c(1, 1))