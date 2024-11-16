install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(readr)
HOGAR_BDP <- read_csv("HOGAR_BDP.csv")


arbol <- rpart(AREA ~
                 PCH4+
                 PCH5+
                 PCH6+
                 PCH7+
                 PCH8+
                 PCH10+
                 PCH14,
               data = HOGAR_BDP, method = "class")

rpart.plot(arbol, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, box.palette = "BuGn", 
           main ="Predicción de área", cex = 1)

hogar <- data.frame(
  PCH4=c(1),
  PCH5=c(2),
  PCH6=c(1),
  PCH7=c(1),
  PCH8=c(1),
  PCH10=c(5),
  PCH14=c(1)
)

result <- predict(arbol,hogar, type="class")

result
