#Load & Understand the dataset
data(diamonds)
data(package=.packages(all.available=TRUE))
library(ggplot2)
data(diamonds)
str(diamonds)
dim(diamonds)
?diamonds

#Very basic Scatter
plot(diamonds$carat, diamonds$price)

#Improved Scatter
plot(diamonds$carat, diamonds$price,col=rgb(0,0,1,0.1), pch = 16,
     main = "Scatter Plot: Carat VS Price")

#Hexbin using base R
install.packages('hexbin')
library(hexbin)
hb<-hexbin(diamonds$carat, diamonds$price,xbins=40)
plot(hb,main="Hexbin Plot")

#Basic hexbin
ggplot(diamonds,aes(x=carat,y=price))+
  geom_hex()

#Labeled hexbin plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs( title="Hexagon Binning: Diamond Sructure", x="Carat", y="Price")+
  theme_minimal()

#control hexagon density
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=10)+
  theme_minimal()

#Add color palette(Gradient)
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="skyblue",high="navyblue")+
  theme_minimal()
#Color meaning:
#-Light-> fewer diamonds
#Dark-> denser region
#professional palette(viridis)
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=35)+
  scale_fill_viridis_c()+
  theme_minimal()
#Add legend title
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=20)+
  scale_fill_viridis_c(name="Count")+
  labs( title="Density Structure of Diamonds", x="Carat", y="Price")+
  theme_minimal()
#Faceted Hexbin
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  scale_fill_viridis_c()+
  facet_wrap(~cut)+
  theme_minimal()
#Log scale hexbin
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  scale_fill_viridis_c()+
  scale_y_log10()+
  theme_minimal()

