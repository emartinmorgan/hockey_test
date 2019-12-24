library(readxl);library(data.table);library(tidyverse);
data1 <- read_excel("~/Desktop/Lobular/lobular collection 7 31 18.xlsx")
data2 <- data.table::fread('~/Desktop/Lobular/CCTS3979AssessmentOf_DATA_2019-12-23_0813.csv')
data3 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Main data")
data4 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Ca Reg chemo")
data5 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Ca Reg hormone tx")
data6 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Ca Reg immunotx")
data7 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Ca Reg surgery")
data8 <- read_excel("~/Desktop/Lobular/TASK1015573_HBOC644_Main data report_20190605.xlsx",sheet = "Addl Ca Reg Data Rows")

df<-data.frame(merge(data1,data2,all = TRUE))#,by='pat_mrn_id',no.dups = TRUE) # use this and you get duplicate col names
df<-merge(df,data3,all = TRUE)
df<-merge(df,data4,all = TRUE)
df<-merge(df,data5,all = TRUE)
df<-merge(df,data6,all = TRUE)
df<-merge(df,data7,all = TRUE)
df<-merge(df,data8,all = TRUE)


library(plyr)
unique(df$Sex)
df$Sex=revalue(df$Sex, c("M"="male", "F"="female","Female"="female"))
unique(df$Race)
df$Race=revalue(df$Race, c("white"="01  White", "black, not hispanic"="02  Black","other, not hispanic"="98  Other"))
