######加载库######
library(vegan)
library(ade4)
library(ggplot2)
library(ggrepel)
library(ggpubr)

######加载数据######
spe<-read.csv("C:/users/Sakurathos/Desktop/新建文件夹 (3)/0609-英文数据/RLQ分析/0711样方-物种城市.csv",header = T,row.names = 1)
env<-read.csv("C:/users/Sakurathos/Desktop/新建文件夹 (3)/0609-英文数据/RLQ分析/0711样方-环境城市.csv",header = T,row.names = 1)
traits<-read.csv("C:/users/Sakurathos/Desktop/新建文件夹 (3)/0609-英文数据/RLQ分析/0711物种-性状城市.csv",header = T,row.names = 1)


######对三个矩阵进行主成分分析#######
afcL.aravo <- dudi.coa(spe, scannf = FALSE)
#对环境因子执行特殊的主成分分析(Hill-Smith)
acpR.aravo <- dudi.hillsmith(env,                              
                             row.w = afcL.aravo$lw,                             
                             scannf = FALSE)
#对性状执行主成分分析(PCA)
acpQ.aravo <- dudi.pca(traits,                        
                       row.w = afcL.aravo$cw,                       
                       scannf = FALSE)
######RLQ分析#####
rlq.aravo <- rlq(  
  dudiR = acpR.aravo,   
  dudiL = afcL.aravo,   
  dudiQ = acpQ.aravo,  
  scannf = FALSE)
######RLQ分析的物种分数######
rlq.aravo <- rlq(  
  dudiR = acpR.aravo,   
  dudiL = afcL.aravo,   
  dudiQ = acpQ.aravo,  
  scannf = FALSE)

s.label(rlq.aravo$lR)
# 物种得分
s.label(rlq.aravo$lQ)
# 环境因子
s.arrow(rlq.aravo$l1)
# 物种性状
s.arrow(rlq.aravo$c1)

rlq.aravo$lR
rlq.aravo$lQ
rlq.aravo$l1
rlq.aravo$c1

######RLQ箭头分析图（用python重新画了）######
s.arrow(rlq.aravo$l1, 
        xax = 1,                   # x 轴对应的变量
        yax = 2,                   # y 轴对应的变量
        label = row.names(rlq.aravo$l1),   # 标签显示数据框的行名
        clabel = 1,                # 标签的字体大小
        pch = 10,                  # 设置点的符号类型
        cpoint = 0,                # 点的大小
        boxes = TRUE,              # 是否显示框
        edge = TRUE,               # 是否显示框的边缘
        origin = c(0,0),           # 设置原点的位置
        xlim = NULL,               # 设置 x 轴的范围（如果需要调整）
        ylim = NULL,               # 设置 y 轴的范围（如果需要调整）
        grid = F,               # 启用网格
        addaxes = TRUE,            # 是否添加坐标轴
        cgrid = 1,                 # 网格的颜色
        sub = "环境因子在RLQ分析双序图",                  # 设置子标题
        csub = 1.25,               # 子标题的字体大小
        possub = "bottomright",     # 子标题位置
        pixmap = NULL,             # 用于背景的像素图
        contour = NULL,            # 是否添加等高线
        area = NULL,               # 可选区域（可根据需要调整）
        add.plot = FALSE)          # 是否将图添加到现有图形中

s.arrow(rlq.aravo$c1, 
        xax = 1,                   # x 轴对应的变量
        yax = 2,                   # y 轴对应的变量
        label = row.names(rlq.aravo$c1),   # 标签显示数据框的行名
        clabel = 1,                # 标签的字体大小
        pch = 10,                  # 设置点的符号类型
        cpoint = 0,                # 点的大小
        boxes = TRUE,              # 是否显示框
        edge = TRUE,               # 是否显示框的边缘
        origin = c(0,0),           # 设置原点的位置
        xlim = NULL,               # 设置 x 轴的范围（如果需要调整）
        ylim = NULL,               # 设置 y 轴的范围（如果需要调整）
        grid = F,               # 启用网格
        addaxes = TRUE,            # 是否添加坐标轴
        cgrid = 1,                 # 网格的颜色
        sub = "功能性状在RLQ分析双序图",                  # 设置子标题
        csub = 1.25,               # 子标题的字体大小
        possub = "bottomright",     # 子标题位置
        pixmap = NULL,             # 用于背景的像素图
        contour = NULL,            # 是否添加等高线
        area = NULL,               # 可选区域（可根据需要调整）
        add.plot = F)          # 是否将图添加到现有图形中
