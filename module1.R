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

qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles")

qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles", main = "Cylinders in mtcars")

qplot(mtcars$hp, geom="histogram", bins = 15)

qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"))

qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"),xlim=c(50,350), xlab = "Horsepower", ylab= "Number of Cars")

qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0.5),
      main = "Histogram")

barp <- ggplot(mtcars, aes(x=1, y=sort(mtcars$carb), fill=sort(mtcars$carb))) +
  geom_bar(stat="identity")
print(barp)

barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y=element_blank(),
  panel.background=element_blank())
print(barp)