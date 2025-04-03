library(lmtest)
library(DescTools)
library(nortest)

df = read.csv("Data", sep = ';')
df
attach(df)

model.df = lm(Jumlah.Tindak.Pidana~Tingkat.Pengangguran, data = df)
model.df

#Uji Asumsi
#1. Normalitas
error = resid(model.df)
shapiro.test(error)

#2.Autokorelasi_df
dwtest(model.df)

#3.Homoskedastisitas_df
bptest(model.df)

#TRASFORMASI DATA_df
trans.log = log10(df)
trans.log
Trans_df =lm(Jumlah.Tindak.Pidana~Tingkat.Pengangguran, data = trans.log)
Trans_df

#Uji Asumsi Setelah Transformasi
#1.Normalitas_df
error.trans = resid(Trans_df)
shapiro.test(error.trans)

#2.Autokorelasi_df
dwtest(Trans_df)

#3.Homoskedastisitas_df
bptest(Trans_df)



#=============================================================================================
#Memanggil Data
data = read.csv()
data
attach(data)

#Membuat model
model.awal = lm(Y ~ X, data = data)
model.awal

#Uji Asumsi
#1. Normalitas
error = resid(model.awal)
shapiro.test(error)

#2. Homoskedastisitas
bptest(model.awal)

#3. Autokorelasi
dwtest(model.awal)

#TRANSFORMASI
trans.akar = sqrt(data)
trans.akar
model.trans1 = lm(Y ~ X, data = trans.akar)
model.trans1

trans.log = log10(data)
trans.log
model.trans2 = lm(Y ~ X, data = trans.log)
model.trans2

trans.arcsin = asin(data)
trans.arcsin
model.trans3 = lm(Y ~ X, data = trans.arcsin)
model.trans3

trans.kuadrat = sqrt(data)
trans.kuadrat
model.trans4 = lm(Y ~ X, data = trans.kuadrat)
model.trans4

trans.kubik = (data)^3
trans.kubik
model.trans5 = lm(Y ~ X, data = trans.kubik)
model.trans5

trans.inverse = 1/(data)
trans.inverse
model.trans6 = lm(Y ~ X, data = trans.inverse)
model.trans6

trans.inverseakar = 1/sqrt(data)
trans.inverseakar
model.trans7 = lm(Y ~ X, data = trans.inverseakar)
model.trans7

trans.inversekuadrat = 1/((data)^2)
trans.inversekuadrat
model.trans8 = lm(Y ~ X, data = trans.inversekuadrat)
model.trans8

trans.inversekubik = 1/((data)^3)
trans.inversekubik
model.trans9 = lm(Y ~ X, data = trans.inversekubik)
model.trans9

#Uji Asumsi Setelah Transformasi
#1. Normalitas
error.trans = resid(model.trans2)
shapiro.test(error.trans)

#2. Homoskedastisitas
bptest(model.trans2)

#3. Autokorelasi
dwtest(model.trans2)














