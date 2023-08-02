rm(list=ls())
set.seed(123)

##Importing data from R using different database##
url<- "https://download.asic.gov.au/short-selling/RR20221230-001-SSDailyYTD.csv"
SS_22<-read.csv(url)
View(SS_22)

url1<- "http://global-q.org/uploads/1/2/2/6/122679606/q5_factors_monthly_2022.csv"
qf_monthly<- read.csv(url1)
View(qf_monthly)

url3<-"https://www.ivo-welch.info/professional/goyal-welch/goyal-welch-a.csv"
MP_GoFe<- read.csv(url3)
View(MP_GoFe)

##Data extraction from Excel##
install.packages("readxl")
library(readxl)

url4<-"https://www.rba.gov.au/statistics/tables/xls-hist/f02histhist.xls"
temp<- tempfile(fileext = "xls")
download.file(url4,temp,mode = 'wb')
tb_aus_monthly<- read_excel(temp)
unlink(temp)
View(tb_aus_monthly)

##better way##
url4<-"https://www.rba.gov.au/statistics/tables/xls-hist/f02histhist.xls"
temp<- tempfile(fileext = "xls")
download.file(url4,temp,mode = 'wb')
tb_aus_monthly1<- read_excel(temp, skip = 10)
unlink(temp)
View(tb_aus_monthly1)

##even better##
temp<- tempfile(fileext = "xls")
download.file(url4,temp,mode = 'wb')
tb_aus_monthly2<- read_excel(temp, skip = 11, col_names= F)
unlink(temp)
View(tb_aus_monthly2)
#names(tb_aus_monthly2)<- c("date", "cw2yr", "cw3yr")


##collecting data from API-XML AND JSON##

install.packages("wbstats")
library(wbstats)
gdpc_australia<- wb_data("NY.GDP.PCAP.CD", country = "AU",start_date = 1970, end_date = 2020)
View(gdpc_australia)
