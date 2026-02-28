airquality
class(airquality)
hist(airquality$Temp)

View(airquality)

hist(airquality$Temp,
     breaks=5,
     main= "Basic Histogram of Air Quality",
     xlab= "Temperature",
     ylab= "Range",
     labels=TRUE,
     col = "grey",
     border = "black")

library(ggplot2)
ggplot(
  airquality,
  aes(x=Temp)
)+
  geom_histogram(
    bins = 12,
    fill = "grey",
    col = "black")+
  labs(
    title= "GGPLOT- Histogram for Air Quality",
    x = "Temperature",
    y = "Range" ) +
  theme_light()