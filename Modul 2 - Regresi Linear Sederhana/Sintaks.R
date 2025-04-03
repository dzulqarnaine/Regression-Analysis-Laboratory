# Praktikum 2 Analisis Regresi

#-----------------------ANALISIS REGRESI LINEAR SEDERHANA-----------------------------------------------
# Import library
library(lmtest)

library(openxlsx)

# Membaca data 
df = read.xlsx("Data.xlsx")
df
attach(df)

# Membuat Model Regresi Linear Sederhana
model.regresi = lm(IPM~Angka.Buta.Huruf, data = df)
model.regresi

#Uji Serempak (Uji F)
#Hipotesis
#Ho : Model tidak signifikan
#H1 : Model telah signifikan

##Uji parsial 
#Bo
#Ho : Bo = 0
#H1 : Bo =/ 0
#B1
#Ho : Variabel X tidak berpengaruh terhadap variabel Y
#H1 : Variabel X berpengaruh terhadap variabel Y 

summary(model.regresi)