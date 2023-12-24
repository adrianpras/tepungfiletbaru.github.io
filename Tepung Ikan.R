setwd("D:/METOPEL UAS/SAY METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("TPI1.xlsx")
dat <- read_excel("TPI1.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))


#Regresi Multivariat
    #X = Inflasi, Y = Ekspor ikan filet, S = Ekspor Tepung Ikan

reg1<-lm(data=dat,filet~inflasi+tepung) #Y~X+S
summary(reg1) 
#S berpengaruh terhadap Y,

#plot error
dat$m<-resid(reg1)
plot(dat$filet,dat$m,xlab="FOB Ikan Filet",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

plot(dat$inflasi,dat$m,xlab="Presentase Inflasi",ylab="error")
abline(h=0)


