library(nortest)
library(DescTools)
library(lmtest)

#memanggil data
df=read.csv("Data.csv", sep = ';')
df

#melihat korelasi antar variabel bebas
cor(df[,-1])
cor(df)

#Membuat model
attach(df)
model.b=lm(nilai~ emosi + kemandirian + motivasi + 
             kerajinan + jambelajar, data=df)
model.b

#Uji parsial, uji serempak, dan Melihat koefisien determinasi
summary(model.b)

library(DescTools)
#Melakukan pengujian multikolinearitas
VIF(model.b)

#Jika terdapat multikolinearitas atau variabel tidak signifikan maka dilakukan regresi df

#melihat model terbaik
#Melakukan backward
modelbackward1=lm(nilai~emosi + kemandirian + motivasi + kerajinan + jambelajar, data=df)
summary(modelbackward1)
AIC(modelbackward1)

# ulangi hingga mendapat P-value yang signifikan 
# -dengan menghapus nilai P-value yang terbesar
modelbackward2=lm(nilai~kemandirian + motivasi + kerajinan + jambelajar, data=df)
summary(modelbackward2)
AIC(modelbackward2)

modelbackward3=lm(nilai~kemandirian + motivasi + jambelajar, data=df)
summary(modelbackward3)
AIC(modelbackward3)

modelbackward4=lm(nilai~motivasi + jambelajar, data=df)
summary(modelbackward4)
AIC(modelbackward4)

modelbackward5=lm(nilai~ jambelajar, data=df)
summary(modelbackward5)
AIC(modelbackward5)


#Mengecek kembali
AIC(modelbackward1, modelbackward2, modelbackward3, modelbackward4, modelbackward5)

#Membuat model baru dengan metode stepwise
meodelstepwise =step(model.b, direction = "both")
summary(meodelstepwise)
#modelforward = step(model.b, direction = "forward")
#summary(modelforward)
#modelbackward = step(model.b, direction = "backward")
#summary(modelbackward)

modelbaru=lm(nilai ~ kemandirian + motivasi + jambelajar, data=df)
summary(modelbaru)

