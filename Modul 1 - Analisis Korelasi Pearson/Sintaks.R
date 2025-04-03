library(openxlsx)

df = read.xlsx("Data.xlsx")
df

attach(df)
cor.test(suhu, aktivitas_uranium, method="pearson")