?VADeaths

class(VADeaths)

help(class)

va_df <- as.data.frame(VADeaths)

class(va_df)

View(va_df)

va_df

va_long = reshape(va_df,
                  direction = "long",
                  varying = colnames(VADeaths),
                  v.names = "DeathRate",
                  timevar = "Population",
                  times = colnames(VADeaths)
                  )
View(va_long)
hist(va_long$DeathRate)

hist(va_long$DeathRate,
     main= "Basic Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE)

hist(va_long$DeathRate,
     main= "Basic Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE,
     col = "pink",
     border = "blue")

hist(va_long$DeathRate,
     breaks = 5,
     main= "Basic Histogram of VA Deathrates",
     xlab = "VA Deathrates",
     ylab = "Frequency",
     labels = TRUE,
     col = "pink",
     border = "purple")

library(ggplot2)
ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(fill="navyblue",col="black")

library(ggplot2)
ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(
    bins = 10,
    fill="chocolate",
    col="black")+
  labs(
    title="GGPLOT-Histogram",
    y = "Frequency")+
  theme_dark()

