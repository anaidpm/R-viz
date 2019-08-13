count <- table(mtcars$cyl)
barplot(count)

if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)

qplot(mtcars$cyl, geom = "bar")

ggplot(data= mtcars, aes(mtcars$hp))  + 
  geom_histogram(breaks=seq(40, 350, by = 25),  
                 colour = I("black"),
                 aes(fill=..count..))

head(mtcars)

summary(mtcars)

mean(mtcars$cyl)

qplot(mtcars$cyl, geom = "bar", fill = I("black"), colour = I("red"))
