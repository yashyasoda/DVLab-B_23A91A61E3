#Load andunderstand the HairEyeColor Dataset
#Load dataset
data(HiarEyeColor)

#Check structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor

#Very basic Mosaic Plot(Base R)
mosaicplot(HairEyeColor)

#Add Titles and Colors
mosaicplot(HairEyeColor,main="Mosaic Plot:Hiar,Eye Color and Sex",
           color = TRUE)

#Two-Variable Mosaic Plot
HairEye2D <- margin.table(HairEyeColor,c(1,2))
mosaicplot(HairEye2D, maiin="Hair vs Eye Color mOsaic Plot",
           color=TRUE)
#Mosaic plots by sex
par(mfrom =c(1,2))
mosaicplot(HairEyeColor[,,"Male"],main="Male",color=TRUE)
mosaicplot(HairEyeColor[,,"Female"],main="Female",color=TRUE)
par(mfrom=c(1,1))

#Custom Colors
mosaicplot(HairEye2D, col=c("orange","black","pink","skyblue"),
           main="Hair vs Eye Color(Custom Colors)")

#Advance Mosaic Plot using 'vcd'
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor,shade=TRUE,legend=TRUE,
       main="Shaded mosaic Plot(vcd)")

#COnvert Dataset to Data Frmae(For ggplot)
hair_eye_df <- as.data.frame(HairEyeColor)
head(hair_eye_df)

#ggplot Alternative(Proportional Mosaic-Style Plot)
library(ggplot2)
ggplot(hair_eye_df,aes(x=Hair,y=Freq,fill=Eye))+
  geom_bar(stat="identity",position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proportional Distribution of Eye Color by Hair",
    y="Proportion"
  )+
  theme_minimal()

#Advance MOsaic with Residual Shading
mosaic(~Hair + Eye + Sex, data=hair_eye_df,shade=TRUE,legend=TRUE)

