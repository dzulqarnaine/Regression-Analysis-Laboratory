library(openxlsx)
library(DescTools)  

data = read.xlsx("Data.xlsx")
data

attach(data)

#membuat model
model=lm(Y~X, data=data)
model

galat=residuals(model)
galat  
  
#mencari nilai r-standar dan r student untuk mencari pencilan
rstandard(model)
rstudent(model)
Outlier(galat)

#melihat apakah pencilan tersebut berpengaruh
influence.measures(model)