#Load and prepare the dataset
data(iris)
#use only numeric variables
iris_num<- iris[,1:4]
#Compute correlation matrix
corr_matrix<-cor(iris_num)
corr_matrix
#basic correlation matrix
heatmap(
  corr_matrix,
  col=colorRampPalette(c("blue","white","red"))(100),
  main="Correlation Heatmap of Iris Dataset"
)
#Heatmap with Correlation Values
heatmap(
  corr_matrix,
  col = colorRampPalette(c("blue","white","red"))(100),
  Rowv=NA,
  Colv=NA,
  scale="none",
  main="Correlation Heatmap of Iris Dataset"
)
text(
  rep(1:ncol(corr_matrix), each=nrow(corr_matrix)),
  rep(nrow(corr_matrix):1, ncol(corr_matrix)),
  round(corr_matrix,2))
#correlogram using `corrplot` (most popular)
#Install package
#correlogram with values
ggplot(corr_long, aes(Var1, Var2, fill=value))+
  geom_tile()+
  geom_text(aes(label=round(value,2)))+
  scale_fill_gradient2(
    low="blue",
    mid="white",
    high="red",
    midpoint=0
  )+
  theme_minimal()
#Advanced correlogram using ggally
install.packages("GGally")
library(GGally)
ggcorr(
  iris_num,
  label = TRUE,
  label_round = 2
)
#Advanced scatter correlogram
library(GGally)
ggpairs(iris,
        coloumns = 1:4,
        aes(color = Species))
