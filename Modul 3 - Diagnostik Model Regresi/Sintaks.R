library(nortest)
library(lmtest)

library(openxlsx)
df= read.xlsx("Data.xlsx")
df

attach(df)

dfi = lm(IPM ~ Angka.Harapan.Hidup + Rata.rata.Lama.Sekolah)
dfi


#asusmsi kenormalan data
model = lm(IPM ~ Angka.Harapan.Hidup + Rata.rata.Lama.Sekolah)
galat = residuals(model)
ad.test(galat)

#asumsi autokorelasi antar pengamatan
library(lmtest)
model = lm(IPM ~ Angka.Harapan.Hidup + Rata.rata.Lama.Sekolah)
dwtest(model)

#uji ragam galat homogen
library(lmtest)
model = lm(IPM ~ Angka.Harapan.Hidup + Rata.rata.Lama.Sekolah)
bptest(model)


library(car)
model = lm(IPM ~ Angka.Harapan.Hidup + Rata.rata.Lama.Sekolah)
vif(model)