######RLQ两轴得分######
AxcR1 <- round((rlq.aravo$eig[1] / sum(rlq.aravo$eig)),2)
AxcR2 <- round((rlq.aravo$eig[2] / sum(rlq.aravo$eig)),2)
AxcR1
AxcR2
######RLQ整体分析图（没用到）######
site<-rlq.aravo$lR
otu<-rlq.aravo$lQ
chem<-rlq.aravo$l1*6
trait<-rlq.aravo$c1*6

p <- ggplot() +
  geom_point(data = site, aes(AxcR1, AxcR2),  colour = "#f57c6e",size = 4) +
  
  geom_segment(data = otu, aes(x = 0, y = 0, xend = AxcQ1, yend = AxcQ2),                
               arrow = arrow(angle = 22.5, length = unit(0.35, "cm"),                              
                             type = "closed"),               
               linetype = 1, size = 0.6, colour = "#b8aeeb") +  
  geom_text_repel(data = otu, aes(AxcQ1, AxcQ2, label = row.names(otu))) +
  
  geom_segment(data = chem, aes(x = 0, y = 0, xend = RS1, yend = RS2),                
               arrow = arrow(angle = 22.5, length = unit(0.35, "cm"), 
                             type = "closed"),               
               linetype = 1, size = 0.6, colour = "#e6a84b") +  
  geom_text_repel(data = chem, aes(RS1, RS2, label = row.names(chem))) +
  
  geom_segment(data = trait, aes(x = 0, y = 0, xend = CS1, yend = CS2),               
               arrow = arrow(angle = 22.5, length = unit(0.35, "cm"),                              
                             type = "closed"),               
               linetype = 1, size = 0.6, colour = "#972b1d") +  
  geom_text_repel(data = trait, aes(CS1, CS2, label = row.names(trait))) +
  
  labs(x = "RLQ1 86.00%", y = "RLQ2 9.00%") +
  #修改为自己的解释率  
  geom_hline(yintercept = 0, linetype = 3, size = 1) +   
  geom_vline(xintercept = 0, linetype = 3, size = 1) +  
  guides(shape = guide_legend(title = NULL, color = "black"),         
         fill = guide_legend(title = NULL)) +  
  theme_bw() + theme(panel.grid = element_blank())
p  

######RLQ整体分析P值检验######
set.seed(202508)
rlq.aravo <- rlq(acpR.aravo, afcL.aravo, acpQ.aravo,
                 nf=8, scannf=FALSE)
rtest <- randtest(rlq.aravo, nrepet=9999, modeltype=5)
rtest
######RLQ物种因子与环境因子的相关性热图（用python重新画了）######
set.seed(202508)
fourth.aravo <- fourthcorner(  
  tabR = env,   
  tabL = spe,   
  tabQ = traits,  
  modeltype = 5,
  p.adjust.method.G = "none",   
  p.adjust.method.D = "none",   
  nrepet = 9999)


fourth.aravo.adj <- p.adjust.4thcorner(  
  fourth.aravo,  
  p.adjust.method.G = "fdr",   
  p.adjust.method.D = "fdr",   
  p.adjust.D = "global") 

fourth.aravo.adj

plot(fourth.aravo.adj,     
     alpha = 0.05, 
     #相关性阈值     
     stat = "D"
     #D、D2和G其实就是看一下边框     
)

# RLQ+四角
plot(fourth.aravo.adj,     
     x.rlq = rlq.aravo,     
     alpha = 0.05,
     #相关性阈值     
     stat = "D",     
     type = "biplot")

######查看环境因子在RLQ分析中的的显著性######
set.seed(202508)
result <- fourthcorner.rlq(
  rlq.aravo,
  type = "R.axes",
  p.adjust.method.D = "none",  
  p.adjust.method.G = "none"   
)

