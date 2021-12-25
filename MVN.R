library(MVN)
library(tidyverse)
library(plm)
data("Crime")
glimpse(Crime)
ggplot(Crime, aes(x=Crime$avgsen)) + geom_density()
# Crime$prbpris - точно, avgsen - 70/30, pctymle - 50/50
Data_1 <- Crime[,c(6,7)]
Data_2 <- Crime[,c(6,7,24)]
# Способ 1
res_1_1 <- mvn(data = Data_1, mvnTest = "mardia")
res_1_1
res_1_2 <- mvn(data = Data_2, mvnTest = "mardia")
res_1_2
# Способ 2
res_2_1 <- mvn(data = Data_1, mvnTest = "hz")
res_2_1
res_2_2 <- mvn(data = Data_2, mvnTest = "hz")
res_2_2
# Способ 3
res_3_1 <- mvn(data = Data_1, mvnTest = "royston")
res_3_1
res_3_2 <- mvn(data = Data_2, mvnTest = "royston")
res_3_2
# Способ 4
res_4_1 <- mvn(data = Data_1, mvnTest = "dh")
res_4_1
res_4_2 <- mvn(data = Data_2, mvnTest = "dh")
res_4_2
# Способ 5
res_5_1 <- mvn(data = Data_1, mvnTest = "energy")
res_5_1
res_5_2 <- mvn(data = Data_2, mvnTest = "energy")
res_5_2
# Рисунки
mvn(data = Data_1, mvnTest = "mardia", multivariatePlot = "qq")
mvn(data = Data_1, mvnTest = "energy", multivariatePlot = "persp")
mvn(data = Data_1, mvnTest = "energy", multivariatePlot = "contour")
# Рисунки
mvn(data = Data_1, mvnTest = "mardia", univariatePlot = "qqplot")
mvn(data = Data_2, mvnTest = "mardia", univariatePlot = "histogram")
mvn(data = Data_2, mvnTest = "mardia", univariatePlot = "scatter")
# Статистика по отдельным переменным
mvn(data = Data_2, mvnTest = "mardia", univariateTest = "SW")
# Выбросы
mvn(data = Data_2, mvnTest = "mardia", multivariateOutlierMethod = "quan")
# SubSet
mvn(data = Crime[,c(6,7,11)], subset = "region" ,mvnTest = "mardia")
