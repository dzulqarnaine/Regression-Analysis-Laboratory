library(pastecs)
library(DescTools)
library(nortest)
library(lmtest)
library(car)
library(openxlsx)

df = read.xlsx("Data.xlsx")
df
attach(df)

str(df)
summary(df)

model_lb = lm(Y~X1+X2, data = df)
model_lb

#Uji asumsi
#Uji Asumsi Kenormalan data
galat=residuals(model_lb)
ad.test(galat)

#Uji Asumsi autokorelasi
dwtest(model_lb)

#Uji Asumsi galat homogen
bptest(model_lb)

#Uji Multikolinearitas
VIF(model_lb)

#Uji sarempak, parsial, dan koefisien determinasi
summary(model_lb)

