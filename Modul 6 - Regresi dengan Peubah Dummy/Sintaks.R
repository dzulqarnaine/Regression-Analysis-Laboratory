library(openxlsx)
library(DescTools)

df = read.xlsx("Data.xlsx", sheet=2)
df

attach(df)

summary(df)

#membuat model
Modeldf = lm(Spending~Salary+State, data=df)
Modeldf
summary(Modeldf)